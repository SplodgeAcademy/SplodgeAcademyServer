require "test_helper"

class TextChoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @text_choice = text_choices(:one)
  end

  test "should get index" do
    get text_choices_url
    assert_response :success
  end

  test "should get new" do
    get new_text_choice_url
    assert_response :success
  end

  test "should create text_choice" do
    assert_difference("TextChoice.count") do
      post text_choices_url, params: { text_choice: { body: @text_choice.body, reading_id: @text_choice.reading_id, subtitle: @text_choice.subtitle, title: @text_choice.title } }
    end

    assert_redirected_to text_choice_url(TextChoice.last)
  end

  test "should show text_choice" do
    get text_choice_url(@text_choice)
    assert_response :success
  end

  test "should get edit" do
    get edit_text_choice_url(@text_choice)
    assert_response :success
  end

  test "should update text_choice" do
    patch text_choice_url(@text_choice), params: { text_choice: { body: @text_choice.body, reading_id: @text_choice.reading_id, subtitle: @text_choice.subtitle, title: @text_choice.title } }
    assert_redirected_to text_choice_url(@text_choice)
  end

  test "should destroy text_choice" do
    assert_difference("TextChoice.count", -1) do
      delete text_choice_url(@text_choice)
    end

    assert_redirected_to text_choices_url
  end
end
