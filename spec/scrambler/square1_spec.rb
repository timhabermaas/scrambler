require "spec_helper"

describe Scrambler::Square1 do
  let(:valid_turns) { %w(L L' L2 R R' R2 U U' U2 D D' D2 B B' B2 F F' F2
                         Lw Lw' Lw2 Rw Rw' Rw2 Uw Uw' Uw2 Dw Dw' Dw2 Bw Bw' Bw2 Fw Fw' Fw2) }

  it "should contain only valid turns" do
    subject.scramble.split(" ").each do |turn|
      turn.should match(/\(-?\d,-?\d\)/)
    end
  end
end