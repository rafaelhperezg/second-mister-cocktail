class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, :through => :doses
  validates :name, presence: true
  validates :name, uniqueness: true

  # From here, is the code we add to update model to use paperclip to add images

  has_attached_file :picture,
      styles: { medium: "300x300>", thumb: "100x100>" }

    validates_attachment_content_type :picture,
      content_type: /\Aimage\/.*\z/
end
