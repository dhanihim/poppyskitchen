class ScheduledProductsController < ApplicationController
  before_action :set_scheduled_product, only: %i[ show edit update destroy ]

  #custom
  def list
    @schedules = Schedule.find(params[:id]);
    @existing_scheduled_products = ScheduledProduct.where(schedule_id: params[:id])
  
    @scheduled_product = ScheduledProduct.new
  end

  # GET /scheduled_products or /scheduled_products.json
  def index
    @scheduled_products = ScheduledProduct.all
  end

  # GET /scheduled_products/1 or /scheduled_products/1.json
  def show
  end

  # GET /scheduled_products/new
  def new
    @scheduled_product = ScheduledProduct.new
  end

  # GET /scheduled_products/1/edit
  def edit
  end

  # POST /scheduled_products or /scheduled_products.json
  def create
    @scheduled_product = ScheduledProduct.new(scheduled_product_params)

    respond_to do |format|
      if @scheduled_product.save
        format.html { redirect_to list_scheduled_product_url(@scheduled_product.schedule_id), notice: "Scheduled product was successfully created." }
        format.json { render :show, status: :created, location: @scheduled_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scheduled_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduled_products/1 or /scheduled_products/1.json
  def update
    respond_to do |format|
      if @scheduled_product.update(scheduled_product_params)
        format.html { redirect_to list_scheduled_product_url(@scheduled_product.schedule_id), notice: "Scheduled product was successfully updated." }
        format.json { render :show, status: :ok, location: @scheduled_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scheduled_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduled_products/1 or /scheduled_products/1.json
  def destroy
    @scheduled_product.destroy
    respond_to do |format|
      format.html { redirect_to list_scheduled_product_url(@scheduled_product.schedule_id), notice: "Scheduled product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_product
      @scheduled_product = ScheduledProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scheduled_product_params
      params.require(:scheduled_product).permit(:product_id, :schedule_id)
    end
end
