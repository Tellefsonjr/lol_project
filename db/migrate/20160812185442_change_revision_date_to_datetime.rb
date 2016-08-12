class ChangeRevisionDateToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :summoners, :revisionDate, :integer, limit: 8
  end
end
