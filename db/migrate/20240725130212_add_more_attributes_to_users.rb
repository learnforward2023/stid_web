# frozen_string_literal: true

class AddMoreAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string

    add_column :users, :uuid, :string, null: false, default: ''
    add_index :users, :uuid, unique: true
  end
end
