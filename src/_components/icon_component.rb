# frozen_string_literal: true

class IconComponent < BaseComponent
  attr_reader :icon_name, :color, :classes

  def initialize(icon_name, color: "currentColor", classes: "")
    @icon_name = icon_name
    @color = color
    @classes = classes
  end

  def call
    partial("icons/#{icon_name}", color:, classes:)
  end
end
