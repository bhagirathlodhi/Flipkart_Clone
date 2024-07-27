class SearchController < ApplicationController
  def index    
    search_params = {}
    where_params = {}

    if params[:search].present?
      search_params[:name] = params[:search]
    end

    if params[:min_price].present? || params[:max_price].present?
      min_price = params[:min_price].present? ? params[:min_price].to_f : 0
      max_price = params[:max_price].present? ? params[:max_price].to_f : Float::INFINITY
      where_params[:price] = { gte: min_price, lte: max_price }
    end

    if params[:category_id].present?
      where_params[:category_id] = params[:category_id].to_i
    end

    if search_params.present? || where_params.present?
      @products = Product.search(search_params[:name] || '*', fields: [:name], where: where_params, match: :word_start)
    else
      @products = Product.all
    end
  end
end
