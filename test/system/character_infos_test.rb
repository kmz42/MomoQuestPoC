require "application_system_test_case"

class CharacterInfosTest < ApplicationSystemTestCase
  setup do
    @character_info = character_infos(:one)
  end

  test "visiting the index" do
    visit character_infos_url
    assert_selector "h1", text: "Character infos"
  end

  test "should create character info" do
    visit character_infos_url
    click_on "New character info"

    fill_in "Character", with: @character_info.character_id
    fill_in "Coziness", with: @character_info.coziness
    fill_in "Experience", with: @character_info.experience
    fill_in "Fluffiness", with: @character_info.fluffiness
    fill_in "Hp", with: @character_info.hp
    fill_in "Level", with: @character_info.level
    fill_in "Sleepiness", with: @character_info.sleepiness
    click_on "Create Character info"

    assert_text "Character info was successfully created"
    click_on "Back"
  end

  test "should update Character info" do
    visit character_info_url(@character_info)
    click_on "Edit this character info", match: :first

    fill_in "Character", with: @character_info.character_id
    fill_in "Coziness", with: @character_info.coziness
    fill_in "Experience", with: @character_info.experience
    fill_in "Fluffiness", with: @character_info.fluffiness
    fill_in "Hp", with: @character_info.hp
    fill_in "Level", with: @character_info.level
    fill_in "Sleepiness", with: @character_info.sleepiness
    click_on "Update Character info"

    assert_text "Character info was successfully updated"
    click_on "Back"
  end

  test "should destroy Character info" do
    visit character_info_url(@character_info)
    click_on "Destroy this character info", match: :first

    assert_text "Character info was successfully destroyed"
  end
end
