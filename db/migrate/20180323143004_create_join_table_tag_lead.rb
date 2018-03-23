class CreateJoinTableTagLead < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :leads do |t|
      t.index [:tag_id, :lead_id]
      # t.index [:lead_id, :tag_id]
    end
  end
end
