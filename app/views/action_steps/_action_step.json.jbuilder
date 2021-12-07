json.extract! action_step, :id, :goal_id, :description, :target_date,
              :lead_person, :resources_needed, :implementation_specifics, :measures_of_success, :created_at, :updated_at
json.url action_step_url(action_step, format: :json)
