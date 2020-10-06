RSpec.shared_context 'with committer schema check' do
  shared_examples 'committer schema check' do
    it 'confirm json schema' do
      subject
      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end
end
