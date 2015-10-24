get "/questions/:id/votes/new" do
  vote = Vote.create(votable_type: "Question", votable_id: params[:id])
  question = Question.find(params[:id])
  question.votes.count.to_s
end

delete "/questions/:id" do
  question = Question.find(params[:id])
  if question.votes.count > 0
    question.votes.last.destroy
  end
  question.votes.count.to_s
end

get "/answers/:id/votes/new" do
  vote = Vote.create(votable_type: "Answer", votable_id: params[:id])
  answer = Answer.find(params[:id])
  {answer_id: params[:id], vote_tally: answer.votes.count.to_s}.to_json
end

get "/answers/:id/votes/delete" do
  answer = Answer.find(params[:id])
  if answer.votes.count > 0
    answer.votes.last.destroy
  end
  answer.votes.count.to_s
end

get "/comments/:id/votes/new" do
  vote = Vote.create(votable_type: "Comment", votable_id: params[:id])
  comment = Comment.find(params[:id])
  comment.votes.count.to_s
end

get "/comments/:id/votes/delete" do
  comment = Comment.find(params[:id])
  if comment.votes.count > 0
    comment.votes.last.destroy
  end
  comment.votes.count.to_s
end
