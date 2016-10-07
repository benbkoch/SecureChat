class ConversationsController < ApplicationController
 before_action :authenticate_user!
	def index
 		@names = User.pluck :email
 		@conversations = Conversation.all
      	render json: @names
      	end
 	end

 	def create
 		sender_id = current_user.id
 		recipient_id = User.where(email: params[:recipient_email])[0][:id]
		 if Conversation.between(sender_id,receiver_id).present?
		    @conversation = Conversation.between(sender_id, recipient_email_id).first
		 else
		  	@conversation = Conversation.create!(sender_id: sender_id, recipient_id: receiver_id)
		 end
		 render json: @conversation.id
	end
end