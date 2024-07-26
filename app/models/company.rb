# frozen_string_literal: true

class Company < ApplicationRecord
  has_and_belongs_to_many :users # rubocop:disable Rails/HasAndBelongsToMany

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['users']
  end
end
