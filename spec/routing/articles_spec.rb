require "rails_helper"

RSpec.describe "/articles routing" do

    it "routes to articles#index" do

      aggregate_failures do

        expect(get "/articles").to route_to("articles#index")

    end

  end

end
