defmodule StoreManagementWeb.EmployeeLive.Index do
  alias StoreManagement.HumanResources
  use StoreManagementWeb, :live_view

  alias StoreManagement.HumanResources

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :employees, HumanResources.list_employees())}
  end

end
