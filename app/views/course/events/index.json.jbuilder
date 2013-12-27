json.array!(@course_events) do |course_event|
  json.extract! course_event, :id, :course_master_id, :start_date, :end_date
  json.url course_event_url(course_event, format: :json)
end
