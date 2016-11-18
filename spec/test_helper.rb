def sign_up_and_sign_in(email, password)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def add_restaurant_and_return(restaurant_name, description)
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'name', with: restaurant_name
  fill_in 'description', with: description
  click_button 'Add Restaurant'
end

def visit_restaurant(name)
  add_restaurant_and_return("My restaurant", "A great place to eat")
  click_link name
end
