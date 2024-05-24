# frozen_string_literal: true

class Episodes::SectionComponent < BaseComponent
  attr_reader :title, :episodes, :options

  def initialize(title:, episodes:, **options)
    @title = title
    @episodes = episodes
    @options = options
  end

  def call
    tag.div(class: "relative mx-auto divide-y-2 divide-red-400 pb-8") do
      heading + episode_collection
    end
  end

  private

  def heading = render Episodes::SectionTitleComponent.new(title).wrapped_with(:div)

  def episode_collection
    tag.div(class: "mt-6 pt-10 grid gap-16 lg:grid-cols-3 lg:gap-x-5 lg:gap-y-12") do
      render Episodes::ItemComponent.with_collection(episodes)
    end
  end
end
