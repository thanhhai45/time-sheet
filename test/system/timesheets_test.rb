require "application_system_test_case"

class TimesheetsTest < ApplicationSystemTestCase
  setup do
    @timesheet = timesheets(:one)
  end

  test "visiting the index" do
    visit timesheets_url
    assert_selector "h1", text: "Timesheets"
  end

  test "creating a Timesheet" do
    visit timesheets_url
    click_on "New Timesheet"

    fill_in "Date of entry", with: @timesheet.date_of_entry
    fill_in "Finish time", with: @timesheet.finish_time
    fill_in "Start time", with: @timesheet.start_time
    click_on "Create Timesheet"

    assert_text "Timesheet was successfully created"
    click_on "Back"
  end

  test "updating a Timesheet" do
    visit timesheets_url
    click_on "Edit", match: :first

    fill_in "Date of entry", with: @timesheet.date_of_entry
    fill_in "Finish time", with: @timesheet.finish_time
    fill_in "Start time", with: @timesheet.start_time
    click_on "Update Timesheet"

    assert_text "Timesheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Timesheet" do
    visit timesheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Timesheet was successfully destroyed"
  end
end
