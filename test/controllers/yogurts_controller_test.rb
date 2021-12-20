require "test_helper"

class YogurtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yogurt = yogurts(:one)
  end

  test "should get index" do
    get yogurts_url
    assert_response :success
  end

  test "should get new" do
    get new_yogurt_url
    assert_response :success
  end

  test "should create yogurt" do
    assert_difference('Yogurt.count') do
      post yogurts_url, params: { yogurt: { flavor: @yogurt.flavor } }
    end

    assert_redirected_to yogurt_url(Yogurt.last)
  end

  test "should show yogurt" do
    get yogurt_url(@yogurt)
    assert_response :success
  end

  test "should get edit" do
    get edit_yogurt_url(@yogurt)
    assert_response :success
  end

  test "should update yogurt" do
    patch yogurt_url(@yogurt), params: { yogurt: { flavor: @yogurt.flavor } }
    assert_redirected_to yogurt_url(@yogurt)
  end

  test "should destroy yogurt" do
    assert_difference('Yogurt.count', -1) do
      delete yogurt_url(@yogurt)
    end

    assert_redirected_to yogurts_url
  end
end
