class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :feed
  
  validates :content, presence: true
end
