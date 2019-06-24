class EmployeesController < ApplicationController
  before_action :set_employee, only: [:destroy]


  def create
        @employee = Employee.new(employee_params)

        respond_to do |format|
          if @employee.save
            format.html { redirect_to @employee.company, notice: 'Employee was successfully created.' }
            format.json { render :show, status: :created, location: @employee }
          else
            format.html { render :new }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
          end
        end
      end

  def destroy
      @employee.destroy
      respond_to do |format|
        format.html { redirect_to @employee.company, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

private

  def set_employee
  @employee =Employee.find(params[:id])
  end

  def employee_params
  @employee.require(:employee).permit(:company_id, :first_name, :last_name, :email)
  end

end  
