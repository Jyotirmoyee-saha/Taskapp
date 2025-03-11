json.extract! task, :id, :tname, :tno, :project_id, :created_at, :updated_at
json.url task_url(task, format: :json)
