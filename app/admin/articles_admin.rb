Trestle.resource(:articles) do
  menu do
    item :articles,
      icon: "fa fa-star",
      group: :article_management,
      priority: 1
  end

  scope :all, default: true

  if ActiveRecord::Base.connection.table_exists? 'article_types'
    ArticleType.find_each do |article_type|
      scope article_type.name,
        lambda {
          Article.includes(:article_type)
            .where(article_types: { id: article_type.id })
        }
    end
  end

  table do
    column :id
    column :title
    column :article_type,
      -> article { article.article_type.name },
      header: 'Type'
    column :created_at, header: 'Published' do |article|
      article.created_at.strftime('%d %B %Y')
    end
    actions
  end

  form do |article|
    tab :italian do
      text_field :title_it, label: "Title"
      text_area :description_it, label: "Description"
      editor :text_it, label: "Text"
    end

    tab :english do
      text_field :title_en, label: "Title"
      text_area :description_en, label: "Description"
      editor :text_en, label: "Text"
    end

    sidebar do
      select :article_type_id, ArticleType.all, label: 'Article Type'
      select :person_id, Person.all, label: 'Author'
      date_field :created_at, label: 'Publication Date'
    end
  end
end
