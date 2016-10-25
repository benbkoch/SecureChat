# SecureChat

### Server URL
Our server is hosted at https://skynetchat.herokuapp.com

It is currently graded at an A+ on ssllabs.com

[Here is the github for our android client.](https://github.com/benbkoch/SecureChat-AndroidClient)

### API endpoints

* POST /register_user - must post JSON containing email, password, and password_confirmation

* POST /auth_user - must post JSON containing email and password. Will receive JWT token as response

#### The following endpoints require a header named "authorization" with "Bearer %YOUR_JWT_TOKEN%" as the value

* GET /conversations/index - get a list of all other users

* POST /conversations/create - must send "recipient_email" of the person to initiate chat with. Will receive a conversation_id in return.

* POST /messages/create - must send JSON with conversation_id and body

* GET /messages/index - get messages from conversation_id in params of URL