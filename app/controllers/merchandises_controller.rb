class MerchandisesController < ApplicationController
    def index
        merchandises = Merchandise.all
        render json: merchandises, status: :ok
    end
    def show
        merchandise = Merchandise.find(params[:id])
        render json: merchandise, status: :ok
    end
    def destroy
        merchandise = Merchandise.find(params[:id])
        merchandise.destroy
        head :no_content
    end
    def create
        merchandise = Merchandise.create(merchandise_params)
        render json: merchandise, status: :created
    end
    def update
        merchandise = Merchandise.find(params[:id])
        merchandise.update(merchandise_params)
        render json: merchandise, status: :ok
    end
    def merch
        merchandises= Merchandise.where(vendor_id: params[:id])
        if merchandises.exists?
        render json: merchandises, status: :ok
        end
    end
    private
    def merchandise_params
        params.permit(:vendor_id, :item_name, :price, :description, :inventory, :is_sold_out, :merch)
      end
end
