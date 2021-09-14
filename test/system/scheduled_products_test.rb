require "application_system_test_case"

class ScheduledProductsTest < ApplicationSystemTestCase
  setup do
    @scheduled_product = scheduled_products(:one)
  end

  test "visiting the index" do
    visit scheduled_products_url
    assert_selector "h1", text: "Scheduled Products"
  end

  test "creating a Scheduled product" do
    visit scheduled_products_url
    click_on "New Scheduled Product"

    fill_in "Current cost", with: @scheduled_product.current_cost
    fill_in "Current price", with: @scheduled_product.current_price
    click_on "Create Scheduled product"

    assert_text "Scheduled product was successfully created"
    click_on "Back"
  end

  test "updating a Scheduled product" do
    visit scheduled_products_url
    click_on "Edit", match: :first

    fill_in "Current cost", with: @scheduled_product.current_cost
    fill_in "Current price", with: @scheduled_product.current_price
    click_on "Update Scheduled product"

    assert_text "Scheduled product was successfully updated"
    click_on "Back"
  end

  test "destroying a Scheduled product" do
    visit scheduled_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scheduled product was successfully destroyed"
  end
end
