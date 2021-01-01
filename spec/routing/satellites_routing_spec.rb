require "rails_helper"

RSpec.describe SatellitesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/satellites").to route_to("satellites#index")
    end

    it "routes to #new" do
      expect(get: "/satellites/new").to route_to("satellites#new")
    end

    it "routes to #show" do
      expect(get: "/satellites/1").to route_to("satellites#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/satellites/1/edit").to route_to("satellites#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/satellites").to route_to("satellites#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/satellites/1").to route_to("satellites#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/satellites/1").to route_to("satellites#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/satellites/1").to route_to("satellites#destroy", id: "1")
    end
  end
end
