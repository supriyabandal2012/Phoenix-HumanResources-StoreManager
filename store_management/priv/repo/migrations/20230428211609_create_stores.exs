defmodule StoreManagement.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :store_number, :integer
      add :street_adress, :string
      add :city, :string
      add :state, :string
      add :zipcode, :integer

      timestamps()
    end
  end
end
