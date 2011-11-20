require 'spec_helper'

describe "translations/show.html.erb" do
  before(:each) do
    @translation = assign(:translation, stub_model(Translation,
      :source_lang => "Source Lang",
      :target_lang => "Target Lang"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Source Lang/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Target Lang/)
  end
end
