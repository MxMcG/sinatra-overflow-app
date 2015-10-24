class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many :votes, as: :votable
end
