require "application_system_test_case"

class WordFormationsTest < ApplicationSystemTestCase
  setup do
    @word_formation = word_formations(:one)
  end

  test "visiting the index" do
    visit word_formations_url
    assert_selector "h1", text: "Word formations"
  end

  test "should create word formation" do
    visit word_formations_url
    click_on "New word formation"

    fill_in "Answer", with: @word_formation.answer
    fill_in "Keyword", with: @word_formation.keyword
    fill_in "Question", with: @word_formation.question
    click_on "Create Word formation"

    assert_text "Word formation was successfully created"
    click_on "Back"
  end

  test "should update Word formation" do
    visit word_formation_url(@word_formation)
    click_on "Edit this word formation", match: :first

    fill_in "Answer", with: @word_formation.answer
    fill_in "Keyword", with: @word_formation.keyword
    fill_in "Question", with: @word_formation.question
    click_on "Update Word formation"

    assert_text "Word formation was successfully updated"
    click_on "Back"
  end

  test "should destroy Word formation" do
    visit word_formation_url(@word_formation)
    click_on "Destroy this word formation", match: :first

    assert_text "Word formation was successfully destroyed"
  end
end
