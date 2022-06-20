# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'simulations/new', type: :view do
  before do
    assign(:simulation, build(:simulation))
  end

  it 'renders new simulation form' do
    render

    assert_select 'form[action=?][method=?]', simulations_path, 'post' do
      assert_select 'textarea[name=?]', 'simulation[name]'

      assert_select 'input[name=?]', 'simulation[description]'
    end
  end
end
