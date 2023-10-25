class TicketsController < ApplicationController
    before_action :authenticate_user!

    def create
        @item = Item.find(params[:item_id])

        #Checks if the current user is the one who posted the item
        if current_user == @item.user
            flash[:alert] = "You cannot buy tickets for your own item"
            redirect_to items_path and return
        end

        #Checks if the user already has a ticket for this item
        if @item.tickets.where(user: current_user).exists?
            flash[:alert] = "You have already bought a ticket for this item"
            redirect_to items_path and return
        end

        #Checks if the item has sold out
        if @item.tickets.count >= @item.max_tickets
            flash[:alert] = "Sorry, this item has sold out of tickets"
            redirect_to items_path and return
        end

        #Logic to handle the purchase of a ticket
        @ticket = @item.tickets.build(user: current_user)
        if @ticket.save
            flash[:notice] = "Ticket purchased successfully"
            redirect_to items_path and return
        else
            flash[:alert] = @ticket.errors.full_messages.join(", ")
            redirect_to items_path and return
        end
    end
end
