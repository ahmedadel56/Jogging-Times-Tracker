class CreateJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :jogging_times do |t|
      t.float :minutes, null: false
      t.float :distance, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
