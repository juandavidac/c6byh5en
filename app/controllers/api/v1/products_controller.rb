module Api
  module V1
    class ProductsController < ApplicationController


      def index
        @products=Product.all
        respond_to do |format|
            format.json {render :json => @products}
          end
      end
    end
  end
end
