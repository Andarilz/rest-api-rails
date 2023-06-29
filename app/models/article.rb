class Article < ApplicationRecord

  validates :title, presence: :true
  validates :content, presence: :true
  validates :slag, presence: :true, uniqueness: :true

end
