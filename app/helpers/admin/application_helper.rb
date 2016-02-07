module Admin::ApplicationHelper
  def roles
    hash = Hash.new
    Role.available_roles.each {|role| hash[role.titleize] = role}
    hash
  end
end
