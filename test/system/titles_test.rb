require "application_system_test_case"

class TitlesTest < ApplicationSystemTestCase
  setup do
    @title = titles(:one)
  end

  test "visiting the index" do
    visit titles_url
    assert_selector "h1", text: "Titles"
  end

  test "should create title" do
    visit titles_url
    click_on "New title"

    fill_in "Para1", with: @title.para1
    fill_in "Para2", with: @title.para2
    fill_in "Para3", with: @title.para3
    fill_in "Para4", with: @title.para4
    fill_in "Reading", with: @title.reading_id
    fill_in "Suba", with: @title.subA
    fill_in "Subb", with: @title.subB
    fill_in "Subc", with: @title.subC
    fill_in "Subd", with: @title.subD
    click_on "Create Title"

    assert_text "Title was successfully created"
    click_on "Back"
  end

  test "should update Title" do
    visit title_url(@title)
    click_on "Edit this title", match: :first

    fill_in "Para1", with: @title.para1
    fill_in "Para2", with: @title.para2
    fill_in "Para3", with: @title.para3
    fill_in "Para4", with: @title.para4
    fill_in "Reading", with: @title.reading_id
    fill_in "Suba", with: @title.subA
    fill_in "Subb", with: @title.subB
    fill_in "Subc", with: @title.subC
    fill_in "Subd", with: @title.subD
    click_on "Update Title"

    assert_text "Title was successfully updated"
    click_on "Back"
  end

  test "should destroy Title" do
    visit title_url(@title)
    click_on "Destroy this title", match: :first

    assert_text "Title was successfully destroyed"
  end
end
