class State < ActiveRecord::Base
  def self.default
    find_by(default: true)
  end

  def make_default!
    # Prevent race condition using database-level locks.
    State.transaction do
      all = State.where.not(id: id).lock(true).first
      all.update_all(default: false) unless all.nil?
      
      current = State.where(id: id).lock(true).first
      current.update!(default: true)
    end
  end

  def to_s
    name
  end
end
