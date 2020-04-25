class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :url
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
