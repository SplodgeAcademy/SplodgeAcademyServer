require "application_system_test_case"

class MultipleChoicesTest < ApplicationSystemTestCase
  setup do
    @multiple_choice = multiple_choices(:one)
  end

  test "visiting the index" do
    visit multiple_choices_url
    assert_selector "h1", text: "Multiple choices"
  end

  test "should create multiple choice" do
    visit multiple_choices_url
    click_on "New multiple choice"

    fill_in "Answer", with: @multiple_choice.answer
    fill_in "Optiona", with: @multiple_choice.optionA
    fill_in "Optionb", with: @multiple_choice.optionB
    fill_in "Optionc", with: @multiple_choice.optionC
    fill_in "Optiond", with: @multiple_choice.optionD
    fill_in "Question", with: @multiple_choice.question
    click_on "Create Multiple choice"

    assert_text "Multiple choice was successfully created"
    click_on "Back"
  end

  test "should update Multiple choice" do
    visit multiple_choice_url(@multiple_choice)
    click_on "Edit this multiple choice", match: :first

    fill_in "Answer", with: @multiple_choice.answer
    fill_in "Optiona", with: @multiple_choice.optionA
    fill_in "Optionb", with: @multiple_choice.optionB
    fill_in "Optionc", with: @multiple_choice.optionC
    fill_in "Optiond", with: @multiple_choice.optionD
    fill_in "Question", with: @multiple_choice.question
    click_on "Update Multiple choice"

    assert_text "Multiple choice was successfully updated"
    click_on "Back"
  end

  test "should destroy Multiple choice" do
    visit multiple_choice_url(@multiple_choice)
    click_on "Destroy this multiple choice", match: :first

    assert_text "Multiple choice was successfully destroyed"
  end
end
