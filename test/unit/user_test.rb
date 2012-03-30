require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    %w{Administrator Member}.each do |role|
      Role.create(:name => role)
    end

    @admin = users(:admin)
    @admin.password = "password"
    @admin.password_confirmation = "password"

    @member = users(:member)
    @member.password = "password"
    @member.password_confirmation = "password"

    @admin.save
    @member.save
  end

  test "last_login" do
    user = @admin

    #test minutes ago
    user.last_login_at = 2.minutes.ago
    assert_equal user.last_login(Time.now), "Two minutes ago"

    #test hours ago
    user.last_login_at = 3.hours.ago
    assert_equal user.last_login(Time.now), "Three hours ago"
    user.last_login_at = Time.now.yesterday
    assert_equal user.last_login(Time.now), "Yesterday"

    #test days
    user.last_login_at = Time.now.yesterday
    assert_equal user.last_login(Time.now), "Yesterday"
    user.last_login_at = 4.days.ago
    assert_equal user.last_login(Time.now), "Four days ago"

    #test weeks
    user.last_login_at = 1.weeks.ago
    assert_equal user.last_login(Time.now), "One week ago"

    #test months
    user.last_login_at = 5.months.ago
    assert_equal user.last_login(Time.now + 5.minutes), "Five months ago"

    #test years
    user.last_login_at = 2.years.ago
    assert_equal user.last_login(Time.now), "Over a year ago"
  end
end
