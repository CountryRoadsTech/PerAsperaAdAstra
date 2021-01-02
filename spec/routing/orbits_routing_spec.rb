require "rails_helper"

RSpec.describe OrbitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/orbits").to route_to("orbits#index")
    end

    it "routes to #new" do
      expect(get: "/orbits/new").to route_to("orbits#new")
    end

    it "routes to #show" do
      expect(get: "/orbits/1").to route_to("orbits#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/orbits/1/edit").to route_to("orbits#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/orbits").to route_to("orbits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/orbits/1").to route_to("orbits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/orbits/1").to route_to("orbits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/orbits/1").to route_to("orbits#destroy", id: "1")
    end
  end
end
