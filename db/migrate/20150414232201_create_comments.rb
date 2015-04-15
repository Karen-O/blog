class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :content
    	t.string :username
    	t.belongs_to :post
    	t.timestamps
    end
  end
end
