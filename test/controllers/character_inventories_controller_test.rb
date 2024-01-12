require "test_helper"

class CharacterInventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_inventory = character_inventories(:one)
  end

  test "should get index" do
    get character_inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_character_inventory_url
    assert_response :success
  end

  test "should create character_inventory" do
    assert_difference("CharacterInventory.count") do
      post character_inventories_url, params: { character_inventory: { character_id: @character_inventory.character_id, money: @character_inventory.money } }
    end

    assert_redirected_to character_inventory_url(CharacterInventory.last)
  end

  test "should show character_inventory" do
    get character_inventory_url(@character_inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_inventory_url(@character_inventory)
    assert_response :success
  end

  test "should update character_inventory" do
    patch character_inventory_url(@character_inventory), params: { character_inventory: { character_id: @character_inventory.character_id, money: @character_inventory.money } }
    assert_redirected_to character_inventory_url(@character_inventory)
  end

  test "should destroy character_inventory" do
    assert_difference("CharacterInventory.count", -1) do
      delete character_inventory_url(@character_inventory)
    end

    assert_redirected_to character_inventories_url
  end
end
