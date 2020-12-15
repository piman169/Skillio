class User < ApplicationRecord
    has_secure_password
    has_many :posts
  
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}

    # 能動的関係
    has_many :relationships, dependent: :destroy
    has_many :followings, through: :relationships, source: :follow
    # 受動的関係
    has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
    has_many :followers, through: :reverse_of_relationships, source: :user

    def follow(other_user)
        unless self == other_user
          self.relationships.find_or_create_by(follow_id: other_user.id)
        end
    end
    
    def unfollow(other_user)
        relationship = self.relationships.find_by(follow_id: other_user.id)
        relationship.destroy if relationship
    end
    
    def following?(other_user)
        self.followings.include?(other_user)
    end
    
end
