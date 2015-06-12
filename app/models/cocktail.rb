class Cocktail < ActiveRecord::Base
  has_many :doses, :dependent => :destroy
  has_many :ingredients, through: :doses, dependent: :restrict_with_error

  has_attached_file :picture,
    styles: { medium: "300x300>", small: "50x50>", thumb: "100x100>" }

  validates :name, presence: true, uniqueness: true
  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
