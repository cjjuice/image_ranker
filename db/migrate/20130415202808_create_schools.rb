class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :subdomain
      t.string :email_domain

      t.timestamps
    end
  end
end
