#require 'spec_helper'
#require 'acceptance/acceptance_helper'
#
#feature 'Comments', %q{
#  Both requests and features can have comments.
#} do
#
#  background do
#    @user = Fabricate :user
#    RequestGroup.create(title: 'Linux / UNIX scripting')
#    RequestGroup.create(title: 'Web application')
#  end
#
#  scenario 'Log in and start a new project' do
#    visit '/'
