# frozen_string_literal: true

class Episodes::ItemComponent < BaseComponent
  with_collection_parameter :episode

  attr_reader :episode

  def initialize(episode)
    @episode = episode[:episode] || episode
  end

  def call
    tag.div do
      tag.p(timestamp, class: "text-sm text-blue-400") +
        episode_title +
        episode_summary +
        tag.div(link_to_episode, class: "mt-3")
    end
  end

  private

  def timestamp = tag.time published_at, datetime: published_at(as: :param)

  def published_at(as: :display)
    format = as == :param ? "%F" : "%B %d, %Y"
    Date.parse(episode[:published_at]).strftime(format)
  end

  def episode_url = "/episodes/#{Bridgetown::Utils.slugify(episode[:title])}"

  def link_to_episode = tag.a "Listen", href: episode_url, class: "text-base font-semibold text-indigo-400 hover:text-indigo-500"

  def episode_title = tag.p episode[:title], class: "text-xl font-semibold text-gray-50"

  def episode_summary = tag.p summary.html_safe, class: "mt-3 text-base text-gray-100"

  def summary = episode[:summary].presence || episode[:description].truncate(400)
end
