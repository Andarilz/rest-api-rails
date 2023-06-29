require 'rails_helper'

RSpec.describe Article, type: :model do

  let(:article) { build(:article) }

  describe "#validation" do

    it "validation test" do

      expect(article).to be_valid

    end

    it "invalid title" do

      article.title = ""

      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")

    end

    it "invalid content" do

      article.content = ""

      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")

    end

    it "invalid slag" do

      article.slag = ""

      expect(article).not_to be_valid
      expect(article.errors[:slag]).to include("can't be blank")

    end

    it "uniq slag" do

      article_first = create(:article, title: "Test1", content: "Test1", slag: "Test1")

      expect(article_first).to be_valid

      article_second = build(:article, title: "Test1", content: "Test1", slag: "Test1")

      expect(article_second).not_to be_valid

      expect(article_second.errors[:slag]).to include('has already been taken')

    end

  end

end
