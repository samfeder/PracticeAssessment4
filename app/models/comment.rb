class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :link
  belongs_to :user

end
