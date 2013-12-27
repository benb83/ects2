json.array!(@course_masters) do |course_master|
  json.extract! course_master, :id, :code, :title, :duration, :min_candidate, :max_candidate, :instructor_id
  json.url course_master_url(course_master, format: :json)
end
