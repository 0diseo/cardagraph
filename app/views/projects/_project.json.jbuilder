json.extract! project, :id, :organization_id, :name, :url, :created_at, :updated_at
json.url project_url(project, format: :json)
