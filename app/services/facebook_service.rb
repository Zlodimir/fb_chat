class FacebookService
  attr_reader :email, :password, :page

  def initialize(params = {})
    @email    = params[:email]
    @password = params[:password]
  end

  def login
    agent = Mechanize.new
    login_page = agent.get('https://facebook.com/')
    login_form = agent.page.form_with(method: 'POST')
    login_form.email = email
    login_form.pass = password
    @page = agent.submit(login_form)
  end
end
