class MessagesController < ApplicationController
	before_action do
	   :authenticate_user!
	   @conversation = Conversation.find(params[:conversation_id])
	   check_user
	end

	def index
		@messages = @conversation.messages
		@messages.each do |message|
			message.read = true
			message.save
		render json: @messages
	end

	def create
 		@message = @conversation.messages.new(user_id: current_user.id, body: params[:body], conversation_id: params[:conversation_id])
 		if @message.save

 			render json: {
 				message: 'message sent'
 			}

 		else

 			render json: {
 				message: 'error'
 			}

 		end
 	end

	private
 	#def message_params
	#	params.require(:message).permit(:body, :conversation_id)
 	#end

 	def check_user
 		puts current_user.id
 		if not (current_user.id == @conversation.sender_id or current_user.id == @conversation.recipient_id)
 			render json: {
  			error: "Invalid user!",
  			status: 400
			}, status: 400
		end
	end

end