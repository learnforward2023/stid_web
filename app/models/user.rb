# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_uuid, on: :create

  validates :uuid, presence: true, uniqueness: true

  private

  def set_uuid
    self.uuid = SecureRandom.uuid if uuid.blank?
  end
end
