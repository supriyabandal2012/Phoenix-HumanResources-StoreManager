defmodule StoreManagement.SMSTest do
  use StoreManagement.DataCase

  alias StoreManagement.SMS

  describe "stores" do
    alias StoreManagement.SMS.Store

    import StoreManagement.SMSFixtures

    @invalid_attrs %{city: nil, state: nil, store_number: nil, street_adress: nil, zipcode: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert SMS.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert SMS.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{city: "some city", state: "some state", store_number: 42, street_adress: "some street_adress", zipcode: 42}

      assert {:ok, %Store{} = store} = SMS.create_store(valid_attrs)
      assert store.city == "some city"
      assert store.state == "some state"
      assert store.store_number == 42
      assert store.street_adress == "some street_adress"
      assert store.zipcode == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SMS.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{city: "some updated city", state: "some updated state", store_number: 43, street_adress: "some updated street_adress", zipcode: 43}

      assert {:ok, %Store{} = store} = SMS.update_store(store, update_attrs)
      assert store.city == "some updated city"
      assert store.state == "some updated state"
      assert store.store_number == 43
      assert store.street_adress == "some updated street_adress"
      assert store.zipcode == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = SMS.update_store(store, @invalid_attrs)
      assert store == SMS.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = SMS.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> SMS.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = SMS.change_store(store)
    end
  end

  describe "products" do
    alias StoreManagement.SMS.Product

    import StoreManagement.SMSFixtures

    @invalid_attrs %{inventory_count: nil, name: nil, retail_price: nil, vendor: nil, wholesale_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert SMS.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert SMS.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{inventory_count: 42, name: "some name", retail_price: 120.5, vendor: "some vendor", wholesale_price: 120.5}

      assert {:ok, %Product{} = product} = SMS.create_product(valid_attrs)
      assert product.inventory_count == 42
      assert product.name == "some name"
      assert product.retail_price == 120.5
      assert product.vendor == "some vendor"
      assert product.wholesale_price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SMS.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{inventory_count: 43, name: "some updated name", retail_price: 456.7, vendor: "some updated vendor", wholesale_price: 456.7}

      assert {:ok, %Product{} = product} = SMS.update_product(product, update_attrs)
      assert product.inventory_count == 43
      assert product.name == "some updated name"
      assert product.retail_price == 456.7
      assert product.vendor == "some updated vendor"
      assert product.wholesale_price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = SMS.update_product(product, @invalid_attrs)
      assert product == SMS.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = SMS.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> SMS.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = SMS.change_product(product)
    end
  end
end
