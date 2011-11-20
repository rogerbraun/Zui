describe User do

  it "should give a new translation comment for a fragment when none is there" do
    project = Factory(:owned_project)
    user = project.user
    fragment = project.fragments.build
    fragment.save.should be_true
    
    comment = user.translation_comment(fragment)
    comment.should_not be_nil
  end

  it "should give the old translation comment if there already was one" do
    project = Factory(:owned_project)
    user = project.user
    fragment = project.fragments.build
    fragment.save.should be_true
    
    new_comment = user.translation_comment(fragment)
    new_comment.should_not be_nil
    new_comment.save.should be_true
    
    old_comment = user.translation_comment(fragment)
    new_comment.should == old_comment

  end

end
