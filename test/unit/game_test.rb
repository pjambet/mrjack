require 'test_helper'

class GameTest < ActiveSupport::TestCase
  context "Initialition of the game" do
    setup { @game = Game.create! }

    should "be initialized with one player as Jack" do
      @game.jack.should_be_kind_of Jack
    end

    should "be initialized with one player as the Detective" do
      @game.jack.should_be_kind_of Detective
    end

    should "have the 8 characters stading at their original position" do
      Character.characters.each do |char|
        %w(x y).each do |coord|
          @game.send(:char).send(:coord).should_equals @game.send(:char).class.send(:"initial_#{coord}")
        end
      end
    end

    should "have the board in its intial state" do
    end

    should "be at turn 0" do
    end
  end
end
