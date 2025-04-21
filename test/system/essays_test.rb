require "application_system_test_case"

class EssaysTest < ApplicationSystemTestCase
  setup do
    @essay = essays(:one)
  end

  test "visiting the index" do
    visit essays_url
    assert_selector "h1", text: "Essays"
  end

  test "should create essay" do
    visit essays_url
    click_on "New essay"

    fill_in "Note1", with: @essay.note1
    fill_in "Note2", with: @essay.note2
    fill_in "Prompt", with: @essay.prompt_id
    fill_in "Situation", with: @essay.situation
    fill_in "Task", with: @essay.task
    click_on "Create Essay"

    assert_text "Essay was successfully created"
    click_on "Back"
  end

  test "should update Essay" do
    visit essay_url(@essay)
    click_on "Edit this essay", match: :first

    fill_in "Note1", with: @essay.note1
    fill_in "Note2", with: @essay.note2
    fill_in "Prompt", with: @essay.prompt_id
    fill_in "Situation", with: @essay.situation
    fill_in "Task", with: @essay.task
    click_on "Update Essay"

    assert_text "Essay was successfully updated"
    click_on "Back"
  end

  test "should destroy Essay" do
    visit essay_url(@essay)
    click_on "Destroy this essay", match: :first

    assert_text "Essay was successfully destroyed"
  end
end
