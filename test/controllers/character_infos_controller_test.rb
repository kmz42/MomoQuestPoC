require "test_helper"

class CharacterInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_info = character_infos(:one)
  end

  test "should get index" do
    get character_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_character_info_url
    assert_response :success
  end

  test "should create character_info" do
    assert_difference("CharacterInfo.count") do
      post character_infos_url, params: { character_info: { character_id: @character_info.character_id, coziness: @character_info.coziness, experience: @character_info.experience, fluffiness: @character_info.fluffiness, hp: @character_info.hp, level: @character_info.level, sleepiness: @character_info.sleepiness } }
    end

    assert_redirected_to character_info_url(CharacterInfo.last)
  end

  test "should show character_info" do
    get character_info_url(@character_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_info_url(@character_info)
    assert_response :success
  end

  test "should update character_info" do
    patch character_info_url(@character_info), params: { character_info: { character_id: @character_info.character_id, coziness: @character_info.coziness, experience: @character_info.experience, fluffiness: @character_info.fluffiness, hp: @character_info.hp, level: @character_info.level, sleepiness: @character_info.sleepiness } }
    assert_redirected_to character_info_url(@character_info)
  end

  test "should destroy character_info" do
    assert_difference("CharacterInfo.count", -1) do
      delete character_info_url(@character_info)
    end

    assert_redirected_to character_infos_url
  end
end
