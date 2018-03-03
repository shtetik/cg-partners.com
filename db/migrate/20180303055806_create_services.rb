class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Service.create_translation_table! title: { type: :string, null: false },
                                           text: { type: :text  , null: false },
                                           slug: { type: :string, null: false }
      end

      dir.down do
        Service.drop_translation_table!
      end
    end
  end
end
