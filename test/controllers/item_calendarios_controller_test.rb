require 'test_helper'

class ItemCalendariosControllerTest < ActionController::TestCase
  setup do
    @item_calendario = item_calendarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_calendarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_calendario" do
    assert_difference('ItemCalendario.count') do
      post :create, item_calendario: { calendario_id: @item_calendario.calendario_id, cantidad: @item_calendario.cantidad, lista: @item_calendario.lista }
    end

    assert_redirected_to item_calendario_path(assigns(:item_calendario))
  end

  test "should show item_calendario" do
    get :show, id: @item_calendario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_calendario
    assert_response :success
  end

  test "should update item_calendario" do
    patch :update, id: @item_calendario, item_calendario: { calendario_id: @item_calendario.calendario_id, cantidad: @item_calendario.cantidad, lista: @item_calendario.lista }
    assert_redirected_to item_calendario_path(assigns(:item_calendario))
  end

  test "should destroy item_calendario" do
    assert_difference('ItemCalendario.count', -1) do
      delete :destroy, id: @item_calendario
    end

    assert_redirected_to item_calendarios_path
  end
end
