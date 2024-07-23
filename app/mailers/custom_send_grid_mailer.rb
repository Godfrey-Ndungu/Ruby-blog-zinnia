require 'sendgrid-ruby'
include SendGrid

class CustomSendGridMailer < ApplicationMailer
  def initialize
    @sg = SendGrid::API.new(api_key: Rails.application.credentials.sendgrid[:api_key])
    @sender_email = Rails.application.credentials.sendgrid[:sender_email]
    @host = Rails.application.credentials.sendgrid[:host]
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    @resource = record
    @url  = edit_user_password_url(reset_password_token: token, host: @host)
    raise "Record is nil" if record.nil?
    raise "Record does not have email method" unless record.respond_to?(:email)

    from = SendGrid::Email.new(email: '@sender_email')
    to = SendGrid::Email.new(email: record.email)
    subject = 'Reset password instructions'
    content = SendGrid::Content.new(type: 'text/plain', value: "To reset your password, click the link: #{@url}")

    mail = SendGrid::Mail.new(from, subject, to, content)


    send_email(mail)
  end

  def confirmation_instructions(record, token, opts={})
    @token = token
    @resource = record
    @url  = edit_user_password_url(reset_password_token: token, host: @host)


    from = SendGrid::Email.new(email: '@sender_email')
    to = SendGrid::Email.new(email: record.email)
    subject = 'Reset password instructions'
    content = SendGrid::Content.new(type: 'text/plain', value: "To reset your password, click the link: #{@url}")

    mail = SendGrid::Mail.new(from, subject, to, content)

    send_email(mail)
  end

  private

  def send_email(mail)
    @sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
