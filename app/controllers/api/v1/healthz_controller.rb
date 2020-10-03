class Api::V1::HealthzController < Api::V1::ApplicationController
  def index
    head :ok
  end
end
