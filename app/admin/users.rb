# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params [:email, :password, :password_confirmation, :admin, { company_ids: [] }]
  # visible columns on /admin/users
  index do
    column :email
    column :companies
    column :admin
    actions
  end

  show do
    attributes_table do
      row :email
      row :companies
      row :created_at
      row :updated_at
      row :reset_password_sent_at
      row :reset_password_token
      row :admin
    end
    active_admin_comments
  end
  # show password fiels only on new user page
  # shows companies in downdown menu based on current_users's related companies
  form do |f|
    f.inputs 'User' do
      f.input :email
      f.input :companies, collection: (Company.joins(:users).where(users: { id: current_user.id }) unless current_user.admin)
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
      f.input :admin if current_user.admin
    end
    f.actions
  end
  controller do
    # bypass password validation when updating user
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end
end
