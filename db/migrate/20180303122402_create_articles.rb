class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :article_type, foreign_key: true, null: false
      t.references :person, foreign_key: true, null: false

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Article.create_translation_table! title: { type: :string, null: false },
                                    description: { type: :text  , null: false },
                                           text: { type: :text  , null: false },
                                           slug: { type: :string, null: false }
      end

      dir.down do
        Article.drop_translation_table!
      end
    end
  end
end
