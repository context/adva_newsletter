class NewsletterSubscription < ActiveRecord::Base
  belongs_to :newsletter

  validates_presence_of :email
  validates_presence_of :token
  validates_format_of   :email,
                        :with => /(\A(\s*)\Z)|(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)/i

  before_create :generate_token
  
  def send_subscription_email
    # send email
  end
  
  def send_unsubscription_email
    # send email
  end
  
  def activate!
    self.activated_at = DateTime.now
    self.save
  end

  private           
  
  def generate_token
    self.token = "42"
  end
end