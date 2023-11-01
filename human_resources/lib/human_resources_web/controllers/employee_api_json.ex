defmodule HumanResourcesWeb.EmployeeApiJSON do

  def index(%{employees: employees}) do
    %{data:
      for(employee <- employees) do
        %{
          first_name: employee.first_name,
          last_name: employee.last_name,
          id: employee.employee_id,
          department: employee.department,
          date_of_hire: employee.date_of_hire
        }
      end
    }
  end

end
