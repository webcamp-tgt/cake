class AddMenberStatusToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :menber_status, :integer, default: 0
  end
end
