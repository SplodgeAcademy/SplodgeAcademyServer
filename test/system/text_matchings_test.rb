require "application_system_test_case"

class TextMatchingsTest < ApplicationSystemTestCase
  setup do
    @text_matching = text_matchings(:one)
  end

  test "visiting the index" do
    visit text_matchings_url
    assert_selector "h1", text: "Text matchings"
  end

  test "should create text matching" do
    visit text_matchings_url
    click_on "New text matching"

    fill_in "Para1", with: @text_matching.para1
    fill_in "Para2", with: @text_matching.para2
    fill_in "Para3", with: @text_matching.para3
    fill_in "Para4", with: @text_matching.para4
    fill_in "Reading", with: @text_matching.reading_id
    fill_in "Sub1", with: @text_matching.sub1
    fill_in "Sub2", with: @text_matching.sub2
    fill_in "Sub3", with: @text_matching.sub3
    fill_in "Sub4", with: @text_matching.sub4
    fill_in "Title", with: @text_matching.title
    click_on "Create Text matching"

    assert_text "Text matching was successfully created"
    click_on "Back"
  end

  test "should update Text matching" do
    visit text_matching_url(@text_matching)
    click_on "Edit this text matching", match: :first

    fill_in "Para1", with: @text_matching.para1
    fill_in "Para2", with: @text_matching.para2
    fill_in "Para3", with: @text_matching.para3
    fill_in "Para4", with: @text_matching.para4
    fill_in "Reading", with: @text_matching.reading_id
    fill_in "Sub1", with: @text_matching.sub1
    fill_in "Sub2", with: @text_matching.sub2
    fill_in "Sub3", with: @text_matching.sub3
    fill_in "Sub4", with: @text_matching.sub4
    fill_in "Title", with: @text_matching.title
    click_on "Update Text matching"

    assert_text "Text matching was successfully updated"
    click_on "Back"
  end

  test "should destroy Text matching" do
    visit text_matching_url(@text_matching)
    click_on "Destroy this text matching", match: :first

    assert_text "Text matching was successfully destroyed"
  end
end
