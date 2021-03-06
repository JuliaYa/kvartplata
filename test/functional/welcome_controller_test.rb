# encoding: UTF-8
require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  def teardown
    Timecop.return
  end

  test 'should redirect to sign_in path if no user logged in' do
    get :index
    assert_redirected_to new_user_session_path
  end


  test 'should redirect to new metric if no metric yet and date near payment date' do
    sign_in create(:user)
    date = 5.years.since.change(:day => Metric::PAYMENT_DAY)
    Timecop.freeze(date)
    get :index
    assert_redirected_to new_metric_path
  end

  test 'should show report if this month metric already in database and date near payment date' do
    sign_in create(:user)
    date = 5.years.since.change(:day => Metric::PAYMENT_DAY)
    Timecop.freeze(date)

    create(:apartment_info)
    create(:metric, month: 2.month.ago)
    create(:metric, month: 1.month.ago)
    create(:metric, month: DateTime.now)

    get :index
    assert_response :success
    assert_select '.report h2', /Отчет за/
  end

end
