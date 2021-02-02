class Api::V1::PartsController < ApplicationController

    before_action :set_part, only: [:show, :create, :update, :destroy]

    def index
        @parts = Part.all 
        render json: PartSerializer.new(@parts), status: :ok
    end 

    def show 
        render json: PartSerializer.new(@part), status: :ok 
    end 

    def create 
        @part = Part.new 
        if @part.save
            render json: PartSerializer.new(@part), status: :ok
        else 
            @part == 0 
            render json: @part.errors
        end 
    end 

    def update 
        @part.destroy 
        flash[:notice] = "Updated parts."
        render json: @part 
    end

    def destroy 
        @part.destroy
        flash[:notice] = "Part deleted."
        render json: @part 
    end

    private 

    def create_params
        params.permit(:part, :id, :name, :price, :component)
    end

    def set_part 
        @part = Part.find_by(id: params[:id])
    end
end
