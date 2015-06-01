require 'spec_helper'

describe 'Song' do

  it "Has a title" do
    song = Song.new(title: "Aluko River")
    expect(song.title).to eq "Aluko River"
  end





end
