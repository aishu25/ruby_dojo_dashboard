class Dojo < ActiveRecord::Base
	has_many :students, dependent: :destroy
	validates :branch, :street, :city, :states, presence: true
end
