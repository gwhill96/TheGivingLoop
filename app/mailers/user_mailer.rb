class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.redeemed_donation.subject
  #
  def redeemed_donation(item)
    @greeting = "Hi"
    @item = item
    @user = @item.basket.user
    if @user.nil?
      @user_json = @item.basket.guest_user
      mail(
        subject: 'Your donation has been redeemed!',
        to: @user_json["email"],
        from: 'donations@the-giving-loop.com',
        # html_body: '',
        track_opens: 'true',
        message_stream: 'outbound'
      )
    else
      mail(
        to: @user.email,
        subject: 'Your donation has been redeemed!',
        from: 'donations@the-giving-loop.com',
        # html_body: '',
        track_opens: 'true',
        message_stream: 'outbound'
      )
    end
  end
end
