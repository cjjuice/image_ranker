class AddSchoolIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :school_id, :integer
  end
end
