class CreateNewsletterMessages < ActiveRecord::Migration
  def self.up
    create_table :newsletter_messages, :force => true do |t|
      t.references :newsletter
      t.string     :title
      t.string     :content
      t.datetime   :delivered_at
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_messages
  end
end
