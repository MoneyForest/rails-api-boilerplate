require 'rails_helper'

RSpec.describe '/api/v1/tasks', type: :request do
  describe 'GET /api/v1/tasks' do
    include_context 'with committer schema check'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a task associated user' do
        include_context 'with a task associated user'
        include_examples 'committer schema check'

        it 'returns a 200 response' do
          subject
          expect(response).to have_http_status :ok
        end
      end

      context 'with no task associated user' do
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

  describe 'POST /api/v1/tasks' do
    include_context 'with committer schema check'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a task' do
        include_examples 'committer schema check'

        let(:params) { { name: "task", description: "This is task" } }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_tasks_path
          expect(response).to have_http_status :ok
          expect(Task.find(JSON.parse(response.body)['task']['id'])).to_not be_nil
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:params) { { name: "task", description: "This is task" } }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_tasks_path
          expect(response).to have_http_status :unauthorized
        end
      end
    end
  end

  describe 'GET /api/v1/tasks/:id' do
    include_context 'with committer schema check'
    include_context 'with a task associated user'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a task' do
        include_context 'with a task associated user'
        include_examples 'committer schema check'

        let(:id) { task.id }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_task_path(task)
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { task.id }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_task_path(task)
          expect(response).to have_http_status :unauthorized
        end
      end

      context 'with no task' do
        include_context 'with a task associated user'
        include_context 'with valid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { task.id + 1}

        it 'returns a 404 response' do
          subject
          expect(request.path).to eq api_v1_task_path(task.id + 1)
          expect(response).to have_http_status :not_found
        end
      end
    end
  end

  describe 'PUT /api/v1/tasks/:id' do
    include_context 'with committer schema check'
    include_context 'with a task associated user'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a task' do
        include_examples 'committer schema check'

        let(:id) { task.id }
        let(:params) { { name: "task", description: "This is task", is_archived: true } }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_task_path(task)
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { task.id }
        let(:params) { { name: "task", description: "This is task" } }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_task_path(task)
          expect(response).to have_http_status :unauthorized
        end
      end

      context 'with no task' do
        include_context 'with a task associated user'
        include_context 'with valid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { task.id + 1}

        it 'returns a 404 response' do
          subject
          expect(request.path).to eq api_v1_task_path(task.id + 1)
          expect(response).to have_http_status :not_found
        end
      end
    end
  end

  describe 'DELETE /api/v1/tasks/:id' do
    include_context 'with committer schema check'
    include_context 'with a task associated user'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a task' do
        include_examples 'committer schema check'

        let(:id) { task.id }

        it 'returns a 200 response' do
          subject
          expect(request.path).to eq api_v1_task_path(task)
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { task.id }
        let(:params) { { name: "task", description: "This is task" } }

        it 'returns a 401 response' do
          subject
          expect(request.path).to eq api_v1_task_path(task)
          expect(response).to have_http_status :unauthorized
        end
      end

      context 'with no task' do
        include_context 'with a task associated user'
        include_context 'with valid authenticated request headers'
        include_examples 'committer schema check'

        let(:id) { task.id + 1}

        it 'returns a 404 response' do
          subject
          expect(request.path).to eq api_v1_task_path(task.id + 1)
          expect(response).to have_http_status :not_found
        end
      end
    end
  end
end
