class UserMailer < ApplicationMailer
    default from: "App Academy <everybody@appacademy.io>"

    def welcome_email(user)
      @user = user
      mail(to: "#{user.username}@app-academy.io", subject: 'Welcome to 99 Cats!')
    end

end
