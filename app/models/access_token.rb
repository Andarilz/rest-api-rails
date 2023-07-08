class AccessToken < ApplicationRecord
  validates :token, uniqueness: :true, presence: :true
  belongs_to :user

  after_initialize :generate_token

  private

  def generate_token

      self.token = SecureRandom.uuid

  end


end
