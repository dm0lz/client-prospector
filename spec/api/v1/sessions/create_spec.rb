require 'rails_helper'

RSpec.describe 'POST /api/v1/sessions', type: :request do

  it 'returns 404 if email is invalid' do
    create(:user, email: 'redtest@site.com', password: 'password')
    json_post(api_v1_sessions_path, {email: 'test@site.com', password: 'password'})
    expect(response.status).to eq(404)
  end

  it 'returns 404 if password is invalid' do
    create(:user, email: 'test@site.com', password: 'redpassword')
    json_post(api_v1_sessions_path, {email: 'test@site.com', password: 'password'})
    expect(response.status).to eq(404)
  end


  context 'with valid user email and password' do

    it 'returns 200 with valid credentials' do
      create(:user, email: 'test@site.com', password: 'password')
      json_post(api_v1_sessions_path, {email: 'test@site.com', password: 'password'})
      expect(response.status).to eq(200)
    end

  end

end
