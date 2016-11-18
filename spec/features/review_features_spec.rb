require"rails_helper"

feature "Reviews" do

  def leave_review(comments, rating)
    click_link "Testie Bestie"
    click_link 'Review'
    fill_in 'review_comments', with: comments
    select rating, from: 'rating'
    click_button 'Review'
  end

  scenario 'displays an average rating for all reviews' do
    sign_up_and_sign_in('test@example.com', 'testtest')
    add_restaurant_and_return("Testie Bestie", "A great place to eat")
    leave_review('So so', '3')
    click_link 'Sign out'
    sign_up_and_sign_in('test2@example.com', 'testtest')
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: ★★★★☆')
  end
end
