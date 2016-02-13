require 'rails_helper.rb'
require 'spec_helper'

feature 'Creating posts' do 
    background do
    visit '/'
    click_link 'New Post'
    end
  scenario 'can create a job' do
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime' 
    fill_in 'Article', with: 'meow #aboutcat'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_content('#aboutcat')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  it 'needs an image to create a post' do

    # fill in the caption&article field (without touching the image field)
    fill_in 'Caption', with: "No picture because YOLO"
    fill_in 'Article', with: "No picture because YOLO"
    # click the 'Create Post' button
    click_button 'Create Post'
    # expect the page to say, "Halt, you fiend! You need an image to post here!"
    expect(page).to have_content("Add more information!")
  end 
end 

feature 'Can view individual posts' do  
  scenario 'Can click and view a single post' do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end 
























