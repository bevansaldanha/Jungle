require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should not create a user without a password && password_confirmation' do
      user_params =  {name:'bob', email:'email', password:'password', password_confirmation: ''}
      user = User.new(user_params)
      expect(user.valid?).to be false
    end
    it 'should not create a user without the password && password_confirmation being the same' do
      user_params =  {name:'bob', email:'email', password:'password', password_confirmation: 'paswird'}
      user = User.new(user_params)
      expect(user).to_not be_valid
    end
    it 'should not create a user with an email that already exists' do
      user_params =  {name:'bob', email:'email', password:'password', password_confirmation: 'password'}
      user = User.create(user_params)

      user_params2 =  {name:'john', email:'Email', password:'password', password_confirmation: 'password'}

      user2 = User.new(user_params2)
      
      expect(user2.valid?).to be false
    end
    it 'should not create a user without an Email or name' do
      user_params =  {name: nil, email:'email', password:'password', password_confirmation: 'password'}
      user = User.new(user_params)

      expect(user.valid?).to be false
    end
    it 'should not create a user with a password less than the minimum length' do
      user_params =  {name:'bob', email:'email', password:'pass', password_confirmation: 'pass'}
      user = User.new(user_params) 
      expect(user.valid?).to be false

    end

  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate a valid user' do
      user_params =  {name:'bob', email:'email', password:'password', password_confirmation: 'password'}
      user = User.create(user_params) 
      auth_user = User.authenticate_with_credentials(user_params[:email], 'password')
      expect(auth_user).to_not be_valid
    end
  end
end

=begin

It must be created with a password and password_confirmation fields
These need to match so you should have an example for where they are not the same
These are required when creating the model so you should also have an example for this
Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
Email, first name, and last name should also be required

=end