class State < ActiveRecord::Base
  def self.default
    find_by(default: true)
  end

  def make_default!
    # Prevent race condition using database-level locks.
    State.transaction do
      State.where.not(id: id).lock(true).update_all(default: false)
      State.where(id: id).lock(true).first.update!(default: true)
    end
  end

  def to_s
    name
  end
end
