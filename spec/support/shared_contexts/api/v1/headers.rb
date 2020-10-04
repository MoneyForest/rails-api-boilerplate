RSpec.shared_context 'with valid request headers' do
  let(:headers) do
    {
        'Authorization' => 'Basic ' + auth_token,
        'Accept' => 'application/json'
    }
  end
end

RSpec.shared_context 'with invalid request headers' do
  let(:headers) do
    {
        'Authorization' => 'Basic ' + auth_token.reverse,
        'Accept' => 'application/json'
    }
  end
end
