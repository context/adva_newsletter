class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters, :force => true do |t|
      t.references :site
      t.string     :title
      t.string     :description
      t.string     :from_email
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end
