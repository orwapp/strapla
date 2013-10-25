class PopulateRequestGroupsWithImageUrls < ActiveRecord::Migration
  def up
    RequestGroup.where(title: 'Desktop application - Windows').first_or_create.update_attribute(:image_url, 'language_and_frameworks/windows.png')
    RequestGroup.where(title: 'Desktop application - Mac').first_or_create.update_attribute(:image_url, 'language_and_frameworks/mac.png')
    RequestGroup.where(title: 'Android app').first_or_create.update_attribute(:image_url, 'language_and_frameworks/android.png')
    RequestGroup.where(title: 'iOS app').first_or_create.update_attribute(:image_url, 'language_and_frameworks/ios.png')
    RequestGroup.where(title: 'Integration').first_or_create.update_attribute(:image_url, 'language_and_frameworks/integration.png')
    RequestGroup.where(title: 'Linux / UNIX scripting').first_or_create.update_attribute(:image_url, 'language_and_frameworks/unixscripting.png')
    RequestGroup.where(title: 'Web application').first_or_create.update_attribute(:image_url, 'language_and_frameworks/webapps.png')
  end
end
