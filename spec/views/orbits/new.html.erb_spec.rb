require 'rails_helper'

RSpec.describe "orbits/new", type: :view do
  before(:each) do
    assign(:orbit, Orbit.new(
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
      revolution_at_epoch: 1,
      b_star: "9.99",
      mean_motion_dot: "9.99",
      mean_motino_ddot: "9.99",
      semimajor_axis: "9.99",
      period: "9.99",
      apogee: "9.99",
      perigee: "9.99"
    ))
  end

  it "renders new orbit form" do
    render

    assert_select "form[action=?][method=?]", orbits_path, "post" do

      assert_select "input[name=?]", "orbit[satellites_id]"

      assert_select "textarea[name=?]", "orbit[name]"

      assert_select "textarea[name=?]", "orbit[comment]"

      assert_select "input[name=?]", "orbit[user_id]"

      assert_select "input[name=?]", "orbit[epoch_microseconds]"

      assert_select "input[name=?]", "orbit[mean_motion]"

      assert_select "input[name=?]", "orbit[eccentricity]"

      assert_select "input[name=?]", "orbit[inclination]"

      assert_select "input[name=?]", "orbit[right_ascension_of_ascending_node]"

      assert_select "input[name=?]", "orbit[argument_of_pericenter]"

      assert_select "input[name=?]", "orbit[mean_anomaly]"

      assert_select "input[name=?]", "orbit[revolution_at_epoch]"

      assert_select "input[name=?]", "orbit[b_star]"

      assert_select "input[name=?]", "orbit[mean_motion_dot]"

      assert_select "input[name=?]", "orbit[mean_motino_ddot]"

      assert_select "input[name=?]", "orbit[semimajor_axis]"

      assert_select "input[name=?]", "orbit[period]"

      assert_select "input[name=?]", "orbit[apogee]"

      assert_select "input[name=?]", "orbit[perigee]"
    end
  end
end
