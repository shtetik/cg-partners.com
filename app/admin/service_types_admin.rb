Trestle.resource(:service_types) do
  menu do
    item :service_types,
      icon: "fa fa-star",
      group: :content_management,
      priority: 3
  end

  table do
    column :name_it, header: 'Name Italian'
    column :name_en, header: 'Name English'
    actions
  end

  form do |service_type|
    text_field :name_it, label: 'Name Italian'
    text_field :name_en, label: 'Name English'
  end
end
