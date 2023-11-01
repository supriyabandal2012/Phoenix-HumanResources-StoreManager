defmodule StoreManagement.SMSFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StoreManagement.SMS` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        city: "some city",
        state: "some state",
        store_number: 42,
        street_adress: "some street_adress",
        zipcode: 42
      })
      |> StoreManagement.SMS.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        inventory_count: 42,
        name: "some name",
        retail_price: 120.5,
        vendor: "some vendor",
        wholesale_price: 120.5
      })
      |> StoreManagement.SMS.create_product()

    product
  end
end
