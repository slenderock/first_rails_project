class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :birthday, :active
  validates :email, :uniqueness => true
  validate :age_checking
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  scope :active_user, -> { where active: true }
  scope :oldfag,  ->  { active_user.where('birthday <= ?', Time.now - 21.year) }

  private
  def age_checking
    errors.add(:birthday, "U are too small, baby") unless
    Time.now.utc.year - birthday.year > 15
  end
end
