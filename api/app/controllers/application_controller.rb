class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session # CSRF無効化
end
