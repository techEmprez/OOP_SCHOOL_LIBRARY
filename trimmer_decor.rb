require_relative 'base_decor'
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.strip[0...10]
  end
end
