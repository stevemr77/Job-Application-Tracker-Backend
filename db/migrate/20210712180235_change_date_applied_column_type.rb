class ChangeDateAppliedColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :job_applications, :date_applied, :date
  end
end
