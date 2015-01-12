class Team < ActiveRecord::Base
	has_many :users
	has_many :solvetimes

	extend FriendlyId
	friendly_id :name, use: :slugged
end
