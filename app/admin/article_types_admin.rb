Trestle.resource(:article_types) do
  collection do
    ArticleType.order(:id)
  end

  menu do
    item :article_types,
         icon: "fa fa-star",
         group: :article_management,
         priority: 2
  end

  table do
    column :id
    column :name_it, header: 'Name Italian'
    column :name_en, header: 'Name English'
    actions
  end

  form do |service_type|
    text_field :name_it, label: 'Name Italian'
    text_field :name_en, label: 'Name English'
  end
end
