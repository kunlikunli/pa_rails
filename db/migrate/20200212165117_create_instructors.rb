class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.string :last
      t.string :first
      t.string :email
      t.integer :instructor_id

      t.timestamps
    end
  end
end
