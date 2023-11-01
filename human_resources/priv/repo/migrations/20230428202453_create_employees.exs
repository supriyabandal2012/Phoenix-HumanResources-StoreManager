defmodule HumanResources.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :date_of_hire, :date
      add :department, :string
      add :employee_id, :integer
      add :first_name, :string
      add :last_name, :string

      timestamps()
    end
  end
end
