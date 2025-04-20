require "test_helper"

class OpenClozesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @open_cloze = open_clozes(:one)
  end

  test "should get index" do
    get open_clozes_url
    assert_response :success
  end

  test "should get new" do
    get new_open_cloze_url
    assert_response :success
  end

  test "should create open_cloze" do
    assert_difference("OpenCloze.count") do
      post open_clozes_url, params: { open_cloze: { answer: @open_cloze.answer, question: @open_cloze.question } }
    end

    assert_redirected_to open_cloze_url(OpenCloze.last)
  end

  test "should show open_cloze" do
    get open_cloze_url(@open_cloze)
    assert_response :success
  end

  test "should get edit" do
    get edit_open_cloze_url(@open_cloze)
    assert_response :success
  end

  test "should update open_cloze" do
    patch open_cloze_url(@open_cloze), params: { open_cloze: { answer: @open_cloze.answer, question: @open_cloze.question } }
    assert_redirected_to open_cloze_url(@open_cloze)
  end

  test "should destroy open_cloze" do
    assert_difference("OpenCloze.count", -1) do
      delete open_cloze_url(@open_cloze)
    end

    assert_redirected_to open_clozes_url
  end
end
