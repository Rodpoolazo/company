class EmployeesController < ApplicationController

  def create
        @employee = Employee.new(employee_params)

        respond_to do |format|
          if @employe.save
            format.html { redirect_to @employee.company, notice: 'Category was successfully created.' }
            format.json { render :show, status: :created, location: @employee }
          else
            format.html { render :new }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
          end
        end
      end








def employee_params
  @employee.require(:employee).permit(:company_id, :first_name, :last_name, :email)
end
