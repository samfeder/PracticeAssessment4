class Link < ActiveRecord::Base

  validates :url, :title, presence: true
  validates :url, :title, uniqueness: true


  belongs_to :user
  has_many :comments


end
