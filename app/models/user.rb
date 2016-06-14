class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :birthday, :active

  before_save :check_name_presence

  scope :active_user, ->  { where active: true }
  scope :oldfag,      ->  { active_user.where('birthday <= ?', Time.now - 21.year) }

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, :uniqueness => true
  validates :birthday, :presence => true
  validate  :age_checking

  private

  def self.search (full_name)                 #I will change this method, for less monkey code but now I'll move up
    splited_name = full_name.split(' ')
    find_by_first_name_and_last_name(splited_name.first, splited_name.last)
  end

  def check_name_presence
    self.active = first_name.present? && last_name.present?
  end

  def age_calculate
    now = Time.now.utc
    now.year - birthday.year - (birthday.to_time.change(:year => now.year) > now ? 1 : 0)
  end

  def age_checking
    errors.add(:birthday, "U are too small, baby") if birthday && age_calculate < 15
  end
end
