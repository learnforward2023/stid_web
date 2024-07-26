# frozen_string_literal: true

ActiveAdmin.register Company do
  permit_params [:name]
  index do
    column :name
    column :users
    actions
  end
  show do
    attributes_table do
      row :name
      row :users
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
