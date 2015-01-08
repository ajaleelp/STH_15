class User < ActiveRecord::Base
	belongs_to :team
	has_many :comments
	extend FriendlyId
	friendly_id :name, use: :slugged
end
