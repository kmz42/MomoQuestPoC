require "application_system_test_case"

class CharacterInventoriesTest < ApplicationSystemTestCase
  setup do
    @character_inventory = character_inventories(:one)
  end

  test "visiting the index" do
    visit character_inventories_url
    assert_selector "h1", text: "Character inventories"
  end

  test "should create character inventory" do
    visit character_inventories_url
    click_on "New character inventory"

    fill_in "Character", with: @character_inventory.character_id
    fill_in "Money", with: @character_inventory.money
    click_on "Create Character inventory"

    assert_text "Character inventory was successfully created"
    click_on "Back"
  end

  test "should update Character inventory" do
    visit character_inventory_url(@character_inventory)
    click_on "Edit this character inventory", match: :first

    fill_in "Character", with: @character_inventory.character_id
    fill_in "Money", with: @character_inventory.money
    click_on "Update Character inventory"

    assert_text "Character inventory was successfully updated"
    click_on "Back"
  end

  test "should destroy Character inventory" do
    visit character_inventory_url(@character_inventory)
    click_on "Destroy this character inventory", match: :first

    assert_text "Character inventory was successfully destroyed"
  end
end
