class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :birthday, :active
  validates :email, :uniqueness => true
  validate :age_checking
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

private
  def age_checking
    errors.add(:birthday, "U are too small, baby") unless
    Time.now.utc.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0) > 15
  end

end
