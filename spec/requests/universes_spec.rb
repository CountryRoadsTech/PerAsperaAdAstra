# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/universes', type: :request do
  let(:invalid_attributes) do
    { title: 'Test', foo: 'bar' }
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      universe = create(:universe)
      get universe_url(universe)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      universe = create(:universe)
      get edit_universe_url(universe)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        attributes_for(:universe)
      end

      it 'updates the requested universe' do
        universe = create(:universe)
        patch universe_url(universe), params: { universe: new_attributes }
        universe.reload
        skip('Add assertions for updated state')
      end

      # it 'redirects to the universe' do
      #   universe = create(:universe)
      #   patch universe_url(universe), params: { universe: new_attributes }
      #   universe.reload
      #   expect(response).to redirect_to(universe_url(universe))
      # end
    end

    context 'with invalid parameters' do
      it 'renders a found status' do
        universe = create(:universe)
        patch universe_url(universe), params: { universe: invalid_attributes }
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested universe' do
      universe = create(:universe)
      expect do
        delete universe_url(universe)
      end.to change(Universe, :count).by(-1)
    end

    it 'redirects to the universes list' do
      universe = create(:universe)
      delete universe_url(universe)
      expect(response).to redirect_to(universes_url)
    end
  end
end
