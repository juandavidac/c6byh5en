module Api
  module V1
    class ProductsController < ApplicationController


      def index
        @products=Product.all
        respond_to do |format|
            format.json {render :json => @products}
          end
      end

      def create
        product=Product.new(product_params)
        if product.save
          render json: product, status: 201
        else
          render json: {errors: product.errors}, status: 422
        end
      end

      def update
         
        if Product.update(params[:id], product_params)
          render json: product, status: 200
        else
          render json: {errors: product.errors}, status: 422
        end
      end

      def destroy
        @product = Product.destroy(params[:id], product_params)
        render json: product, status: 204
      end

      private
      def product_params
        params.require(:product).permit(:name, :price)
      end

    end
  end
end
