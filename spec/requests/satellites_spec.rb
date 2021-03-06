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

RSpec.describe "/satellites", type: :request do
  # Satellite. As you add validations to Satellite, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Satellite.create! valid_attributes
      get satellites_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      satellite = Satellite.create! valid_attributes
      get satellite_url(satellite)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_satellite_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      satellite = Satellite.create! valid_attributes
      get edit_satellite_url(satellite)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Satellite" do
        expect {
          post satellites_url, params: { satellite: valid_attributes }
        }.to change(Satellite, :count).by(1)
      end

      it "redirects to the created satellite" do
        post satellites_url, params: { satellite: valid_attributes }
        expect(response).to redirect_to(satellite_url(Satellite.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Satellite" do
        expect {
          post satellites_url, params: { satellite: invalid_attributes }
        }.to change(Satellite, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post satellites_url, params: { satellite: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested satellite" do
        satellite = Satellite.create! valid_attributes
        patch satellite_url(satellite), params: { satellite: new_attributes }
        satellite.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the satellite" do
        satellite = Satellite.create! valid_attributes
        patch satellite_url(satellite), params: { satellite: new_attributes }
        satellite.reload
        expect(response).to redirect_to(satellite_url(satellite))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        satellite = Satellite.create! valid_attributes
        patch satellite_url(satellite), params: { satellite: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested satellite" do
      satellite = Satellite.create! valid_attributes
      expect {
        delete satellite_url(satellite)
      }.to change(Satellite, :count).by(-1)
    end

    it "redirects to the satellites list" do
      satellite = Satellite.create! valid_attributes
      delete satellite_url(satellite)
      expect(response).to redirect_to(satellites_url)
    end
  end
end
