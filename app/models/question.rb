class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, through: :answers
  has_many :votes, as: :votable
end
