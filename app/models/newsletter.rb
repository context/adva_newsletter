class Newsletter < ActiveRecord::Base
  belongs_to :site

  has_many :newsletter_messages, :order => "created_at DESC",
                                 :dependent => :delete_all

  has_many :newsletter_subscriptions

  validates_presence_of :title
  validates_presence_of :from_email
  validates_format_of   :from_email,
                        :with => /(\A(\s*)\Z)|(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)/i
end