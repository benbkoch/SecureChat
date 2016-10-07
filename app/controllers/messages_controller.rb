class MessagesController < ApplicationController
	before_action :authenticate_user!
	before_action do
		#@current_user = current_user
	   @conversation = Conversation.find(params[:conversation_id])
	   check_user
	end

	def index
		userNum = @conversation.one_or_2?(current_user)
		if(userNum == 1)
			@messages = @conversation.messages.where(read_by_1: false).order(:created_at)
		else
			@messages = @conversation.messages.where(read_by_2: false).order(:created_at)
		end

		render json: @messages
		puts 'suh dude'
		@messages.each do |message|
			message.mark_read(current_user)
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
