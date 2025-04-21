require "test_helper"

class TextMissingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @text_missing = text_missings(:one)
  end

  test "should get index" do
    get text_missings_url
    assert_response :success
  end

  test "should get new" do
    get new_text_missing_url
    assert_response :success
  end

  test "should create text_missing" do
    assert_difference("TextMissing.count") do
      post text_missings_url, params: { text_missing: { body: @text_missing.body, optionA: @text_missing.optionA, optionB: @text_missing.optionB, optionC: @text_missing.optionC, optionD: @text_missing.optionD, optionE: @text_missing.optionE, optionF: @text_missing.optionF, optionG: @text_missing.optionG, reading_id: @text_missing.reading_id, title: @text_missing.title } }
    end

    assert_redirected_to text_missing_url(TextMissing.last)
  end

  test "should show text_missing" do
    get text_missing_url(@text_missing)
    assert_response :success
  end

  test "should get edit" do
    get edit_text_missing_url(@text_missing)
    assert_response :success
  end

  test "should update text_missing" do
    patch text_missing_url(@text_missing), params: { text_missing: { body: @text_missing.body, optionA: @text_missing.optionA, optionB: @text_missing.optionB, optionC: @text_missing.optionC, optionD: @text_missing.optionD, optionE: @text_missing.optionE, optionF: @text_missing.optionF, optionG: @text_missing.optionG, reading_id: @text_missing.reading_id, title: @text_missing.title } }
    assert_redirected_to text_missing_url(@text_missing)
  end

  test "should destroy text_missing" do
    assert_difference("TextMissing.count", -1) do
      delete text_missing_url(@text_missing)
    end

    assert_redirected_to text_missings_url
  end
end
