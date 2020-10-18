require 'rails_helper'

RSpec.describe '/api/v1/teams', type: :request do
  describe 'GET /api/v1/teams' do
    include_context 'with committer schema check'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a team associated user' do
        include_context 'with a team associated user'
        include_examples 'committer schema check'

        it 'returns a 200 response' do
          subject
          expect(response).to have_http_status :ok
        end
      end

      context 'with no team associated user' do
        include_examples 'committer schema check'

        it 'returns a 200 response' do
          subject
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        it 'returns a 401 response' do
          subject
          expect(response).to have_http_status :unauthorized
        end
      end
    end
  end

  describe 'POST /api/v1/teams' do
    include_context 'with committer schema check'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a team' do
        include_examples 'committer schema check'

        let(:params) { { name: "team" } }

        it 'returns a 200 response' do
          expect(Project.count).to eq(0)
          subject
          expect(request.path).to eq api_v1_teams_path
          expect(response).to have_http_status :ok
          expect(Project.count).to eq(1)
          expect(Team.find(JSON.parse(response.body)['team']['id'])).to_not be_nil
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:params) { { name: "team" } }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_teams_path
          expect(response).to have_http_status :unauthorized
        end
      end
    end
  end

  describe 'GET /api/v1/teams/:id' do
    include_context 'with committer schema check'
    include_context 'with a team associated user'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a team' do
        include_context 'with a team associated user'
        include_examples 'committer schema check'

        let(:id) { team.id }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_team_path(team)
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { team.id }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_team_path(team)
          expect(response).to have_http_status :unauthorized
        end
      end

      context 'with no team' do
        include_context 'with a team associated user'
        include_context 'with valid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { team.id + 1}

        it 'returns a 404 response' do
          subject
          expect(request.path).to eq api_v1_team_path(team.id + 1)
          expect(response).to have_http_status :not_found
        end
      end
    end
  end

  describe 'PUT /api/v1/teams/:id' do
    include_context 'with committer schema check'
    include_context 'with a team associated user'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a team' do
        include_examples 'committer schema check'

        let(:id) { team.id }
        let(:params) { { name: "team" } }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_team_path(team)
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { team.id }
        let(:params) { { name: "team" } }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_team_path(team)
          expect(response).to have_http_status :unauthorized
        end
      end

      context 'with no team' do
        include_context 'with a team associated user'
        include_context 'with valid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { team.id + 1}

        it 'returns a 404 response' do
          subject
          expect(request.path).to eq api_v1_team_path(team.id + 1)
          expect(response).to have_http_status :not_found
        end
      end
    end
  end

  describe 'DELETE /api/v1/teams/:id' do
    include_context 'with committer schema check'
    include_context 'with a team associated user'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a team' do
        include_examples 'committer schema check'

        let(:id) { team.id }

        it 'returns a 200 response' do
          expect(Project.count).to eq(1)
          subject
          expect(request.path).to eq api_v1_team_path(team)
          expect(response).to have_http_status :ok
          expect(Project.count).to eq(0)
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { team.id }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_team_path(team)
          expect(response).to have_http_status :unauthorized
        end
      end

      context 'with no team' do
        include_context 'with a team associated user'
        include_context 'with valid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { team.id + 1}

        it 'returns a 404 response' do
          subject
          expect(request.path).to eq api_v1_team_path(team.id + 1)
          expect(response).to have_http_status :not_found
        end
      end
    end
  end
end
