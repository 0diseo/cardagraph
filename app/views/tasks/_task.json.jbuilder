json.extract! task, :id, :organization_id, :name, :url, :id_task, :created, :status, :priority, :created_by, :resolution, :created_at, :updated_at
json.url task_url(task, format: :json)
