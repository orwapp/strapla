module LoginHelper

  def sign_in(user)
    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "supersecret"
    click_button "Sign in"
    page.should have_content('Signed in successfully.')
  end

end
