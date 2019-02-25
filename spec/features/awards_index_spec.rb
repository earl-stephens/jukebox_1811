# As an admin user,
#   When I visit the awards index page,
#     I can see a form to create a new award name on that same page,
#     (Not a link to a page with a form)
#   When I fill out the form with the award's title,
#     And click submit,
#     The form data is submitted to an admin-only route,
#       and handled by an admin-only controller;
#       no other users can access this portion of code.
#     I return to the main awards index page
#     And I see a list of all awards including the one I have just created.

RSpec.describe "awards index page", type: :feature do
  describe "as an admin" do
    it "shows a form to create a new award" do
      admin = User.create!(username: 'papa smurf', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      award_name = "top singer"

      visit awards_path
      save_and_open_page

      fill_in :name, with: award_name

      click_on "Create Award"

      expect(current_path).to eq(admin_awards_path)

      visit awards_path

      expect(page).to have_content(award_name)
    end
  end
end
