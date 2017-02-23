require_relative "tennis_scorer"
require "test/unit"

describe "TennisScorer", "basic scoring" do
  let(:ts) { TennisScorer.new }

  it "should start with a score of 0-0" do
    expect(ts.score).to eq("0-0")
  end

  it "should be 15-0 if the server wins a point" do
    ts.give_point_to(:server)
    expect(ts.score).to eq("15-0")
  end

  it "should be 0-15 if the receiver wins a point" do
    ts.give_point_to(:receiver)
    expect(ts.score).to eq("0-15")
  end

  it "should be 15-15 after they both win a point" do
    ts.give_point_to(:receiver)
    ts.give_point_to(:server)
    expect(ts.score).to eq("15-15")
  end
  
  it "should be 30-0 if the server wins two points" do
    2.times do ts.give_point_to(:server) end
    expect(ts.score).to eq("30-0")
  end
  
  it "should be 40-0 after the server wins three points" do
    3.times do ts.give_point_to(:server) end
    expect(ts.score).to eq("40-0")
  end
  
  it "should be Deuce after each wins three points" do
    3.times do ts.give_point_to(:server) end
    3.times do ts.give_point_to(:receiver) end
    expect(ts.score).to eq("Deuce")
  end
  
  it "should be A-server after each wins three points and the server gets one more" do
    3.times do ts.give_point_to(:receiver) end
    4.times do ts.give_point_to(:server) end
    expect(ts.score).to eq("A-server")
  end
  
  it "should be A-receiver after each wins three points and the receiver gets one more" do
    3.times do ts.give_point_to(:server) end
    4.times do ts.give_point_to(:receiver) end
    expect(ts.score).to eq("A-receiver")
  end
  
  it "should be W-L after the server wins four points" do
    4.times do ts.give_point_to(:server) end
    expect(ts.score).to eq("W-L")
  end
  
  it "should be L-W after the receiver wins four points" do
    4.times do ts.give_point_to(:receiver) end
    expect(ts.score).to eq("L-W")
  end
  
  it "should be W-L after deuce and the server wins by two clear points" do
    3.times do ts.give_point_to(:server) end
    3.times do ts.give_point_to(:receiver) end
    ts.give_point_to(:receiver)
    3.times do ts.give_point_to(:server) end
    expect(ts.score).to eq("W-L")
  end
  
  it "should be L-W after deuce and the receiver wins by two clear points" do
    3.times do ts.give_point_to(:server) end
    3.times do ts.give_point_to(:receiver) end
    ts.give_point_to(:receiver)
    2.times do ts.give_point_to(:server) end
    3.times do ts.give_point_to(:receiver) end
    expect(ts.score).to eq("L-W")
  end
  
  it "should raise an exception if award point to the umpire" do
    expect{ ts.give_point_to(:umpire) }.to raise_error(RuntimeError, /Unknown player umpire/)
  end

  it "should raise an exception if award point when the game is complete" do
    expect{ 5.times do ts.give_point_to(:server) end }.to raise_error(RuntimeError, /Game over, result: W-L/)
  end
end
