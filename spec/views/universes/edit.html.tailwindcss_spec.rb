# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'universes/edit', type: :view do
  before do
    @universe = assign(:universe, create(:universe))
  end

  it 'renders the edit universe form' do
    render

    assert_select 'form[action=?][method=?]', universe_path(@universe), 'post' do
      assert_select 'input[name=?]', 'universe[start_time]'

      assert_select 'input[name=?]', 'universe[end_time]'

      assert_select 'input[name=?]', 'universe[timestep]'

      assert_select 'input[name=?]', 'universe[number_of_timesteps]'
    end
  end
end
