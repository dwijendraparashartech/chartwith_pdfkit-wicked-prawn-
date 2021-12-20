require "application_system_test_case"

class YogurtsTest < ApplicationSystemTestCase
  setup do
    @yogurt = yogurts(:one)
  end

  test "visiting the index" do
    visit yogurts_url
    assert_selector "h1", text: "Yogurts"
  end

  test "creating a Yogurt" do
    visit yogurts_url
    click_on "New Yogurt"

    fill_in "Flavor", with: @yogurt.flavor
    click_on "Create Yogurt"

    assert_text "Yogurt was successfully created"
    click_on "Back"
  end

  test "updating a Yogurt" do
    visit yogurts_url
    click_on "Edit", match: :first

    fill_in "Flavor", with: @yogurt.flavor
    click_on "Update Yogurt"

    assert_text "Yogurt was successfully updated"
    click_on "Back"
  end

  test "destroying a Yogurt" do
    visit yogurts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Yogurt was successfully destroyed"
  end
end
