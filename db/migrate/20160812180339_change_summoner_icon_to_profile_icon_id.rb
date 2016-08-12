class ChangeSummonerIconToProfileIconId < ActiveRecord::Migration[5.0]
  def change
    add_column :summoners, :profileIconId, :integer
  end
end
