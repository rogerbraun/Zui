describe "Translation Mode" do
  before do
    @project = Factory(:owned_project)
    @user = @project.user
    @fragment = @project.fragments.build
    @fragment.title = "Test"
    @fragment.content = "Some content"
    @fragment.save

    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_on "Sign in"
    page.should have_content("Abmelden")
  end

  it "should show translation mode for a fragment" do
    visit project_fragment_translation_mode_path(@project, @fragment)
    page.should have_css(".translatable")
    page.should have_css(".comment_form")
    page.should have_content(@fragment.content)
  end
end
