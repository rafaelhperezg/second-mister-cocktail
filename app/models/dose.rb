class Dose < ActiveRecord::Base

  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
  # The validation below means: A dose must have a description, a cocktail and an ingredient,
  # and [cocktail, ingredient] couples should be unique.
end
