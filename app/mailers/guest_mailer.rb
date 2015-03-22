class GuestMailer < ActionMailer::Base
  default from: "ohoui@alexandraetchristophesedisentoui.com"
  
  def welcome_email(guest)
    @guest = guest
    mail(to: guest.email, subject: "Ce qu'il faut retenir du mariage d'Alexandra et Christophe")
  end
  
end
