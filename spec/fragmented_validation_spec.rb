require 'spec_helper'

describe FragmentedValidation do

    let(:person) do
        User.class_eval do
          fragmented_validation
        end
        User.new
    end

    it "should generate valid_\#{attribute}? methods" do
      person.should respond_to(:valid_username?, :valid_password?)
    end

    describe "#frag_validation" do
      it "should only validate the passed attribute names" do
         person.password = ""
         person.username = ""

         person.frag_validation(:username, :password).should be_false
         person.errors[:email].should be_empty
         person.errors[:password].should_not be_empty
         person.errors[:username].should_not be_empty
      end

      it "should ignore unknown attributes" do
        person.frag_validation(:ghost_method, :bad_method).should be_true
      end
    end

    describe "#frag_valid_except" do
      it "should ignore the attributes included in the parameter" do
         person.password = ""
         person.username = "myusername"
         person.email = "test@mail.com"
         person.frag_valid_except(:password).should be_true
      end
    end

    describe "#frag_valid_on" do
      it "should only validate the attributes which are included in the parameter" do
        person.password = "mypassword"
        person.password = "mypassword"
        person.username = "myusername"
        person.email = ""

        person.frag_valid_on(:username, :password).should be_true
      end
    end
end
