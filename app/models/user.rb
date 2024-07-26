# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :companies # rubocop:disable Rails/HasAndBelongsToMany

  before_validation :set_uuid, on: :create

  validates :uuid, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[admin created_at email encrypted_password id id_value name phone_number remember_created_at reset_password_sent_at
       reset_password_token updated_at uuid]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['companies']
  end

  private

  def set_uuid
    self.uuid = SecureRandom.uuid if uuid.blank?
  end
end
