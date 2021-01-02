require 'rails_helper'

RSpec.describe "orbits/show", type: :view do
  before(:each) do
    @orbit = assign(:orbit, Orbit.create!(
      satellites: nil,
      name: "MyText",
      comment: "MyText",
      user: nil,
      epoch_microseconds: "9.99",
      mean_motion: "9.99",
      eccentricity: "9.99",
      inclination: "9.99",
      right_ascension_of_ascending_node: "9.99",
      argument_of_pericenter: "9.99",
      mean_anomaly: "9.99",
      revolution_at_epoch: 2,
      b_star: "9.99",
      mean_motion_dot: "9.99",
      mean_motino_ddot: "9.99",
      semimajor_axis: "9.99",
      period: "9.99",
      apogee: "9.99",
      perigee: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
