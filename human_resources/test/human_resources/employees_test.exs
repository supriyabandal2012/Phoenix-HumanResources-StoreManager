defmodule HumanResources.EmployeesTest do
  use HumanResources.DataCase

  alias HumanResources.Employees

  describe "employees" do
    alias HumanResources.Employees.Employee

    import HumanResources.EmployeesFixtures

    @invalid_attrs %{date_of_hire: nil, department: nil, employee_id: nil, first_name: nil, last_name: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Employees.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Employees.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{date_of_hire: ~D[2023-04-27], department: "some department", employee_id: 42, first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Employee{} = employee} = Employees.create_employee(valid_attrs)
      assert employee.date_of_hire == ~D[2023-04-27]
      assert employee.department == "some department"
      assert employee.employee_id == 42
      assert employee.first_name == "some first_name"
      assert employee.last_name == "some last_name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Employees.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{date_of_hire: ~D[2023-04-28], department: "some updated department", employee_id: 43, first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Employee{} = employee} = Employees.update_employee(employee, update_attrs)
      assert employee.date_of_hire == ~D[2023-04-28]
      assert employee.department == "some updated department"
      assert employee.employee_id == 43
      assert employee.first_name == "some updated first_name"
      assert employee.last_name == "some updated last_name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Employees.update_employee(employee, @invalid_attrs)
      assert employee == Employees.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Employees.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Employees.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Employees.change_employee(employee)
    end
  end
end
