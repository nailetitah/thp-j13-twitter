require_relative '../lib/app'

describe "login_twitter" do
  it "checks if twitter connexion works" do
    expect(login_twitter).not_to be_nil
  end
end