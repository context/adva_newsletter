class NewsletterMailer < ActionMailer::Base
  def subscription_confirmation(newsletter_subscription)
    
  end
  
  def unsubscription_confirmation(newsletter_subscription)
    
  end
  
  def newsletter_message(newsletter_message, newsletter_subscription)
    setup_email(message.restaurant.user)
    @recipients          = newsletter_subscription.email
    @subject             << "New message from #{message.restaurant.name}"
    @body[:message]      = message
    @body[:subscription] = subscription
    @body[:url] = APP_CONFIG[:site_url]+remove_restaurant_mailing_list_subscriptions_path(message.restaurant,:email=>subscription.email,:removal_code=>subscription.removal_code)
  end
  
  protected
  
  def setup_email(user)
    @recipients = "#{user.email}"
    @from = APP_CONFIG[:admin_email]
    @subject = "[#{APP_CONFIG[:site_name]}] "
    @sent_on = Time.now
    @body[:user] = user
  end
end