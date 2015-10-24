get '/questions/new' do
  if session[:user_id]
    erb :"/questions/create_question"
   else
    @login_error = "You must be logged in."
    erb :"/users/login"
  end
end

post '/questions' do
  user = User.find(session[:user_id])
  new_question = user.questions.create(title: params[:title], body: params[:body])
  redirect "/questions/#{new_question.id}"
end

get '/questions/:id' do
  question = Question.find(params[:id])
  erb :"questions/view_question", locals: {question: question}
end
