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

    it "returns article in the propper order" do
      recent_article = create(:article)
      older_article  = create(:article, created_at: 1.hour.before)
      new_older_article  = create(:article, created_at: 2.hour.before)

      get"/articles"

      ids = json_data.map{|item| item[:id].to_i}
      expect(ids).to eq([recent_article.id, older_article.id, new_older_article.id])
    end

    it "pagination result" do
      article_1, article_2, article_3 = create_list(:article, 3)

      get "/articles", params: { page: { number: 2, size: 1 } }

      expect(json_data.length).to eq(1)
      expect(json_data.first[:id]).to eq(article_2.id.to_s)

    end

    it "contains pagination link in response" do
      article_1, article_2, article_3 = create_list(:article, 3)

      get "/articles", params: { page: { number: 2, size: 1 } }

      expect(json[:links].length).to eq(5)
      expect(json[:links].keys).to contain_exactly(
        :first, :prev, :next, :last, :self
      )

    end

  end

end
