class AddRevisionDateToSummoners < ActiveRecord::Migration[5.0]
  def change
    add_column :summoners, :revisionDate, :bigint
  end
end
