# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'physics_bodies/show', type: :view do
  before do
    @physics_body = assign(:physics_body, create(:physics_body))
  end

  it 'renders attributes' do
    render
    expect(rendered).to include(@physics_body.name)
    expect(rendered).to include(@physics_body.description.to_s)
    expect(rendered).to include(@physics_body.initial_position_x.to_s)
    expect(rendered).to include(@physics_body.initial_position_y.to_s)
    expect(rendered).to include(@physics_body.initial_position_z.to_s)
    expect(rendered).to include(@physics_body.initial_velocity_x.to_s)
    expect(rendered).to include(@physics_body.initial_velocity_y.to_s)
    expect(rendered).to include(@physics_body.initial_velocity_z.to_s)
  end
end
