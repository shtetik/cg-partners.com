class CreateArticleTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :article_types do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        ArticleType.create_translation_table! name: { type: :string, null: false },
                                              slug: { type: :string, null: false }
      end

      dir.down do
        ArticleType.drop_translation_table!
      end
    end
  end
end
