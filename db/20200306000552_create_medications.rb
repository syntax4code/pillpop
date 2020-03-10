class CreateMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :medication do |t|
      t.string :medications
      t.integer :user_id
    end
  end
end
