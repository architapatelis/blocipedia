if Rails.env.development? || Rails.env.production?

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   address: "smtp.gmail.com",
   port: 465,
   domain: "gmail.com",
   authentication: :login,
   user_name: ENV["gmail_username"],
   password: ENV["gmail_password"],
   ssl: true
 }
end
