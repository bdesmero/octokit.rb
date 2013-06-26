require 'helper'

describe Octokit::Client::LegacySearch do

  before do
    Octokit.reset!
    @client = oauth_client
  end

  describe ".legacy_search_issues", :vcr do
    it "returns matching issues" do
      issues = @client.search_issues("sferik/rails_admin", "activerecord")
      expect(issues).to_not be_empty
      assert_requested :get, github_url("/legacy/issues/search/sferik/rails_admin/open/activerecord")
    end
  end # .search_issues

  describe ".legacy_search_repos", :vcr do
    it "returns matching repositories" do
      repositories = @client.search_repositories("One40Proof")
      expect(repositories).to_not be_empty
      assert_requested :get, github_url("/legacy/repos/search/One40Proof")
    end
  end # .legacy_search_repos

  describe ".legacy_search_users", :vcr do
    it "returns matching username" do
      users = @client.search_users("sferik")
      expect(users.first.username).to eq("sferik")
      assert_requested :get, github_url("/legacy/user/search/sferik")
    end
  end # .legacy_searcy_users

end