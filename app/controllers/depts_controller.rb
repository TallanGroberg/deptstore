class DeptsController < ApplicationController
  before_action :set_shop
   before_action :set_dept, only: [:show]


  def index
    @depts = @shop.depts
  end

  def show
  end

  def new
    @dept = @shop.depts.new
    render partial: "form"
  end
  def create
    @dept = @shop.depts.new(@dept_params)
    if @dept.save
      redirect_to shop_depts_path(@shop.id, @dept.id)
    else
      render partial: "form"
    end
  end

  def edit
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])

  end
  def set_dept
    @dept = @shop.depts(params[:id])

  end
  def dept_params
    params.require(:dept).permit(:name, :body)

  end
end
