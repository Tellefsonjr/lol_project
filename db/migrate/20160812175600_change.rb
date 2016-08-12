class Change < ActiveRecord::Migration[5.0]
  def change
    rename_column :summoners, :summonerName, :name
  end
end
