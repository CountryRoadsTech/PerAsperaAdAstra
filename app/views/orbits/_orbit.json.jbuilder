json.extract! orbit, :id, :satellites_id, :name, :comment, :user_id, :epoch, :epoch_microseconds, :mean_motion, :eccentricity, :inclination, :right_ascension_of_ascending_node, :argument_of_pericenter, :mean_anomaly, :revolution_at_epoch, :b_star, :mean_motion_dot, :mean_motino_ddot, :semimajor_axis, :period, :apogee, :perigee, :created_at, :updated_at
json.url orbit_url(orbit, format: :json)
