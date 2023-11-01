defmodule StoreManagement.SMS.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :city, :string
    field :state, :string
    field :store_number, :integer
    field :street_adress, :string
    field :zipcode, :integer
    has_many :products, StoreManagement.SMS.Product

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:store_number, :street_adress, :city, :state, :zipcode])
    |> validate_required([:store_number, :street_adress, :city, :state, :zipcode])
  end
end
