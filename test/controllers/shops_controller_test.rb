require 'test_helper'

class ShopsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Guardians of the Galaxy'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

  test "markup needed for shop.js.coffee is in place" do
    get :index
    assert_select '.shop .entry > img', 3
    assert_select '.entry input[type=submit]', 3
  end

end
