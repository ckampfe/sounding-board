require 'spec_helper'

describe ControllerHelper do
  let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  describe "#create" do
    let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }
    it "creates a user session" do
      helper.current_user_assign(user)
      expect(session[:current_user_id]).to eq User.find_by_email(user.email).id
    end
  end





end
