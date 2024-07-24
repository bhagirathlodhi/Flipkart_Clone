class SearchController < ApplicationController
  def index
    search_params = preprocess_search_params(params[:q])
    @query = Product.ransack(search_params)
    @products = @query.result(distinct: true)
  end

  private

  def preprocess_search_params(params)
    if params[:name_or_price_cont]
      if params[:name_or_price_cont] =~ /\A\d+\z/ # Check if it's a number
        params[:price_eq] = params.delete(:name_or_price_cont)
      else
        params[:name_cont] = params.delete(:name_or_price_cont)
      end
    end
    params
  end
end
