require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    fill_in "Installation date", with: @item.installation_date
    fill_in "Item name", with: @item.item_name
    fill_in "Make", with: @item.make
    fill_in "Model number", with: @item.model_number
    fill_in "Status", with: @item.status
    fill_in "Warranty", with: @item.warranty
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    fill_in "Installation date", with: @item.installation_date
    fill_in "Item name", with: @item.item_name
    fill_in "Make", with: @item.make
    fill_in "Model number", with: @item.model_number
    fill_in "Status", with: @item.status
    fill_in "Warranty", with: @item.warranty
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
