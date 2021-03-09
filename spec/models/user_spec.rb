require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "should save a new user with valid attributes" do 
      @user = User.new(
        name: "Raf Reza",
        email: "raf.reza@hotmail.com", 
        password: "ineedabetterpassword",
        password_confirmation: "ineedabetterpassword",
      )

      @user.save

      expect(@user).to be_valid
    end

    it 'should be invalid if password and password confirmation do not match' do

      @user = User.new(
        name: "Raf Reza",
        email: "raf.reza@hotmail.com",
        password: 'ineedapassword',
        password_confirmation: 'ineedabetterpassword'
        )

      @user.save

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end


    it "should be invalid if email already exists" do 
      @user = User.new(
        name: "Raf Reza",
        email: "raf.reza@hotmail.com", 
        password: "ineedabetterpassword",
        password_confirmation: "ineedabetterpassword",
      )

      @user.save

      @user2 = User.new(
        name: "Raf Reza",
        email: "RAF.REZA@hotmail.com",
        password: "ineedapassword",
        password_confirmation: "ineedapassword"
      )

      @user2.save

      expect(@user2).not_to be_valid
    end

    it "should be invalid if password is shorter than 5 characters" do 
      @user = User.new(
        name: "Raf Reza",
        email: "raf.reza@hotmail.com", 
        password: "weak",
        password_confirmation: "weak",
      )

      @user.save

      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "should be valid with valid credentials" do
      @user = User.new(
        name: "Raf Reza",
        email: "armsweak@gmail.com",
        password: "ineedabetterpassword",
        password_confirmation: "ineedabetterpassword",
      )

      @user.save

      loginInfo = User.authenticate_with_credentials(@user.email, @user.password)

      expect(loginInfo.id).to eq(@user.id)
    end

    it "should be valid with when email has whitespaces" do
      @user = User.new(
        name: "Raf Reza",
        email: "raf.reza@hotmail.com",
        password: "ineedabetterpassword",
        password_confirmation: "ineedabetterpassword",
      )

      @user.save

      loginInfo = User.authenticate_with_credentials("   raf.reza@hotmail.com", @user.password)

      expect(loginInfo.id).to eq(@user.id)
    end

  end
end
