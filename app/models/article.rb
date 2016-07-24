class Article < ActiveRecord::Base
  belongs_to :user #user is singular because of association status#
  has_many :article_categories                      # THESE 2 LINES WORK TOGETHER TO CREATE MANY-MANY ASSOCIATION#
  has_many :categories, through: :article_categories #----------------------------#
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end