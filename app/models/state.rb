class State < ActiveRecord::Base
  def self.default
    find_by(default: true)
  end

  def make_default!
    # Prevent race condition using database-level locks.
    State.transaction do
      others = State.where.not(id: id).lock(true).first
      current = State.where(id: id).lock(true).first
      others.update_all(default: false) unless others.nil?
      current.update!(default: true)
    end
  end

  def to_s
    name
  end
end
