get '/' do
  questions = Question.all
  if session[:user_id]
    user = User.find(session[:user_id])
    erb :index, locals: {questions: questions, user: user}
  else
    erb :index, locals: {questions: questions}
  end
end
