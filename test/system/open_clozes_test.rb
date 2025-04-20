require "application_system_test_case"

class OpenClozesTest < ApplicationSystemTestCase
  setup do
    @open_cloze = open_clozes(:one)
  end

  test "visiting the index" do
    visit open_clozes_url
    assert_selector "h1", text: "Open clozes"
  end

  test "should create open cloze" do
    visit open_clozes_url
    click_on "New open cloze"

    fill_in "Answer", with: @open_cloze.answer
    fill_in "Question", with: @open_cloze.question
    click_on "Create Open cloze"

    assert_text "Open cloze was successfully created"
    click_on "Back"
  end

  test "should update Open cloze" do
    visit open_cloze_url(@open_cloze)
    click_on "Edit this open cloze", match: :first

    fill_in "Answer", with: @open_cloze.answer
    fill_in "Question", with: @open_cloze.question
    click_on "Update Open cloze"

    assert_text "Open cloze was successfully updated"
    click_on "Back"
  end

  test "should destroy Open cloze" do
    visit open_cloze_url(@open_cloze)
    click_on "Destroy this open cloze", match: :first

    assert_text "Open cloze was successfully destroyed"
  end
end
