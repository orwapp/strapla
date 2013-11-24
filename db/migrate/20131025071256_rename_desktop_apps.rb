class RenameDesktopApps < ActiveRecord::Migration
  def change
    RequestGroup.where(title: 'Desktop application - Windows').first.update_attribute(:title, 'Windows app') rescue nil
    RequestGroup.where(title: 'Desktop application - Mac').first.update_attribute(:title,     'OSX app') rescue nil
  end
end
