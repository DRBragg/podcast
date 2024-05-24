# frozen_string_literal: true

class Episodes::SectionTitleComponent < BaseComponent
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def call
    tag.h2 title, class: "text-3xl tracking-tight font-extrabold text-blue-400 sm:text-4xl"
  end
end
