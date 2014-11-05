class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voter
      t.string :candidate

      t.timestamps
    end
  end
end
