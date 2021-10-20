require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is created with all the valid attribues" do 
      @user = User.new(first_name: "User1",last_name:"lastname",email: "test@test.com", password: "foobar1234", password_confirmation:"foobar1234")
      expect(@user).to be_valid
    end
    it "is not valid without a password " do 
      @user = User.new(first_name: "User1", email: "test@test.com",password_confirmation:"foobar1234")
      expect(@user).to_not be_valid
    end
    it "is not valid without a password_confirmation field " do 
      @user = User.new(first_name: "User1",last_name:"lastname", email: "test@test.com",password: "foobar1234")
      expect(@user).to_not be_valid
    end
    it "is not valid with  password & password_confirmation field mismatch" do 
      @user = User.new(first_name: "User1",last_name:"lastname", email: "test@test.com", password: "foobar", password_confirmation:"mismatch")
      expect(@user).to_not be_valid
    end
    it "is created with a minimum length of 8 characters in password field" do 
      @user = User.new(first_name: "User1",last_name:"lastname", email: "test@test.com", password: "foobar", password_confirmation:"foobar")
      expect(@user).to_not be_valid
    end
    it "is not valid without a unique emailid" do 
      @user1 = User.new(first_name: "User1",last_name:"lastname", email: "test@test.com", password: "foobar1234", password_confirmation:"foobar1234")
      @user1.save
      @user2 = User.new(first_name: "User1",last_name:"lastname", email: "test@test.com", password: "boofar1345", password_confirmation:"boofar1345")
      expect(@user2).to_not be_valid
    end
    it "requires unique emailid not casesensitive" do 
      @user1 = User.new(first_name: "User1",last_name:"lastname", email: "test@test.com", password: "foobar1234", password_confirmation:"foobar1234")
      @user1.save
      @user2 = User.new(first_name: "User1",last_name:"lastname", email: "test@test.com", password: "boofar1345", password_confirmation:"boofar1345")
      @user2.email.upcase 
      expect(@user2).to_not be_valid
    end

    it "requires Email" do 
      @user = User.new(first_name: "User1",last_name:"lastname",email: "test@test.com", password: "foobar1234", password_confirmation:"foobar1234")
      @user.email=nil
      expect(@user).to_not be_valid
    end
    it "requires first name" do 
      @user = User.new(first_name: "User1",last_name:"lastname",email: "test@test.com", password: "foobar1234", password_confirmation:"foobar1234")
      @user.first_name=nil
      expect(@user).to_not be_valid
    end
    it "requires last name" do 
      @user = User.new(first_name: "User1",last_name:"lastname",email: "test@test.com", password: "foobar1234", password_confirmation:"foobar1234")
      @user.last_name=nil
      expect(@user).to_not be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    it "should remove extra space in the email field when validated" do 
      @user = User.create(first_name: "User1",last_name:"lastname",email: "test@test.com", password: "foobar1234", password_confirmation:"foobar1234")
      email=" test@test.com "
      password="foobar1234"
      loginuser=User.authenticate_with_credentials(email,password)
      loginuser.validate
    end
    it "should allow  all cases in email field" do 
      @user = User.create(first_name: "User1",last_name:"lastname",email: "test@test.com", password: "foobar1234", password_confirmation:"foobar1234")
      email="TEST@TEST.COM"
      password="foobar1234"
      loginuser=User.authenticate_with_credentials(email,password)
      expect(loginuser).to eq(@user)
    end
  end
end