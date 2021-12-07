json.extract! invite, :id, :coach_id, :improvement_plan_id, :created_at,
              :updated_at
json.url invite_url(invite, format: :json)
