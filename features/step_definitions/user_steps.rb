module UserStepHelpers
  def login_user user
    page.driver.post secret_login_path, :id => user.id
    expect(page.status_code).to eq(200)
  end
end

World(UserStepHelpers)

Given /^I am logged out$/ do
  pass
end

Given /^I am logged in as "([^"]+)"$/ do |email|
  login_user User.find_by_email!(email)
end

Given /^I am logged in as (\w+) User$/ do |role|
  @user = FactoryGirl.create :user, :roles => [ role.underscore ]
  login_user @user
end