class CreateNewsletterSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :newsletter_subscriptions, :force => true do |t|
      t.references :newsletter
      t.string     :name
      t.string     :email
      t.string     :token
      t.datetime   :verified_at
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_subscriptions
  end
end
