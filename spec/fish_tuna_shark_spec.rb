require 'pry'
require_relative '../fish_tuna_shark_q13.rb'
require 'spec_helper'

RSpec.describe Tuna, type: :model do
  context "When create Tuna instance" do
    before(:all) do
      @tuna = Tuna.new(name: 'yellow fin', origin: 'SouthPacific')
    end

    it "should have an id eq 0" do
      expect(@tuna.id).to eq(0)
    end

    it "should respond to origin" do
      expect(@tuna).to respond_to(:origin)
    end

    it "should not respond to find_by_color" do
      expect(@shark).not_to respond_to(:find_by_color)
    end

    it "Tuna.find_by_origin should return an array" do
      expect(Tuna.find_by_origin('SouthPacific')).to be_kind_of(Array)
    end

    it "Tuna.find_by_origin should return an array of tuna instances" do
      expect(Tuna.find_by_origin('SouthPacific').first).to be_kind_of(Tuna)
    end
  end
end

RSpec.describe Shark, type: :model do
  context "When create Shark instance" do
    before(:all) do
      @shark = Shark.new(name: 'white shark', color: 'blue')
    end

    it "should have an id eq 1" do
      expect(@shark.id).to eq(1)
    end

    it "should respond to color" do
      expect(@shark).to respond_to(:color)
    end

    it "should not respond to find_by_origin" do
      expect(@shark).not_to respond_to(:find_by_origin)
    end

    it "Shark.find_by_color should return an array" do
      expect(Shark.find_by_color('blue')).to be_kind_of(Array)
    end

    it "Shark.find_by_color should return an array of shark instances" do
      expect(Shark.find_by_color('blue').first).to be_kind_of(Shark)
    end
  end
end
