class RemoveRubyFromTheRequestGroups < ActiveRecord::Migration
  def change
    ruby_group = RequestGroup.where(title: 'Ruby').first
    web_group  = RequestGroup.where(title: 'Web application').first
    return unless ruby_group

    Request.where(request_group_id: ruby_group.id).all do |request|
      request.update_attribute(request_group_id: web_group.id)
    end

    RequestGroup.where(title: 'Ruby').first.destroy
  end
end
