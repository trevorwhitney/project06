class User < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
	acts_as_authentic

  has_many :assignments
  has_many :roles, :through => :assignments

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def full_name
    [first_name, last_name].compact.join(' ');
  end

  def last_login(current_time)
    now = current_time.strftime("%s").to_i
    last_login = last_login_at.strftime("%s").to_i

    minute = 60
    hour = minute * 60
    day = hour * 24
    week = day * 7
    month = 2629743
    year = 31556926

    time_since_last_login = now - last_login

    if time_since_last_login < minute
      last_login_str = "Less than a minute ago"
    elsif time_since_last_login < hour
      minutes_ago = time_since_last_login/minute
      last_login_str = time_ago_string(minutes_ago, "minute")
    elsif time_since_last_login < day
      hours_ago = time_since_last_login/hour
      hours_since_yesterday = current_time.strftime("%H").to_i
      if hours_ago >= hours_since_yesterday
        last_login_str = "Yesterday"
      else
        last_login_str = time_ago_string(hours_ago, "hour")
      end
    elsif time_since_last_login < week
      days_ago = time_since_last_login/day
      last_login_str = time_ago_string(days_ago, "day")
    elsif time_since_last_login < month
      weeks_ago = time_since_last_login/week
      last_login_str = time_ago_string(weeks_ago, "week")
    elsif time_since_last_login < year
      months_ago = time_since_last_login/month
      last_login_str = time_ago_string(months_ago, "month")
    else
      years_ago = time_since_last_login/year
      last_login_str = time_ago_string(years_ago, "Year")
    end

  end

  private

  def time_ago_string(time_ago, singular_unit)
    pluralize(time_ago, singular_unit) + " ago"
  end
  
end
