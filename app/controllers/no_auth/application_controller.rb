class NoAuth::ApplicationController < ApplicationController
  skip_before_action :authenticate_request!
end
