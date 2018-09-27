class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  http_basic_authenticate_with name: "soat", password: "insurance"
end