require 'spec_helper'

describe "translations/new.html.erb" do
  before(:each) do
    assign(:translation, stub_model(Translation,
      :source_lang => "MyString",
      :target_lang => "MyString"
    ).as_new_record)
  end

  it "renders new translation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => translations_path, :method => "post" do
      assert_select "input#translation_source_lang", :name => "translation[source_lang]"
      assert_select "input#translation_target_lang", :name => "translation[target_lang]"
    end
  end
end
