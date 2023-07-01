require "rails_helper"

RSpec.describe "/articles routing" do

    it "routes to articles#index" do

      aggregate_failures do

        expect(get "/articles").to route_to("articles#index")

      end

    end

    it "routes to articles#show" do

      aggregate_failures do

        expect(get "/articles/2").to route_to("articles#show", id: "2")

    end

  end

end
