# UserUploader
class UserUploaderWorker
  include Sidekiq::Worker
  require 'csv'
  require 'securerandom'

  sidekiq_options queue: 'high',
                  retry: false

  def perform(file)
    # User.import(file)
    CSV.foreach(file, headers: true) do |row|
      user_hash = row.to_hash.merge('password' => SecureRandom.hex(8))
      user = User.where(email: user_hash['email'])
      if user.count == 1
        user.first.update_attributes(user_hash)
      else
        User.create!(user_hash)
      end
    end
  end
end
