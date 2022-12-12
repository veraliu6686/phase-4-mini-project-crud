class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    def index
        render json: Spice.all
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end
    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
    end
    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_404
        render json: {error:"Spice not found"}, status: :not_found
    end
end
