require 'rails_helper'

feature 'Index displays a list of posts' do  
  scenario 'the index displays correct created job information' do
    job_one = create(:post, caption: "This is post one", article: "This is article one")
    job_two = create(:post, caption: "This is the second post", article: "This is article two")

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is article one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_content("This is article two")
    expect(page).to have_css("img[src*='coffee']")
  end
end