# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'simulations/edit', type: :view do
  before do
    @simulation = assign(:simulation, create(:simulation))
  end

  it 'renders the edit simulation form' do
    render

    assert_select 'form[action=?][method=?]', simulation_path(@simulation), 'post' do
      assert_select 'textarea[name=?]', 'simulation[name]'

      assert_select 'input[name=?]', 'simulation[description]'

      assert_select 'textarea[name=?]', 'simulation[solver_method]'
    end
  end
end
