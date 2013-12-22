require 'spec_helper'

describe "Static pages" do

  #页面测试用例
  describe "Home page" do
    it "should have the content 'Sample App'" do
      #访问某个一页面
      visit '/static_pages/home'
      #页面中是否包含什么内容
      page.should have_content('Sample App')
    end

    it "should have the title 'Home'" do
      #访问某个一页面
      visit '/static_pages/home'
      #页面中某一个元素是否包含什么内容
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Home")
    end

  end

  #另外一个页面的测试用例
  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end


    it "should have the title 'Help'" do
      #访问某个一页面
      visit '/static_pages/help'
      #页面中某一个元素是否包含什么内容
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Help")
    end
  end

  #另一个测试用例
  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it "should have the title 'About'" do
      #访问某个一页面
      visit '/static_pages/about'
      #页面中某一个元素是否包含什么内容
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | About")
    end
  end



end
