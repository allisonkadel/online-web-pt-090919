module SequencesHelper
    # given a duration, this method should convert it from seconds to minutes and seconds
    def format_duration_to_minutes(duration)
        "#{duration / 60} minutes and #{duration % 60} seconds"
    end
end