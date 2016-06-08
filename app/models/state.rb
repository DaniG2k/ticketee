class State < ActiveRecord::Base
  def self.default
    find_by(default: true)
  end

  def make_default!
    # Prevent race condition using database-level locks.
    State.transaction do
      State.update_all(default: false)
      update!(default: true)
    end
  end

  def to_s
    name
  end
end
