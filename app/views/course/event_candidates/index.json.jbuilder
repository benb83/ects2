json.array!(@course_event_candidates) do |course_event_candidate|
  json.extract! course_event_candidate, :id, :course_event_id, :person_candidate_id
  json.url course_event_candidate_url(course_event_candidate, format: :json)
end
