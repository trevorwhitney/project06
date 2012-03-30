class Members::MembersController < ApplicationController
  before_filter :require_user
  filter_access_to :all
end