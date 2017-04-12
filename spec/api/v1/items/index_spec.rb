require 'rails_helper'

RSpec.describe 'GET /api/v1/items', type: :request do

  before(:each) do
    create(:user, email: 'items@site.com', password: 'password')
    json_post(api_v1_sessions_path, {email: 'items@site.com', password: 'password'})
    @jwt_token = JSON.parse(response.body)["data"]["sessions"]["jwt"]
  end

  it 'returns 200' do
    json_get(api_v1_items_path, {}, {'HTTP_AUTH_TOKEN' => @jwt_token})
    expect(response.status).to eq(200)
  end

end
