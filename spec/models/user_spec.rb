require 'spec_helper'

describe User do
  let(:user) { User.new(:name => "John Doe", :email => "john@doe.com", :password => "12345") }

  context "#initialize" do
    it "can be instantiated" do
      user.should be_an_instance_of(User)
    end

  end

  context "#save" do
    it "can be saved successfully" do
      user.save

      User.find_by_email("john@doe.com").should be_an_instance_of User
    end

    it "will not allow a null name" do
      user.name = nil
      expect { user.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will not allow a null email" do
      user.email = nil
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "will not allow a duplicate email" do
      user.save!
      user_2 = User.new(:name => "Johnathan Doe", :email => "john@doe.com", :password => "abcde")
      expect { user_2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "will not store a plaintext password" do
      user.save!
      # Get a copy of user from the database to make sure that user object is up to date and has password_digest set
      user_copy = User.find(user.id)
      user_copy.password_digest.should_not eq "12345"
    end
  end

end
