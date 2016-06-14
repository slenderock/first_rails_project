class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :birthday, :active

  before_save :check_name_presence

  scope :active_user, ->  { where active: true }
  scope :oldfag,      ->  { active_user.where('birthday <= ?', Time.now - 21.year) }
  scope :search,      ->  (first_name, last_name)  { where(first_name: first_name, last_name: last_name)}

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, :uniqueness => true
  validates :birthday, :presence => true
  validate :age_checking

  private

  def check_name_presence
    self.active = !first_name.blank? && !last_name.blank?

    true
  end

  def age_checking
    errors.add(:birthday, "U are too small, baby") if birthday && (Time.now.utc.year - birthday.year) < 15
  end
end
