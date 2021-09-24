class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, serializer: CamperShowSerializer
        else
            render json: {error: "Camper not found"}, status: 404
        end
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name,:age)
    end
    
end
