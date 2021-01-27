require "application_system_test_case"

class ContentTypesTest < ApplicationSystemTestCase
  setup do
    @content_type = content_types(:one)
  end

  test "visiting the index" do
    visit content_types_url
    assert_selector "h1", text: "Content Types"
  end

  test "creating a Content type" do
    visit content_types_url
    click_on "New Content Type"

    fill_in "Name", with: @content_type.name
    click_on "Create Content type"

    assert_text "Content type was successfully created"
    click_on "Back"
  end

  test "updating a Content type" do
    visit content_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @content_type.name
    click_on "Update Content type"

    assert_text "Content type was successfully updated"
    click_on "Back"
  end

  test "destroying a Content type" do
    visit content_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Content type was successfully destroyed"
  end
end
