class Post < ApplicationRecord
    belongs_to :user

    validates :content, {presence: true, length: {maximum: 140}}
    validates :title, {presence: true, length: {maximum: 30}}
    validates :user_id, {presence: true}
    
end
