module CalculateDatetimeOverlap
  class Interval
    attr_accessor :first_datetime_starts_at
    attr_accessor :first_datetime_ends_at
    attr_accessor :second_datetime_starts_at
    attr_accessor :second_datetime_ends_at

    def initialize(interval_builder)
      @first_datetime_starts_at = interval_builder.first_datetime_starts_at
      @first_datetime_ends_at = interval_builder.first_datetime_ends_at
      @second_datetime_starts_at = interval_builder.second_datetime_starts_at
      @second_datetime_ends_at = interval_builder.second_datetime_ends_at
    end
  end

  class IntervalBuilder
    attr_accessor :first_datetime_starts_at
    attr_accessor :first_datetime_ends_at
    attr_accessor :second_datetime_starts_at
    attr_accessor :second_datetime_ends_at

    private :first_datetime_starts_at=
    private :first_datetime_ends_at=
    private :second_datetime_starts_at=
    private :second_datetime_ends_at=

    def add_first_datetime_starts_at(datetime)
      @first_datetime_starts_at = datetime
      self
    end

    def add_first_datetime_ends_at(datetime)
      @first_datetime_ends_at = datetime
      self
    end

    def add_second_datetime_starts_at(datetime)
      @second_datetime_starts_at = datetime
      self
    end

    def add_second_datetime_ends_at(datetime)
      @second_datetime_ends_at = datetime
      self
    end

    def build
      Interval.new(self)
    end
  end

  class Overlap
    def initialize(parameters)
      @interval = (IntervalBuilder.new)
                   .add_first_datetime_starts_at(parameters[:first_datetime_starts_at])
                   .add_first_datetime_ends_at(parameters[:first_datetime_ends_at])
                   .add_second_datetime_starts_at(parameters[:second_datetime_starts_at])
                   .add_second_datetime_ends_at(parameters[:second_datetime_ends_at])
                   .build
    end

    def is_overlap?
      @interval.first_datetime_starts_at <= @interval.second_datetime_ends_at && @interval.second_datetime_starts_at <= @interval.second_datetime_ends_at
    end
  end
end
