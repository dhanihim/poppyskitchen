require "test_helper"

class ScheduledProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_product = scheduled_products(:one)
  end

  test "should get index" do
    get scheduled_products_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduled_product_url
    assert_response :success
  end

  test "should create scheduled_product" do
    assert_difference('ScheduledProduct.count') do
      post scheduled_products_url, params: { scheduled_product: { current_cost: @scheduled_product.current_cost, current_price: @scheduled_product.current_price } }
    end

    assert_redirected_to scheduled_product_url(ScheduledProduct.last)
  end

  test "should show scheduled_product" do
    get scheduled_product_url(@scheduled_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduled_product_url(@scheduled_product)
    assert_response :success
  end

  test "should update scheduled_product" do
    patch scheduled_product_url(@scheduled_product), params: { scheduled_product: { current_cost: @scheduled_product.current_cost, current_price: @scheduled_product.current_price } }
    assert_redirected_to scheduled_product_url(@scheduled_product)
  end

  test "should destroy scheduled_product" do
    assert_difference('ScheduledProduct.count', -1) do
      delete scheduled_product_url(@scheduled_product)
    end

    assert_redirected_to scheduled_products_url
  end
end
