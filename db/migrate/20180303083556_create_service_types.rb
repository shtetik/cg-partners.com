class CreateServiceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :service_types do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        ServiceType.create_translation_table! name: { type: :string, null: false },
                                              slug: { type: :string, null: false }
      end

      dir.down do
        ServiceType.drop_translation_table!
      end
    end
  end
end
