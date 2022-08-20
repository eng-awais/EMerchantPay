# frozen_string_literal: true

require "test_helper"

class MerchantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get merchants_index_url
    assert_response :success
  end

  test "should get show" do
    get merchants_show_url
    assert_response :success
  end

  test "should get edit" do
    get merchants_edit_url
    assert_response :success
  end

  test "should get update" do
    get merchants_update_url
    assert_response :success
  end

  test "should get destroy" do
    get merchants_destroy_url
    assert_response :success
  end
end
