class ShopsController < ApplicationController
before_action :set_shop, only: [:show, :edit, :update, :destroy]

before_action :set_shop, only: [:show, :edit, :update, :destroy]
 def index
   @shops = Shop.all
   # render: :index
 end

 def show

 end

 def new
   #render :new
   @shop = Shop.new
   render partial: "form"
 end
 def edit
   render partial: "form"
 end
 def update

   if @shop.update(shop_params)
     redirect_to shop_path(@shop.id)
   else
     render :edit
end
 end
 def create
   @shop = Shop.new(shop_params)

   if @shop.save
     # redirect_to shop_path(@shop) same as below
     redirect_to @shop
   else
     render :new
   end
 end

 def destroy
   @shop.destroy
   redirect_to shops_path

 end


 private

 def set_shop
   @shop = Shop.find(params[:id])

 end
   def shop_params
     #params = { shop: { name: "shop Name"}}
     params.require(:shop).permit(:name)
   end
end
