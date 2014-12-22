class UserMailer < ActionMailer::Base
   #default from: "dileep.pdkr@gmail.com"
  def regisration_confirmation(user)
  	mail :to => user.email, :from => "dileep.pdkr@gmail.com", :subject => 'testing'
  	
  end
end
