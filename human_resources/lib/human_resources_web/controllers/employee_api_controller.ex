defmodule HumanResourcesWeb.EmployeeApiController do

  use HumanResourcesWeb, :controller

  def index(conn, _params) do
    employees = HumanResources.Employees.list_employees()
    render(conn, "index.json", employees: employees)
  end
end
