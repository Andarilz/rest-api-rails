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
      expect(article.errors[:title]).to eq("can't be blank")

    end

  end


end
