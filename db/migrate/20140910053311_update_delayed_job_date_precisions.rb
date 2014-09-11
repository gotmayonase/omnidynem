class UpdateDelayedJobDatePrecisions < ActiveRecord::Migration
  def up
    change_column :delayed_jobs, :locked_at, :datetime, limit: 6
    change_column :delayed_jobs, :failed_at, :datetime, limit: 6
    change_column :delayed_jobs, :run_at, :datetime, limit: 6
  end

  def down
    change_column :delayed_jobs, :locked_at, :datetime
    change_column :delayed_jobs, :failed_at, :datetime
    change_column :delayed_jobs, :run_at, :datetime
  end
end
