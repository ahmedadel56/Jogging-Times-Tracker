class CreateJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :jogging_times do |t|
      t.float :minutes
      t.float :distance
      t.date :date

      t.timestamps
    end
  end
end
