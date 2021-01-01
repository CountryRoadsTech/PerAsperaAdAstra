require 'rails_helper'

RSpec.describe "satellites/show", type: :view do
  before(:each) do
    @satellite = assign(:satellite, Satellite.create!(
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
