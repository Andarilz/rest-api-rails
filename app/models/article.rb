class Article < ApplicationRecord

  validates :title, presence: :true
  validates :content, presence: :true
  validates :slug, presence: :true, uniqueness: :true


  def self.recent
    order(created_at: :desc)
  end

end
