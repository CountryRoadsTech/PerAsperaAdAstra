require 'rails_helper'

RSpec.describe "satellites/index", type: :view do
  before(:each) do
    assign(:satellites, [
      Satellite.create!(
        name: "MyText",
        international_designator: "MyText",
        norad_catalog_id: "",
        object_type: "MyText",
        country: "MyText",
        launch_site: "MyText",
        period: "9.99",
        inclination: "9.99",
        apogee: "9.99",
        perigee: "9.99",
        radar_cross_section_size: "MyText",
        current: "MyText"
      ),
      Satellite.create!(
        name: "MyText",
        international_designator: "MyText",
        norad_catalog_id: "",
        object_type: "MyText",
        country: "MyText",
        launch_site: "MyText",
        period: "9.99",
        inclination: "9.99",
        apogee: "9.99",
        perigee: "9.99",
        radar_cross_section_size: "MyText",
        current: "MyText"
      )
    ])
  end

  it "renders a list of satellites" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
