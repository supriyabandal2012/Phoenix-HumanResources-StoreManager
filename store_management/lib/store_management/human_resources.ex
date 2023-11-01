defmodule StoreManagement.HumanResources do
  alias StoreManagement.HumanResources.Employee

  @url "http://localhost:4000/api"

  # get data (rem there's no database)
  def list_employees do
    with  {:ok, response} = HTTPoison.get(@url),
          {:ok, values} = Jason.decode(response.body) do
      keys_to_atoms(values["data"])
      |> Enum.map(&(struct(Employee, &1)))
    end
  end

  def get_employee(id) do
    with  {:ok, response} = HTTPoison.get(@url <> "/#{id}"),
          {:ok, values} = Jason.decode(response.body) do
              IO.inspect values
    end
  end

  defp keys_to_atoms(json_list) do
    json_list
    |> Enum.map(fn row ->
      row
      |> Enum.map(fn {k, v}-> {String.to_atom(k), v} end)
    |> Enum.into(%{})
    end)
  end


end
