require "test_helper"

class SentenceTransformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sentence_transformation = sentence_transformations(:one)
  end

  test "should get index" do
    get sentence_transformations_url
    assert_response :success
  end

  test "should get new" do
    get new_sentence_transformation_url
    assert_response :success
  end

  test "should create sentence_transformation" do
    assert_difference("SentenceTransformation.count") do
      post sentence_transformations_url, params: { sentence_transformation: { answer: @sentence_transformation.answer, keyword: @sentence_transformation.keyword, prompt: @sentence_transformation.prompt, question: @sentence_transformation.question } }
    end

    assert_redirected_to sentence_transformation_url(SentenceTransformation.last)
  end

  test "should show sentence_transformation" do
    get sentence_transformation_url(@sentence_transformation)
    assert_response :success
  end

  test "should get edit" do
    get edit_sentence_transformation_url(@sentence_transformation)
    assert_response :success
  end

  test "should update sentence_transformation" do
    patch sentence_transformation_url(@sentence_transformation), params: { sentence_transformation: { answer: @sentence_transformation.answer, keyword: @sentence_transformation.keyword, prompt: @sentence_transformation.prompt, question: @sentence_transformation.question } }
    assert_redirected_to sentence_transformation_url(@sentence_transformation)
  end

  test "should destroy sentence_transformation" do
    assert_difference("SentenceTransformation.count", -1) do
      delete sentence_transformation_url(@sentence_transformation)
    end

    assert_redirected_to sentence_transformations_url
  end
end
