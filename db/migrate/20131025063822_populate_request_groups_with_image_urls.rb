class PopulateRequestGroupsWithImageUrls < ActiveRecord::Migration
  def up
    RequestGroup.where(title: 'Ruby').first.update_attribute(:image_url, 'language_and_frameworks/ruby.png')
    RequestGroup.where(title: 'Desktop application - Windows').first.update_attribute(:image_url, 'language_and_frameworks/windows.png')
    RequestGroup.where(title: 'Desktop application - Mac').first.update_attribute(:image_url, 'language_and_frameworks/mac.png')
    RequestGroup.where(title: 'Android app').first.update_attribute(:image_url, 'language_and_frameworks/android.png')
    RequestGroup.where(title: 'iOS app').first.update_attribute(:image_url, 'language_and_frameworks/ios.png')
    RequestGroup.where(title: 'Integration').first.update_attribute(:image_url, 'language_and_frameworks/integration.png')
    RequestGroup.where(title: 'Linux / UNIX scripting').first.update_attribute(:image_url, 'language_and_frameworks/unixscripting.png')
    RequestGroup.where(title: 'Web application').first.update_attribute(:image_url, 'language_and_frameworks/webapps.png')
  end
end
