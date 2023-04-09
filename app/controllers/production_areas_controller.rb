class ProductionAreasController < ApplicationController



    private

    def production_area_params
        params.require(:production_area).permit(:area)
    end

end
