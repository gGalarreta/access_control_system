class CreateWorkdays < ActiveRecord::Migration[5.2]
  def change
    create_table :workdays do |t|
      t.integer     :status
      t.datetime    :time
      t.belongs_to  :user
      t.timestamps
    end
  end
end
