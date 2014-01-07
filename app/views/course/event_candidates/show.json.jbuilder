json.extract! @course_event_candidate, :id, :candidate_id
json.extract! @course_event_candidate.candidate.master, :family_name, :given_name, :other_names
