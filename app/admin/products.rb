ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :stock, :user_id  , :category_ids
  index do
    column :name
    column :price
    column :stock
    column :user
    actions
  end
  form do |f|
    f.inputs "products" do
      f.input :name
      f.input :price
      f.input :stock
      f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.name}", u.id]}
      f.input :category_ids, :label => 'category', :as => :select, :value => 'category'  , :collection => Category.all.map{|u| ["#{u.name}", u.id]} ,:input_html => {:multiple => true}
    end

    f.actions
  end
  controller do
    # This code is evaluated within the controller class

    def create
      @product = Product.new(name: params[:product][:name] , price:  params[:product][:price] , stock:  params[:product][:stock] ,  user_id:  params[:product][:user_id])
      @product.categories << Category.where(id: params[:product][:category_ids])

      respond_to do |format|
        if @product.save
          format.html { redirect_to '/admin/products', notice: 'Product was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        @product = Product.find(params[:id])
        @product.categories.delete_all
        @product.categories << Category.where(id: params[:product][:category_ids])
        if @product.update(name: params[:product][:name] , price:  params[:product][:price] , stock:  params[:product][:stock] ,  user_id:  params[:product][:user_id])
          format.html { redirect_to '/admin/products', notice: 'Product was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :stock, :user_id, :rank_sum, :rank_count]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
