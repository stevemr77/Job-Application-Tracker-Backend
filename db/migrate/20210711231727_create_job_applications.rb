class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.string :company_name
      t.string :position
      t.string :date_applied
      t.integer :salary
      t.boolean :follow_up

      t.timestamps
    end
  end
end
