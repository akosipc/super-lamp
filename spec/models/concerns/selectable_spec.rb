require "rails_helper"

RSpec.describe Selectable do
  let!(:data) do
    [ double("Dummy", name: "Dota 2", id: 1),
      double("Dummy", name: "CS:GO", id: 2) ]
  end
  let!(:dummy)  { class_double("Dumdum", all: data ) }

  before do
    dummy.send :extend, Selectable::ClassMethods
  end

  describe ".as_select_collection" do
    it "returns an array of objects based on the collection given" do
      expect(dummy.as_select_collection).to include ["CS:GO", 2]
      expect(dummy.as_select_collection).to include ["Dota 2", 1]
    end
  end

  describe ".as_select_name_only" do
    it "returns an array of objects based on the collection given" do
      expect(dummy.as_select_name_only).to include ["CS:GO"]
      expect(dummy.as_select_name_only).to include ["Dota 2"]
    end
  end

  describe ".object_title" do
    it "calls the object title" do
      expect(dummy).to receive(:object_title).twice
      dummy.as_select_name_only
    end
  end

end
