Trestle.resource(:people) do
  collection do
    Person.includes(:translations).order(:id)
  end

  menu do
    item :people,
      icon: "fa fa-star",
      group: :content_management,
      priority: 3
  end

  table do
    column :id
    column :avatar, header: 'Photo' do |person|
      image_tag(person.avatar.url, style: 'height: 25px',)
    end
    column :full_name
    column :position
    actions
  end

  form do |person|
  end

  form do |service|
    tab :italian do
      text_field :full_name_it, label: "Full Name"
      editor :text_it, label: "Text"
    end

    tab :english do
      text_field :full_name_en, label: "Full Name"
      editor :text_en, label: "Text"
    end

    sidebar do
      form_group :avatar, help: "Upload a file less than 300 kilobytes" do
        if instance.avatar.present?
          concat content_tag(
            :object,
            nil,
            data: instance.avatar.url,
            class: 'img-responsive',
            style: 'margin-bottom: 1rem'
          )
        end
        raw_file_field :avatar
      end

      tag_select :emails
      text_field :position
      text_field :telephone
      text_field :fax
      text_field :vat
      text_field :linkedin
    end
  end

end
