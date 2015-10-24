get '/questions/:id/answers/new' do
  if session[:user_id]
    question_id = params[:id]
    erb :"/answers/create_answers", locals: {question_id: question_id}, :layout => false
  else
    @login_error = "You must be logged in."
    erb :"/users/login"
  end
end

post '/questions/:id/answers' do
  question = Question.find(params[:id])
  new_answer = question.answers.create(content: request[:content], user_id: session[:user_id])
  erb :"/answers/partial_answer", locals: {new_answer: new_answer}, :layout => false
  # redirect "/questions/#{params[:id]}"
end

get '/answers/:id/comments/new' do
  if session[:user_id]
    answer_id = params[:id]
    erb :"/answers/create_comments", locals: {answer_id: answer_id}
  else
    @login_error = "You must be logged in."
    erb :"/users/login"
  end
end

post '/answers/:id/comments' do
  answer = Answer.find(params[:id])
  answer.comments.create(content: params[:content], user_id: session[:user_id])
  # redirect "/questions/#{answer.question.id}"
end
