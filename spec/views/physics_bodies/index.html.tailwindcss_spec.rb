# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'physics_bodies/index', type: :view do
  before do
    @physics_bodies = assign(:physics_bodies, [create(:physics_body), create(:physics_body)])
  end

  it 'renders a list of physics_bodies' do
    render
    expect(rendered).to include(@physics_bodies.first.name)
    expect(rendered).to include(@physics_bodies.second.name)
    expect(rendered).to include(@physics_bodies.first.description.to_s)
    expect(rendered).to include(@physics_bodies.second.description.to_s)
  end
end
