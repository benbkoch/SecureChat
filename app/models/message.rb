class Message < ActiveRecord::Base
 belongs_to :conversation
 belongs_to :user
 validates_presence_of :body, :conversation_id, :user_id

 	def one_or_2?(user)
 		if self.conversation.sender = user
 			return 1
 		else
 			return 2
 		end
 	end

 	def mark_read(user)
 		if self.conversation.sender = user
 			self.read_by_1 = true
 		else
 			self.read_by_2 = true
 		end
 		self.save
 	end
end