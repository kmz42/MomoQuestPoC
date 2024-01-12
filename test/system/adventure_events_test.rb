require "application_system_test_case"

class AdventureEventsTest < ApplicationSystemTestCase
  setup do
    @adventure_event = adventure_events(:one)
  end

  test "visiting the index" do
    visit adventure_events_url
    assert_selector "h1", text: "Adventure events"
  end

  test "should create adventure event" do
    visit adventure_events_url
    click_on "New adventure event"

    fill_in "Adventure", with: @adventure_event.adventure_id
    check "Completes adventure" if @adventure_event.completes_adventure
    fill_in "Event", with: @adventure_event.event_id
    fill_in "Weight", with: @adventure_event.weight
    click_on "Create Adventure event"

    assert_text "Adventure event was successfully created"
    click_on "Back"
  end

  test "should update Adventure event" do
    visit adventure_event_url(@adventure_event)
    click_on "Edit this adventure event", match: :first

    fill_in "Adventure", with: @adventure_event.adventure_id
    check "Completes adventure" if @adventure_event.completes_adventure
    fill_in "Event", with: @adventure_event.event_id
    fill_in "Weight", with: @adventure_event.weight
    click_on "Update Adventure event"

    assert_text "Adventure event was successfully updated"
    click_on "Back"
  end

  test "should destroy Adventure event" do
    visit adventure_event_url(@adventure_event)
    click_on "Destroy this adventure event", match: :first

    assert_text "Adventure event was successfully destroyed"
  end
end
