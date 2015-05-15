# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'rails_helper'
require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to{:password_digest}}
  it { should respond_to{:password}}
  it { should respond_to{:password_confirmation}}
  it { should respond_to{:authenticate}}

  it {should be_valid}    # this is just a sanity check that @user is initially valid

  describe "when name is not present" do
    before { @user.name = " "}
    it { should_not be_valid}

  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid}
  end

  describe "when email is not present" do
    before { @user.email = " "}
    it { should_not be_valid}
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                  foo@bar_bax.com foo@bar+bax.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.1st@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " "}
    it { should_not be_valid}
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch"}
    it { should_not be_valid}
  end


  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil}
    it { should_not be_valid}
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save}

    let (:found_user) { User.find_by_email(@user.email)} # should be user fetched from db

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password)}
      #it { expect(found_user.authenticate(user.password)).to eq user }


    end

    describe "with invalid password" do
      let (:user_for_invalid_password) { found_user.authenticate("invalid")}

      # it { should_not == user_for_invalid_password }
      # specify { user_for_invalid_password.should be_false}

      # it { should_not eq user_for_invalid_password }
      # specify { expect(user_for_invalid_password).to be_false }

      #it { expect(user_for_invalid_password).to be_nil }
      it { expect(user_for_invalid_password).to be_falsey }
    end
  end

end
