class HomeController < ApplicationController
  before_action :authenticate_user!

  def home
    # Tu código aquí
  end
end
