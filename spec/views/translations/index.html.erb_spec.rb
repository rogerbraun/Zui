require 'spec_helper'

describe "translations/index.html.erb" do
  before(:each) do
    assign(:translations, [
      stub_model(Translation,
        :source_lang => "Source Lang",
        :target_lang => "Target Lang"
      ),
      stub_model(Translation,
        :source_lang => "Source Lang",
        :target_lang => "Target Lang"
      )
    ])
  end

  it "renders a list of translations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Source Lang".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Target Lang".to_s, :count => 2
  end
end
