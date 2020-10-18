require 'rails_helper'

RSpec.describe '/api/v1/projects', type: :request do
  describe 'GET /api/v1/projects' do
    include_context 'with committer schema check'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a project' do
        include_context 'with a project associated user'
        include_examples 'committer schema check'

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_projects_path
          expect(response).to have_http_status :ok
        end
      end

      context 'with no project' do
        include_examples 'committer schema check'

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_projects_path
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
          expect(request.path).to eq api_v1_projects_path
          expect(response).to have_http_status :unauthorized
        end
      end
    end
  end

  describe 'POST /api/v1/projects' do
    include_context 'with committer schema check'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a project' do
        include_examples 'committer schema check'

        let(:params) { { name: "Project", description: "This is Project" } }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_projects_path
          expect(response).to have_http_status :ok
          expect(Project.find(JSON.parse(response.body)['project']['id'])).to_not be_nil
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:params) { { name: "Project", description: "This is Project" } }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_projects_path
          expect(response).to have_http_status :unauthorized
        end
      end
    end
  end

  describe 'GET /api/v1/projects/:id' do
    include_context 'with committer schema check'
    include_context 'with a project associated user'
    include_context 'with a defined user'

     context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a project' do
        include_context 'with a project associated user'
        include_examples 'committer schema check'

        let(:id) { project.id }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_project_path(project)
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { project.id }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_project_path(project)
          expect(response).to have_http_status :unauthorized
        end
      end

      context 'with no project' do
        include_context 'with a project associated user'
        include_context 'with valid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { project.id + 1}

        it 'returns a 404 response' do
          subject
          expect(request.path).to eq api_v1_project_path(project.id + 1)
          expect(response).to have_http_status :not_found
        end
      end
    end
  end

  describe 'PUT /api/v1/projects/:id' do
    include_context 'with committer schema check'
    include_context 'with a project associated user'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a project' do
        include_examples 'committer schema check'

        let(:id) { project.id }
        let(:params) { { name: "Project", description: "This is Project", is_archived: true } }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_project_path(project)
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { project.id }
        let(:params) { { name: "Project", description: "This is Project" } }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_project_path(project)
          expect(response).to have_http_status :unauthorized
        end
      end

      context 'with no project' do
        include_context 'with a project associated user'
        include_context 'with valid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { project.id + 1}

        it 'returns a 404 response' do
          subject
          expect(request.path).to eq api_v1_project_path(project.id + 1)
          expect(response).to have_http_status :not_found
        end
      end
    end
  end

  describe 'DELETE /api/v1/projects/:id' do
    include_context 'with committer schema check'
    include_context 'with a project associated user'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a project' do
        include_examples 'committer schema check'

        let(:id) { project.id }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_project_path(project)
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { project.id }
        let(:params) { { name: "Project", description: "This is Project" } }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_project_path(project)
          expect(response).to have_http_status :unauthorized
        end
      end

      context 'with no project' do
        include_context 'with a project associated user'
        include_context 'with valid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { project.id + 1}

        it 'returns a 404 response' do
          subject
          expect(request.path).to eq api_v1_project_path(project.id + 1)
          expect(response).to have_http_status :not_found
        end
      end
    end
  end
end
