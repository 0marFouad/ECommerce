class LandingsController < ApplicationController
  def index

  end
  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Product.all.where("lower(name) LIKE  ? ", @parameter+'%')
    end
  end

  #7andeef
  def custom_search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @search_word = params[:search].downcase
      @results = Category.where(id: params[:category_id][:category_id]).first.products
      @results = @results.all.where("lower(name) LIKE  ? ", @search_word+'%')
      @results = @results.where("price >= ?", params[:min_price])
      @results = @results.where("price <= ?", params[:max_price])
    end
  end

  def view_search
    render :view_search
  end
end
