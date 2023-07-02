require 'rails_helper'

RSpec.describe ArticlesController do

  describe "#index" do

    it "success" do

      get "/articles"

      expect(response).to have_http_status(:ok)

    end

    it "get json" do

      article = create(:article)

      get "/articles"

      expect(json_data.length).to eq(1)

      expected = json_data.first

      aggregate_failures do

        expect(expected[:id]).to eq(article.id.to_s)

        expect(expected[:type]).to eq("article")

        expect(expected[:attributes]).to eq(
          title: article.title,
          content: article.content,
          slug: article.slug
        )

      end

    end

  end

end
