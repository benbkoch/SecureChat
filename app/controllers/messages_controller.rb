class MessagesController < ApplicationController
	before_action :authenticate_user!
	before_action do
		#@current_user = current_user
	   @conversation = Conversation.find(params[:conversation_id])
	   check_user
	end

	def index
		@messages = @conversation.messages.where(read: false)
		render json: @messages
		@messages.each do |message|
			message.read = true
			message.save
		end
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
 		if not (current_user.id == @conversation.sender_id or current_user.id == @conversation.recipient_id)
 			render json: {
  			error: "Invalid user!",
  			status: 400
			}, status: 400
		end

	end

end
