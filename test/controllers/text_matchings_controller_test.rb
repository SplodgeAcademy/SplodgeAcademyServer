require "test_helper"

class TextMatchingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @text_matching = text_matchings(:one)
  end

  test "should get index" do
    get text_matchings_url
    assert_response :success
  end

  test "should get new" do
    get new_text_matching_url
    assert_response :success
  end

  test "should create text_matching" do
    assert_difference("TextMatching.count") do
      post text_matchings_url, params: { text_matching: { para1: @text_matching.para1, para2: @text_matching.para2, para3: @text_matching.para3, para4: @text_matching.para4, reading_id: @text_matching.reading_id, sub1: @text_matching.sub1, sub2: @text_matching.sub2, sub3: @text_matching.sub3, sub4: @text_matching.sub4, title: @text_matching.title } }
    end

    assert_redirected_to text_matching_url(TextMatching.last)
  end

  test "should show text_matching" do
    get text_matching_url(@text_matching)
    assert_response :success
  end

  test "should get edit" do
    get edit_text_matching_url(@text_matching)
    assert_response :success
  end

  test "should update text_matching" do
    patch text_matching_url(@text_matching), params: { text_matching: { para1: @text_matching.para1, para2: @text_matching.para2, para3: @text_matching.para3, para4: @text_matching.para4, reading_id: @text_matching.reading_id, sub1: @text_matching.sub1, sub2: @text_matching.sub2, sub3: @text_matching.sub3, sub4: @text_matching.sub4, title: @text_matching.title } }
    assert_redirected_to text_matching_url(@text_matching)
  end

  test "should destroy text_matching" do
    assert_difference("TextMatching.count", -1) do
      delete text_matching_url(@text_matching)
    end

    assert_redirected_to text_matchings_url
  end
end
