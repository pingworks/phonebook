require_relative '../spec_helper'
require 'airborne'

describe 'API' do
  let(:valid_attributes){ { name: 'Marcel', phone: '1235455667688' } }

  describe 'GET /contacts' do
    it 'json: returns an empty array of contacts' do
      get ENV['ENDPOINT'] + '/contacts.json'
      expect_status 200
      JSON.parse(body).should == []
    end
  end

  # describe 'POST /contacts' do
  #   it 'create with valid attributes' do
  #     post ENV['ENDPOINT'] + '/contacts', { :name => 'Marcel', :phone => '1235455667688' }
  #     expect_status 201
  #     expect_json_types(id: :int)
  #     expect_json(name: valid_attributes[:name])
  #     expect_json(phone: valid_attributes[:phone])
  #   end
  # end

  # describe 'PUT /contacts/:id' do
  #   let(:new_attributes){ { name: 'Marcel Scherf', phone: '491762344545656' } }
  #
  #   it 'update contact info' do
  #     Phonebook::Model::Contact.repository.add(Phonebook::Model::Contact.new(valid_attributes))
  #
  #     last_contact = Phonebook::Model::Contact.repository.all.last
  #     put "/contacts/#{last_contact.id}", new_attributes
  #
  #     last_response.status.should == 200
  #
  #     result = JSON.parse(last_response.body).to_h
  #     result['name'].should eql new_attributes[:name]
  #     result['phone'].should eql new_attributes[:phone]
  #   end
  #
  # end
end
