class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET api/v1/products
  def index
    @products = Product.all

    render(json: @products)
  end

  # GET api/v1/products/1
  def show
    if @product.nil?
      render json: ErrorSerializer.serialize(@product.errors), status: :unprocessable_entity
    else
      render json: @product
    end
  end

  # POST api/v1/products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/products/1
  def update
    if @product.update(product_params)
      render json: @product, status: :created
    else
      render json: @product.erros, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/products/1
  def destroy
    @product.destroy
  end


  private

  def set_product
    @product = Product.includes(:stocks, :contents).find_by_id(params[:id])
    # @product = Product.find_by_id(params[:id])
  end

  def product_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params) # Deserialization of params
  end
end
