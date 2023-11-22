require "test_helper"

class UserTest < ActiveSupport::TestCase
  # Test de creacion de un usuario

  test "crea un usuario con exito" do
    user = User.new(name: "Ricardo", email: "ricardo@example.com", password: "password")
    assert user.save
  end

  # Test de validacion del nombre del usuario

  test "el nombre del usuario es obligatorio" do
    user = User.new(email: "ricardo@example.com", password: "password")
    assert_not user.save
    assert user.errors[:name].any?
  end

  # Test de validacion del correo electronico del usuario

  test "el correo electronico del usuario es obligatorio" do
    user = User.new(name: "Ricardo", password: "password")
    assert_not user.save
    assert user.errors[:email].any?
  end


  # Test de validacion del formato del correo electronico del usuario

  test "el formato del correo electronico del usuario debe ser valido" do
    user = User.new(name: "Ricardo", email: "ricardo@example.com", password: "password")
    assert user.save
  end

  # Test de validacion de la contrasena del usuario

  test "la contrasena del usuario es obligatoria" do
    user = User.new(name: "Ricardo", email: "ricardo@example.com")
    assert_not user.save
    assert user.errors[:password].any?
  end

  # Test de validacion de la longitud de la contrasena del usuario

  test "la longitud de la contrasena del usuario debe ser mayor que 6" do
    user = User.new(name: "Ricardo", email: "ricardo@example.com", password: "password")
    assert_not user.save
    assert user.errors[:password].any?
  end

  # Test de la relación del usuario con los productos

  test "el usuario tiene muchos productos" do
    user = User.new(name: "Ricardo", email: "ricardo@example.com", password: "password")
    assert user.save

    product1 = Product.new(name: "Producto 1")
    product2 = Product.new(name: "Producto 2")
    user.products << product1
    user.products << product2

    assert_equal 2, user.products.size
  end
end
