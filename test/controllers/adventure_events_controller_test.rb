require "test_helper"

class AdventureEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adventure_event = adventure_events(:one)
  end

  test "should get index" do
    get adventure_events_url
    assert_response :success
  end

  test "should get new" do
    get new_adventure_event_url
    assert_response :success
  end

  test "should create adventure_event" do
    assert_difference("AdventureEvent.count") do
      post adventure_events_url, params: { adventure_event: { adventure_id: @adventure_event.adventure_id, completes_adventure: @adventure_event.completes_adventure, event_id: @adventure_event.event_id, weight: @adventure_event.weight } }
    end

    assert_redirected_to adventure_event_url(AdventureEvent.last)
  end

  test "should show adventure_event" do
    get adventure_event_url(@adventure_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_adventure_event_url(@adventure_event)
    assert_response :success
  end

  test "should update adventure_event" do
    patch adventure_event_url(@adventure_event), params: { adventure_event: { adventure_id: @adventure_event.adventure_id, completes_adventure: @adventure_event.completes_adventure, event_id: @adventure_event.event_id, weight: @adventure_event.weight } }
    assert_redirected_to adventure_event_url(@adventure_event)
  end

  test "should destroy adventure_event" do
    assert_difference("AdventureEvent.count", -1) do
      delete adventure_event_url(@adventure_event)
    end

    assert_redirected_to adventure_events_url
  end
end
