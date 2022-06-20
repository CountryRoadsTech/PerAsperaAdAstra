# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'simulations/index', type: :view do
  before do
    @simulations = assign(:simulations, [create(:simulation), create(:simulation)])
  end

  it 'renders a list of simulations' do
    render
    expect(rendered).to include(@simulations.first.name)
    expect(rendered).to include(@simulations.second.name)
    expect(rendered).to include(@simulations.first.description.to_s)
    expect(rendered).to include(@simulations.second.description.to_s)
  end
end
