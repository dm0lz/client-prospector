module RequestHelper

  def json_post(path, params = {}, headers = {})
    headers.merge!({ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' })
    post(path, params: params.to_json, headers: headers)
  end

  def json_get(path, params = {}, headers = {})
    headers.merge!({ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' })
    get(path, params: params, headers: headers)
  end

end
