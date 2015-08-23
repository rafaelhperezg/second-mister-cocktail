class CocktailsController < ApplicationController
      before_action :find_cocktail, only: [ :show ]

    def index
        @cocktails = Cocktail.all
    end

    def new
      @cocktail = Cocktail.new
    end

    def create
      @cocktail = Cocktail.create(cocktail_params)
      redirect_to cocktails_path
    end

    def show
      # line below not necessary because we have the before.... with the private method
      # @restaurant = Restaurant.find(params[:id])  #I receive the params when the user click on the link Show task
      @doses = @cocktail.doses
      @dose = Dose.new
    end

  private

    def cocktail_params
      params.require(:cocktail).permit(:name, :picture)
    end

    def find_cocktail
      @cocktail = Cocktail.find(params[:id])
    end
end
