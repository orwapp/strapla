module IntegrationHelpers

  def fill_in_request_form(subject: 'subject', goal: 'goal', description: 'Should be easy for an expert to do', group: nil)
    fill_in :request_subject, with: 'Need help with getting the Facebook API working'
    fill_in :request_goal,    with: 'Should post msg to facebook'
    fill_in :request_description,    with: 'Oklkj'
    page.select(group, :from => 'request_request_group_id')
    click_button 'Next'
    current_path.should eq select_recipient_path(Request.last)
  end

end
