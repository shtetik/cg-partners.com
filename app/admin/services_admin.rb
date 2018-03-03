Trestle.resource(:services) do
  collection do
    Service.order(:id)
  end

  menu do
    item :services,
      icon: "fa fa-star",
      group: :content_management,
      priority: 4
  end

  scope :all, default: true

  if ActiveRecord::Base.connection.table_exists? 'service_types'
    ServiceType.find_each do |service_type|
      scope service_type.name,
        lambda {
          Service.includes(:service_type)
            .where(service_types: { id: service_type.id })
        }
    end
  end

  table do
    column :id
    column :title
    column :slug
    column :service_type, -> service { service.service_type.name }
    actions
  end

  form do |service|
    tab :italian do
      text_field :title_it, label: "Title"
      editor :text_it, label: "Text"
    end

    tab :english do
      text_field :title_en, label: "Title"
      editor :text_en, label: "Text"
    end

    sidebar do
      select :service_type_id, ServiceType.all, label: 'Service Type'
    end
  end
end
