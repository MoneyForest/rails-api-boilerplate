class NoAuth::HealthzController < NoAuth::ApplicationController
  def index
    head :ok
  end
end
