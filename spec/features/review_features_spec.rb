require"rails_helper"

feature "Reviews" do

  before do
		sign_up_and_sign_in
	end

  scenario "Leave a review" do
    visit_my_restaurant
    click_link "Review"
    fill_in "comments", with: "Pretty average place. Needs improvement"
    fill_in "rating", with: "2"
    click_button "Review"
    expect(page).to have_content "Pretty average place. Needs improvement"
  end

end
