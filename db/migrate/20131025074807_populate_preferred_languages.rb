class PopulatePreferredLanguages < ActiveRecord::Migration
  def up
    PreferredLanguage.create(title: 'Ruby', image_url: 'language_and_frameworks/ruby.png')
    PreferredLanguage.create(title: 'Perl', image_url: 'language_and_frameworks/perl.png')
    PreferredLanguage.create(title: 'Java', image_url: 'language_and_frameworks/java.png')
    PreferredLanguage.create(title: '.Net', image_url: 'language_and_frameworks/dot_net.png')
  end
end
