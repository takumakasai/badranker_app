class SamplesController < ApplicationController
  # CSRFエラー対策
  skip_before_action :verify_authenticity_token

  # サンプルデータを返す
  def sample
    render json: { status: 'SUCCESS', message: 'Get sample data', data: { sample: 'hogehoge' } }
  end
end
