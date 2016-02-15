require 'rails_helper'

feature 'Editing posts' do  
  background do
    job = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    fill_in 'Article', with: "Oh god, you weren't meant to see this article!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
    expect(page).to have_content("Oh god, you weren't meant to see this article!")
  end

  it 'wont update a post without an image' do
    attach_file('Image', 'spec/files/images/coffee.zip')
    click_button 'Update Post'
    expect(page).to have_content("Add more information!")
  end
end 
