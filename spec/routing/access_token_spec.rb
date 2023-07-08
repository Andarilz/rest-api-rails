require "rails_helper"

RSpec.describe "routing access token" do

  it "root to access token create action" do

    expect(post "/login").to route_to("access_tokens#create")

  end

end
