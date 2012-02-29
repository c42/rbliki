require 'spec_helper'

describe "Blogs" do
  before do 
    @blog = Blog.create title: "booga", description: "boo"
  end

  describe "GET /blogs" do
    it "visits the blogs page" do
      visit blogs_path
      page.should have_content 'booga'
    end
  end
  
  describe "POST /blog" do
  	it "creates a new blog" do
  		visit blogs_path
  		click_link 'Create Blog'

  		current_path.should == new_blog_path

  		fill_in 'Title', with: "Great"
  		fill_in 'Description', with: "Amazing"

  		click_button 'Create Blog'

  		current_path.should == blogs_path

  		page.should have_content 'Great'
  	end
  end

  describe 'PUT /blog' do
    it "edits a blog" do
      
      visit blogs_path
      click_link 'Edit'

      current_path.should == edit_blog_path(@blog)

      find_field('Title').value.should == "booga"

      fill_in 'Title', with: 'great'

      click_button 'Update Blog'

      current_path.should == blogs_path

      page.should have_content 'great'
    end
  end

  describe 'DELETE /blog' do
    it "delets the blog" do
      visit blogs_path
      find('td',text: "#{@blog.title}").click_link 'Delete'

      current_path.should == blogs_path

      page.should have_content "Blog has been deleted"
      page.should have_no_content "booga"
    end
  end
end
