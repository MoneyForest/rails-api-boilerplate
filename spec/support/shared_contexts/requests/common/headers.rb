RSpec.shared_context 'with valid authenticated request headers' do
  let(:headers) do
    {
      'Authorization' => 'Basic ' + auth_token,
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end
end

RSpec.shared_context 'with invalid authenticated request headers' do
  let(:headers) do
    {
      'Authorization' => 'Basic ' + auth_token.reverse,
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end
end
