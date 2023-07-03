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

    it "invalid slug" do

      article.slug = ""

      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")

    end

    it "uniq slug" do

      article_first = create(:article, title: "Test", content: "Test", slug: "Test")

      expect(article_first).to be_valid

      article_second = build(:article, title: "Test", content: "Test", slug: "Test")

      expect(article_second).not_to be_valid

      expect(article_second.errors[:slug]).to include('has already been taken')

    end

  end

  describe ".recent" do

    it "returns article in the correct order" do

      recent_article = create(:article)
      older_article  = create(:article, created_at: 1.hour.before)
      new_older_article  = create(:article, created_at: 2.hour.before)

      expect(described_class.recent).to eq([recent_article, older_article, new_older_article])


    end

  end

end
