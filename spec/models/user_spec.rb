require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject {
    User.new(     
    name: 'User',     
    email: 'user@test.com',     
    password: '123456',     
    password_confirmation: '123456') 
  }
  
  describe 'Validations' do
    # validation examples here
    it "check if the password and confirmation password matches" do
      checking = User.new(name: "akhi", email: "akhi@gmail.com", password: "akhila", password_confirmation: "akhila")
      expect(checking.errors.full_messages).to be_empty
    end

    it 'is not valid without a password' do       
      subject.password = nil       
      expect(subject).to_not be_valid     
    end

    it 'is not valid without a name' do       
      subject.name = nil       
      expect(subject).to_not be_valid     
    end
    it 'is not valid without a email' do       
      subject.email = nil       
      expect(subject).to_not be_valid     
    end

    it 'is not valid without a password_confirmation' do       
      subject.password_confirmation = nil       
      expect(subject).to_not be_valid     
    end
    it 'is not valid without password match with password_confirmation ' do       
      subject.password_confirmation = 'goodere'       
      expect(subject).to_not be_valid  
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")   
    end
    it "check if the email is unique" do
      checking = User.create(name: "akhi2", email: "user@test.com", password: "akhila21", password_confirmation: "akhila21")
      
      expect(subject).to_not be_valid 
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end
    it "check the length of the password" do
      subject.password = 'akhi'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "check the length of the password" do
      subject.password = 'akhila'
      subject.password_confirmation = 'akhila'
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end

  end

  describe '.authenticate_with_credentials' do
    it "should authenticate when credentials are valid" do
      subject.save!
      auth = User.authenticate_with_credentials(subject.email, subject.password)
      expect(auth).to eq subject
    end
  end
end
