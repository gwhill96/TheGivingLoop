# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/redeemed_donation
  def redeemed_donation
    user = User.last
    item = BasketItem.includes(:basket, :donation_type).where(redeemed: false, baskets: { state: 'paid' }).first
    UserMailer.redeemed_donation(user, item)
  end

end
