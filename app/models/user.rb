# frozen_string_literal: true
# model users
class User < ActiveRecord::Base
  has_many :images, as: :imageable

  accepts_nested_attributes_for :images

  attr_accessor :password

  before_save :encrypt_password

  before_save :check_name_presence

  after_save :check_avatar

  scope :active_user, -> { where active: true }
  scope :oldfag, -> { active_user.where('birthday <= ?', Time.now - 21.year) }

  validates :birthday, presence: true
  validate  :age_checking

  validates_presence_of :email
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_uniqueness_of :email

  validates_presence_of :password, on: :create
  validates :password, length: { minimum: 6, maximum: 30 }
  validates_confirmation_of :password

  def self.authenticate(email, password)
    user = find_by_email(email)
    user if user &&
            user.password_hash == BCrypt::Engine.hash_secret(password,
                                                             user.password_salt)
  end

  private

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def check_name_presence
    self.active = first_name.present? && last_name.present?
  end

  def age_calculate
    now = Time.now.utc
    year = now.year
    difference = birthday.to_time.change(year: year) > now ? 1 : 0
    year - birthday.year - difference
  end

  def age_checking
    if birthday && age_calculate < 15
      errors.add(:birthday, 'U are too small, baby')
    end
  end

  def check_avatar
    images.create! if images.empty?
    images.first.delete while images.count > 1
  end
end
