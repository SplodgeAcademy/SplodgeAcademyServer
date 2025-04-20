require "test_helper"

class WordFormationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @word_formation = word_formations(:one)
  end

  test "should get index" do
    get word_formations_url
    assert_response :success
  end

  test "should get new" do
    get new_word_formation_url
    assert_response :success
  end

  test "should create word_formation" do
    assert_difference("WordFormation.count") do
      post word_formations_url, params: { word_formation: { answer: @word_formation.answer, keyword: @word_formation.keyword, question: @word_formation.question } }
    end

    assert_redirected_to word_formation_url(WordFormation.last)
  end

  test "should show word_formation" do
    get word_formation_url(@word_formation)
    assert_response :success
  end

  test "should get edit" do
    get edit_word_formation_url(@word_formation)
    assert_response :success
  end

  test "should update word_formation" do
    patch word_formation_url(@word_formation), params: { word_formation: { answer: @word_formation.answer, keyword: @word_formation.keyword, question: @word_formation.question } }
    assert_redirected_to word_formation_url(@word_formation)
  end

  test "should destroy word_formation" do
    assert_difference("WordFormation.count", -1) do
      delete word_formation_url(@word_formation)
    end

    assert_redirected_to word_formations_url
  end
end
