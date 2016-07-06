Image.delete_all
User.delete_all
50.times do |index|
  u = User.create(:first_name=>'user', :last_name=>index, :email=>"user#{index}@ukr.net",
                      :birthday=>'20.10.1995', :password=> 123456, :password_confirmation=> 123456)
  u.images.create
end
