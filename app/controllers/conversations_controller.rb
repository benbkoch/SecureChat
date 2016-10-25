class ConversationsController < ApplicationController
 before_action :authenticate_request!
	def index
 		@names = User.pluck(:email)
 		@names.delete(current_user.email)
 		@conversations = Conversation.all
      	render json: @names.to_json
 	end

 	def create
 		sender_id = current_user.id
 		recipient_id = User.where(email: params[:recipient_email])[0][:id]
		 if Conversation.between(sender_id,recipient_id).present?
		    @conversation = Conversation.between(sender_id, recipient_id).first
		 else
		  	@conversation = Conversation.create!(sender_id: sender_id, recipient_id: recipient_id)
		 end
		 render json: "{\"id\":#{@conversation.id}}"
	end
end