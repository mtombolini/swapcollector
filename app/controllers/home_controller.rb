<<<<<<< HEAD
class HomeController < ApplicationController
  before_action :authenticate_user!

  def home
    # Tu código aquí
  end
end
=======
class HomeController < ApplicationController
  before_action :authenticate_user!

  def home
    @products = Product.all
  end

end
>>>>>>> cruds_products
