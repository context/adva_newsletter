class NewsletterMessage < ActiveRecord::Base
  belongs_to :newsletter
  
  validates_presence_of :title
  validates_presence_of :content

  def deliver!
    self.delivered_at = DateTime.now
    # call to mailer
    self.save
  end
end
