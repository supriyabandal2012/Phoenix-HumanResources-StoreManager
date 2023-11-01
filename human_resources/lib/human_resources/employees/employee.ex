defmodule HumanResources.Employees.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :date_of_hire, :date
    field :department, :string
    field :employee_id, :integer
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:date_of_hire, :department, :employee_id, :first_name, :last_name])
    |> validate_required([:date_of_hire, :department, :employee_id, :first_name, :last_name])
  end
end
