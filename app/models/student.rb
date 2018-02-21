class Student < ActiveRecord::Base
  belongs_to :dojo
  email_regex = /\A[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]{3}/
  validates :first_name, :last_name, :email, presence: true
  validates :email,
	uniqueness: { case_sensitive: false}, 
  	presence: true,
  	format: { with: email_regex }
  before_save :downcase_email

  def downcase_email
  	self.email.downcase!
  end
end
