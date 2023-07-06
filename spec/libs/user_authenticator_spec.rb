require "rails_helper"

describe UserAuthenticator do

  describe "#perform" do

    context "when code incorrect" do

      it "should raise an error" do

        authenticator = described_class.new("sample code")

        expect(authenticator.perform).to raise_error(AuthenticationError)

        expect(authenticator.user).to be_nil

      end

    end

  end

end
