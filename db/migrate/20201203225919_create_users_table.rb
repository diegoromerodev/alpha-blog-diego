class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :password_digest
    	t.timestamps
    	t.boolean :admin, default: false
    end
	create_table :articles do |t|
		t.string :title
		t.text :description
		t.timestamps
		t.integer :user_id
    end
	create_table :categories do |t|
		t.string :name
		t.timestamps
    end    
  end
end
