class OrderedProductsController < ApplicationController
  before_action :set_ordered_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def choose_schedule
    @ordered_product = OrderedProduct.new
    @schedule = Schedule.where("dateopen < ? AND dateclose > ?", DateTime.now, DateTime.now).order(dateopen: :asc)

    @order = Order.where("key = ?", params[:id])
    
    @order.each do |order|
      @id = order.visitor_id
      @visitor = Visitor.find(@id)
    end
  end

  def list
    @ordered_product = OrderedProduct.new
    @schedule = Schedule.find(params[:id])
    @order = Order.where("key = ?", params[:key])
    @order.each do |order|
      @id = order.id
      @visitor = Visitor.find(@id)
    end

     @choice = OrderedProduct.where("order_id = ?", @id)
  end

  # GET /ordered_products or /ordered_products.json
  def index
    @ordered_products = OrderedProduct.all.order(id: :desc)
  end

  # GET /ordered_products/1 or /ordered_products/1.json
  def show
  end

  # GET /ordered_products/new
  def new
    @ordered_product = OrderedProduct.new
  end

  # GET /ordered_products/1/edit
  def edit
  end

  # POST /ordered_products or /ordered_products.json
  def create
    @ordered_product = OrderedProduct.new(ordered_product_params)

    @ordered_product.price = @ordered_product.scheduled_product.product.price
    @ordered_product.total = @ordered_product.quantity * @ordered_product.scheduled_product.product.price
    @ordered_product.profit = @ordered_product.quantity * (@ordered_product.scheduled_product.product.price - @ordered_product.scheduled_product.product.cost)

    respond_to do |format|
      if @ordered_product.save

        @key = @ordered_product.order.key
        @id = @ordered_product.scheduled_product.schedule.id

        format.html { redirect_to list_ordered_product_path(@id, :key => @key), notice: "Ordered product was successfully created." }
        format.json { render :show, status: :created, location: @ordered_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ordered_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordered_products/1 or /ordered_products/1.json
  def update
    respond_to do |format|
      if @ordered_product.update(ordered_product_params)
        format.html { redirect_to @ordered_product, notice: "Ordered product was successfully updated." }
        format.json { render :show, status: :ok, location: @ordered_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ordered_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordered_products/1 or /ordered_products/1.json
  def destroy
    @key = @ordered_product.order.key
    @id = @ordered_product.scheduled_product.schedule.id

    @ordered_product.destroy
    respond_to do |format|
      format.html { redirect_to list_ordered_product_path(@id, :key => @key), notice: "Ordered product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_product
      @ordered_product = OrderedProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ordered_product_params
      params.require(:ordered_product).permit(:quantity, :price, :profit, :total, :description, :order_id, :scheduled_product_id)
    end
end
