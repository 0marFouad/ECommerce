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
end
