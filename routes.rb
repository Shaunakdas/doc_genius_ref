Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => {:format => :json} do  
    resources :analytics  do 
      collection do
        get 'analytics' => 'analytics#index'
      end
    end
  end
  # Users
  # Get Users List By Role. Search in users based on name. Will Contain Custom User Fields.(allowed only for Head Counselor Auth Token)
  post "sign_up" => "login#sign_up"
  # Get Users List By Role. Search in users based on name. Will Contain Custom User Fields.(allowed only for Head Counselor Auth Token)
  post "login" => "login#login"
  # Get Users List By Role. Search in users based on name. Will Contain Custom User Fields.(allowed only for Head Counselor Auth Token)
  post "logout" => "login#logout"
  # Get Users List By Role. Search in users based on name. Will Contain Custom User Fields.(allowed only for Head Counselor Auth Token)
  post "password/forgot" => "passwords#forgot"
  # Get Users List By Role. Search in users based on name. Will Contain Custom User Fields.(allowed only for Head Counselor Auth Token)
  post "password/modify" => "passwords#modify"
  # Get Users List By Role. Search in users based on name. Will Contain Custom User Fields.(allowed only for Head Counselor Auth Token)
  post "password/reset" => "passwords#reset"


  # Get Users List By Role. Search in users based on name. Will Contain Custom User Fields.(allowed only for Head Counselor Auth Token)
  post "user_list" => "users#index"
  # Get User Details. Response will Contain Custom User Fields (User AuthToken needed)
  get "user" => "users#me"
  # Get User Details by username. Response will Contain Custom User Fields (User AuthToken needed)
  get "user/fetch" => "users#fetch"
  #P Create User, Increase Trust Level, Activate User, Generate Activ Token, Send Email 
  post "user" => "users#create"
  #P User Sign Up . Create User, Increase Trust Level, Generate Activ Token, Send Email
  post "user/sign_up" => "users#sign_up"
  # User Invite . Create User, Increase Trust Level, Generate Activ Token, Send Email. Ony for Counselor
  post "user/invite" => "users#invite"
  #P Activate User based on username and activ token
  post "user/activate" => "users#activate"
  # User Login(Will take username or email)
  post "user/login" => "users#login"
  # Image Upload(Will take username or email)
  post "uploads" => "users#file_upload"
  # Update User Details. Response will Contain Custom User Fields (User AuthToken needed)
  put "user" => "users#update"
  # Delete User Details (User AuthToken needed)
  delete "user" => "users#delete"
  
  # # Passwords
  # Password Forgot. Needs only email/username.
  post "passwords/forgot" => "passwords#forgot"
  #P Password Update. (User AuthToken OR User Acti Token needed)
  post "passwords/update" => "passwords#update"
  # Password Update. Needs Email Token sent through Token.
  post "passwords/reset" => "passwords#update"
  # Categories
  # Get List of Categories (User AuthToken needed)
  get "categories" => "categories#index"
  # Get Details of single Category based on category_id (User AuthToken needed)
  get "category" => "categories#detail"
  # Creates Category (Admin AuthToken needed)
  post "category" => "categories#create"
  # Updates Category (Admin AuthToken needed)
  put "category" => "categories#update"
  # Updates Category (Admin AuthToken needed)
  delete "category" => "categories#delete"
  
  # Questions
  # Get List of Questions Paginated(User AuthToken needed)
  get "questions" => "questions#index"
  # Get Details of a question(User AuthToken needed)
  get "question" => "questions#detail"
  # Creates a question(User AuthToken needed)
  post "question" => "questions#create"
  # Updates a question(User AuthToken needed)
  put "question" => "questions#update"
  # Deletes a question(User AuthToken needed)
  delete "question" => "questions#delete"
  
  # Answers
  # Get List of answers Paginated(User AuthToken needed)
  get "answers" => "answers#index"
  # Get Details of a answer(User AuthToken needed)
  get "answer" => "answers#detail"
  # Creates a answer Or reply to answer(User AuthToken needed)
  post "answer" => "answers#create"
  # Updates a answer(User AuthToken needed)
  put "answer" => "answers#update"
  # Deletes a answer(User AuthToken needed)
  delete "answer" => "answers#delete"
  # Likes a answer(User AuthToken needed)
  post "answer/like" => "answers#like"
  # Unlikes a answer(User AuthToken needed)
  post "answer/unlike" => "answers#unlike"
  # Unlikes a answer(User AuthToken needed)
  get "answer/replies" => "answers#replies"

  #Notifications
  # Get All Notifications
  get "notifications" => "notifications#index"
  # Get All Responses
  get "notifications/responses" => "notifications#responses"
  # Get All Likes Received
  get "notifications/likes_received" => "notifications#likes_received"
  # Mark all notifications received
  put "notifications/mark_read" => "notifications#mark_read"
  # Mark a notification received
  put "notification/mark_read" => "notifications#mark_single_read"
  # Delete a notification
  delete "notification" => "notifications#delete"

  # Get Feedback
  post "feedback" => "notifications#feedback"

  #Chats
  # Send message from chatbot
  post "chats/send_ai_message" => "chats#send_ai_message"
end
