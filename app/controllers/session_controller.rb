require './app/views/session_view'

class SessionController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def sign_in
    username = @view.ask_for_username
    password = @view.ask_for_password
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      @view.sign_in_successfully(employee)
      return employee
    else
      @view.wrong_credentials
      sign_in
    end
  end
end
