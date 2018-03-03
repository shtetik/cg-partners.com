class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.text :emails, array: true, default: []
      t.string :position, null: false, default: ''
      t.string :telephone, null: false, default: ''
      t.string :fax, null: false, default: ''
      t.string :vat, null: false, default: ''
      t.string :linkedin, null: false, default: ''

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Person.create_translation_table! full_name: { type: :string, null: false },
                                              text: { type: :text  , null: false },
                                              slug: { type: :string, null: false }
      end

      dir.down do
        Person.drop_translation_table!
      end
    end
  end
end
