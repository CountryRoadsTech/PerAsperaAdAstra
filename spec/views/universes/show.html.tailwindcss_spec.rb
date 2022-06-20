# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'universes/show', type: :view do
  before do
    @universe = assign(:universe, create(:universe))
  end

  it 'renders attributes' do
    render
    expect(rendered).to include(@universe.start_time.to_s)
    expect(rendered).to include(@universe.end_time.to_s)
    expect(rendered).to include(@universe.timestep.to_s)
    expect(rendered).to include(@universe.number_of_timesteps.to_s)
    expect(rendered).to include(@universe.timesteps.to_s)
  end
end
