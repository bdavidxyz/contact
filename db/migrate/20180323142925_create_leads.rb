class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email 
      t.string :biz 
      t.string :position 
      t.string :company 
      t.datetime :connected_on 

      t.timestamps
    end
  end
end
