json.extract! teacher, :id, :first_name, :last_name, :school, :created_at,
              :updated_at
json.url teacher_url(teacher, format: :json)
json.token user.generate_jwt
