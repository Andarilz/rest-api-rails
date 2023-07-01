require "rails_helper"

RSpec.describe "/articles routing" do

  aggregate_failures do

    it "routes to articles#index" do

      expect(get "/articles").to route_to("articles#index")

    end

  end

end
