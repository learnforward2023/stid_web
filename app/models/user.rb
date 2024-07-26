# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :companies # rubocop:disable Rails/HasAndBelongsToMany

  before_validation :set_uuid, on: :create

  validates :uuid, presence: true, uniqueness: true

  private

  def set_uuid
    self.uuid = SecureRandom.uuid if uuid.blank?
  end
end
