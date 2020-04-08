class AsanasController < ApplicationController

    def index
        asanas = Asana.all
        # resond_to do |format|
        #     format.html
        #     format.json { render json: asanas }
        # end
        render json: asanas
    end

    def update
        asana = Asana.find(params[:id])
        binding.pry
        if asana.update(name: params[:asana][:name])
            render json: asana
        end
    end

    def balancing
        @asanas = Asana.balancing
        render :index
    end

    def inversion
        @asanas = Asana.inversion
        render :index
    end

    def backbending
        @asanas = Asana.backbending
        render :index
    end

end