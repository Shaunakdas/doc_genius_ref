Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => {:format => :json} do  
    resources :analytics  do 
      collection do
        get 'analytics' => 'analytics#index'
      end
    end
  end
  # Login
  # Sign up User. Req: (Name, Email, Username, Mobile, OAuth/Password, Age). Response: ()
  post "sign_up" => "login#sign_up"
  # Login User. Req: (Login(Email/Username/Mobile), OAuth/Password). Response: (Auth token)
  post "login" => "login#login"
  # Logout User. Req: (Auth token). Response: ()
  post "logout" => "login#logout"
  # Activate User by verifying OTP. Req: (Login, OTP). Response: ()
  post "activate" => "login#activate"
  
  # Passwords
  # Forgot Password. Req: (Login). Response: ()
  post "password/forgot" => "passwords#forgot"
  # Reset Password. Req: (Username, OTP). Response: ()
  get "password/reset" => "passwords#reset"
  # Modify Password. Req: (Login, New Password). Response: (Auth Token)
  put "password/modify" => "passwords#modify"

  # Users
  # Get Users List using search, filter and pagination. Req: (Admin Auth token, Role, Standard, Region, TargetExam, Query, Board, Page, Limit). Response: (User Array)
  get "users" => "users#index"
  # Create User. Req: (Admin Auth token, Name, Email, Username, Mobile, OAuth/Password, Age). Response: (Auth token)
  post "user" => "users#create"
  # Get User Details. Req: (Admin Auth token, id, login)
  get "user" => "users#details"
  # Get User Details. Req: (Auth token)
  get "user/me" => "users#me"
  # Updates User Details. Req: (Auth token)
  put "user" => "users#update"
  # User Invite . Create User
  post "user/invite" => "users#invite"
  # Image Upload(Will take username or email)
  post "photo/profile" => "users#photo_upload"
  # Delete User Req: (Admin AuthToken, User Id)
  delete "user" => "users#delete"

  # CRUD Operations https://www.railstutorial.org/book/updating_and_deleting_users
  # Categories
  # Get List of Categories based on page, standard(User AuthToken needed)
  get "categories" => "categories#index"
  # Get Details of single Category based on category_id (User AuthToken needed)
  get "category" => "categories#detail"
  # Creates Category (Admin AuthToken needed)
  post "category" => "categories#create"
  # Updates Category (Admin AuthToken needed)
  put "category" => "categories#update"
  # Updates Category (Admin AuthToken needed)
  delete "category" => "categories#delete"

  # Games
  # Get homepage personalized to each user. Response(List of Question Types with all its acad_entities)
  get "homepage" => "question_types/homepage"
  # Get List of Question Types based on standard, page and limit(User AuthToken needed)
  get "games" => "question_types#index"
  # Get Details of single Question Type based on game_id (User AuthToken needed)
  get "game" => "question_types#detail"

  # Game Session
  # Starts Game Session Req: (AuthToken, GameHolder Id) Response: (List of Game Question Objects)
  post "session/start" => "game_sessions#start"
  # Ends Game Session Req: (AuthToken, Session Id, Session Attempt Object) Response: (List of RegionPercentileScores of Gameholder for regions)
  put "session/end" => "game_sessions#end"

  # Scores
  # Gets Scores Req: (Auth Token) Response: (Overall Score)
  get "score" => "scores/overall"
  # Gets Streamwise/ Chapterwise Scores Req: (Auth Token) Response: (List of chapters with AcadEntityScore)
  get "scores/chapterwise" => "scores/chapter_list"
  # Gets Detailed Chapterwise Scores Req: (Auth Token, ChapterId) Response: (Best Score, Rank, Last 10 Session Score Objects)
  get "scores/chapterwise_detailed" => "scores/chapter_detailed"

  
  # Rankings
  # Gets Rankings Req: (Auth Token) Response: (Overall Score)
  get "score" => "rankings/overall"
  # Gets Streamwise/ Chapterwise Rankings Req: (Auth Token) Response: (List of chapters with AcadEntityScore)
  get "rankings/chapterwise" => "rankings/chapter_list"
  # Gets Detailed Chapterwise Rankings Req: (Auth Token, ChapterId) Response: (Best Score, Rank, Last 10 Session Score Objects)
  get "rankings/chapterwise_detailed" => "rankings/chapter_detailed"

  # Get Feedback
  post "feedback" => "notifications#feedback"

  #Chats
  # Send message from chatbot
  post "chats/send_ai_message" => "chats#send_ai_message"
end
