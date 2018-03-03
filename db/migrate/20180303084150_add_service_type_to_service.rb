class AddServiceTypeToService < ActiveRecord::Migration[5.1]
  def change
    add_reference :services, :service_type, foreign_key: true, null: false
  end
end
