require "application_system_test_case"

class SentenceTransformationsTest < ApplicationSystemTestCase
  setup do
    @sentence_transformation = sentence_transformations(:one)
  end

  test "visiting the index" do
    visit sentence_transformations_url
    assert_selector "h1", text: "Sentence transformations"
  end

  test "should create sentence transformation" do
    visit sentence_transformations_url
    click_on "New sentence transformation"

    fill_in "Answer", with: @sentence_transformation.answer
    fill_in "Keyword", with: @sentence_transformation.keyword
    fill_in "Prompt", with: @sentence_transformation.prompt
    fill_in "Question", with: @sentence_transformation.question
    click_on "Create Sentence transformation"

    assert_text "Sentence transformation was successfully created"
    click_on "Back"
  end

  test "should update Sentence transformation" do
    visit sentence_transformation_url(@sentence_transformation)
    click_on "Edit this sentence transformation", match: :first

    fill_in "Answer", with: @sentence_transformation.answer
    fill_in "Keyword", with: @sentence_transformation.keyword
    fill_in "Prompt", with: @sentence_transformation.prompt
    fill_in "Question", with: @sentence_transformation.question
    click_on "Update Sentence transformation"

    assert_text "Sentence transformation was successfully updated"
    click_on "Back"
  end

  test "should destroy Sentence transformation" do
    visit sentence_transformation_url(@sentence_transformation)
    click_on "Destroy this sentence transformation", match: :first

    assert_text "Sentence transformation was successfully destroyed"
  end
end
