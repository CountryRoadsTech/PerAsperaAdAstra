require 'rails_helper'

RSpec.describe "satellites/new", type: :view do
  before(:each) do
    assign(:satellite, Satellite.new(
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
    ))
  end

  it "renders new satellite form" do
    render

    assert_select "form[action=?][method=?]", satellites_path, "post" do

      assert_select "textarea[name=?]", "satellite[name]"

      assert_select "textarea[name=?]", "satellite[international_designator]"

      assert_select "input[name=?]", "satellite[norad_catalog_id]"

      assert_select "textarea[name=?]", "satellite[object_type]"

      assert_select "textarea[name=?]", "satellite[country]"

      assert_select "textarea[name=?]", "satellite[launch_site]"

      assert_select "input[name=?]", "satellite[period]"

      assert_select "input[name=?]", "satellite[inclination]"

      assert_select "input[name=?]", "satellite[apogee]"

      assert_select "input[name=?]", "satellite[perigee]"

      assert_select "textarea[name=?]", "satellite[radar_cross_section_size]"

      assert_select "textarea[name=?]", "satellite[current]"
    end
  end
end
