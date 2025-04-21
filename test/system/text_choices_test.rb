require "application_system_test_case"

class TextChoicesTest < ApplicationSystemTestCase
  setup do
    @text_choice = text_choices(:one)
  end

  test "visiting the index" do
    visit text_choices_url
    assert_selector "h1", text: "Text choices"
  end

  test "should create text choice" do
    visit text_choices_url
    click_on "New text choice"

    fill_in "Body", with: @text_choice.body
    fill_in "Reading", with: @text_choice.reading_id
    fill_in "Subtitle", with: @text_choice.subtitle
    fill_in "Title", with: @text_choice.title
    click_on "Create Text choice"

    assert_text "Text choice was successfully created"
    click_on "Back"
  end

  test "should update Text choice" do
    visit text_choice_url(@text_choice)
    click_on "Edit this text choice", match: :first

    fill_in "Body", with: @text_choice.body
    fill_in "Reading", with: @text_choice.reading_id
    fill_in "Subtitle", with: @text_choice.subtitle
    fill_in "Title", with: @text_choice.title
    click_on "Update Text choice"

    assert_text "Text choice was successfully updated"
    click_on "Back"
  end

  test "should destroy Text choice" do
    visit text_choice_url(@text_choice)
    click_on "Destroy this text choice", match: :first

    assert_text "Text choice was successfully destroyed"
  end
end
