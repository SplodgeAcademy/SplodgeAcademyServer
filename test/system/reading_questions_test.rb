require "application_system_test_case"

class ReadingQuestionsTest < ApplicationSystemTestCase
  setup do
    @reading_question = reading_questions(:one)
  end

  test "visiting the index" do
    visit reading_questions_url
    assert_selector "h1", text: "Reading questions"
  end

  test "should create reading question" do
    visit reading_questions_url
    click_on "New reading question"

    fill_in "Answer", with: @reading_question.answer
    fill_in "Optiona", with: @reading_question.optionA
    fill_in "Optionb", with: @reading_question.optionB
    fill_in "Optionc", with: @reading_question.optionC
    fill_in "Optiond", with: @reading_question.optionD
    fill_in "Question", with: @reading_question.question
    fill_in "Reading", with: @reading_question.reading_id
    click_on "Create Reading question"

    assert_text "Reading question was successfully created"
    click_on "Back"
  end

  test "should update Reading question" do
    visit reading_question_url(@reading_question)
    click_on "Edit this reading question", match: :first

    fill_in "Answer", with: @reading_question.answer
    fill_in "Optiona", with: @reading_question.optionA
    fill_in "Optionb", with: @reading_question.optionB
    fill_in "Optionc", with: @reading_question.optionC
    fill_in "Optiond", with: @reading_question.optionD
    fill_in "Question", with: @reading_question.question
    fill_in "Reading", with: @reading_question.reading_id
    click_on "Update Reading question"

    assert_text "Reading question was successfully updated"
    click_on "Back"
  end

  test "should destroy Reading question" do
    visit reading_question_url(@reading_question)
    click_on "Destroy this reading question", match: :first

    assert_text "Reading question was successfully destroyed"
  end
end
