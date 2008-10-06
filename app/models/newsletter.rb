class Newsletter < ActiveRecord::Base
  #acts_as_role_context

  #delegate :topics_per_page, :comments_per_page, :to => :section

  belongs_to :site
  belongs_to :section

  has_many :newsletter_messages, :order => "created_at DESC",
                                 :dependent => :delete_all

  has_many :newsletter_subscriptions

  validates_presence_of :title
  validates_presence_of :from_email
  validates_format_of   :from_email,
                        :with => /(\A(\s*)\Z)|(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)/i

  protected

    def owner
      section
    end
end