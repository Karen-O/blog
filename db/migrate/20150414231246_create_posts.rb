class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|    #Instructions to create a table called posts (once you run the migration)
    	t.string :title
    	t.text :content
    	t.timestamps
    end
  end
end
