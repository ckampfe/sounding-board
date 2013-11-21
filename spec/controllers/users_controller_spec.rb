require 'spec_helper'

# describe the controller
  # describe a method
    # describe what it does

describe UsersController do
  let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  # describe "#create" do
  #   let(:user) { User.create(:name => "John Doe", :email => "john@doe.com", :password => "12345") }


  #   it "creates a user session" do
  #     current_user_assign(:user)

  #     expect(session[:current_user_id]).to eq User.find_by_email(user.email).id
  #   end



  # end

  describe "#create_login" do
      it "finds a user by email" do
        User.find_by_email(user.email).should eq "john@doe.com"
      end

      it "returns an error if no user if found" do
        expect User.find_by_email("noemail@email.com").to raise_error(ActiveRecord::StatementInvalid)
      end

      it "authenticates a matching users password" do
        user.authenticate(user.password).should eq user
      end

      it "does not authenticate a non-matching user password" do
        user.authenticate("notpassword").should eq false
      end
  end


end
