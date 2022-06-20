# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'simulations/show', type: :view do
  before do
    @simulation = assign(:simulation, create(:simulation))
  end

  it 'renders attributes' do
    render
    expect(rendered).to include(@simulation.name)
    expect(rendered).to include(@simulation.description.to_s)
  end
end
