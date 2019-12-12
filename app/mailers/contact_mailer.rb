class ContactMailer < ApplicationMailer

  def contact_mail
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
