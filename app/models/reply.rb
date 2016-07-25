class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :users, dependent: :destroy
end
