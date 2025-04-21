require "application_system_test_case"

class TextMissingsTest < ApplicationSystemTestCase
  setup do
    @text_missing = text_missings(:one)
  end

  test "visiting the index" do
    visit text_missings_url
    assert_selector "h1", text: "Text missings"
  end

  test "should create text missing" do
    visit text_missings_url
    click_on "New text missing"

    fill_in "Body", with: @text_missing.body
    fill_in "Optiona", with: @text_missing.optionA
    fill_in "Optionb", with: @text_missing.optionB
    fill_in "Optionc", with: @text_missing.optionC
    fill_in "Optiond", with: @text_missing.optionD
    fill_in "Optione", with: @text_missing.optionE
    fill_in "Optionf", with: @text_missing.optionF
    fill_in "Optiong", with: @text_missing.optionG
    fill_in "Reading", with: @text_missing.reading_id
    fill_in "Title", with: @text_missing.title
    click_on "Create Text missing"

    assert_text "Text missing was successfully created"
    click_on "Back"
  end

  test "should update Text missing" do
    visit text_missing_url(@text_missing)
    click_on "Edit this text missing", match: :first

    fill_in "Body", with: @text_missing.body
    fill_in "Optiona", with: @text_missing.optionA
    fill_in "Optionb", with: @text_missing.optionB
    fill_in "Optionc", with: @text_missing.optionC
    fill_in "Optiond", with: @text_missing.optionD
    fill_in "Optione", with: @text_missing.optionE
    fill_in "Optionf", with: @text_missing.optionF
    fill_in "Optiong", with: @text_missing.optionG
    fill_in "Reading", with: @text_missing.reading_id
    fill_in "Title", with: @text_missing.title
    click_on "Update Text missing"

    assert_text "Text missing was successfully updated"
    click_on "Back"
  end

  test "should destroy Text missing" do
    visit text_missing_url(@text_missing)
    click_on "Destroy this text missing", match: :first

    assert_text "Text missing was successfully destroyed"
  end
end
