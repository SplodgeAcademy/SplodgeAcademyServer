require "test_helper"

class ReadingQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reading_question = reading_questions(:one)
  end

  test "should get index" do
    get reading_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_reading_question_url
    assert_response :success
  end

  test "should create reading_question" do
    assert_difference("ReadingQuestion.count") do
      post reading_questions_url, params: { reading_question: { answer: @reading_question.answer, optionA: @reading_question.optionA, optionB: @reading_question.optionB, optionC: @reading_question.optionC, optionD: @reading_question.optionD, question: @reading_question.question, reading_id: @reading_question.reading_id } }
    end

    assert_redirected_to reading_question_url(ReadingQuestion.last)
  end

  test "should show reading_question" do
    get reading_question_url(@reading_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_reading_question_url(@reading_question)
    assert_response :success
  end

  test "should update reading_question" do
    patch reading_question_url(@reading_question), params: { reading_question: { answer: @reading_question.answer, optionA: @reading_question.optionA, optionB: @reading_question.optionB, optionC: @reading_question.optionC, optionD: @reading_question.optionD, question: @reading_question.question, reading_id: @reading_question.reading_id } }
    assert_redirected_to reading_question_url(@reading_question)
  end

  test "should destroy reading_question" do
    assert_difference("ReadingQuestion.count", -1) do
      delete reading_question_url(@reading_question)
    end

    assert_redirected_to reading_questions_url
  end
end
