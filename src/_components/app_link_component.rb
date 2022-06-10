class AppLinkComponent < BaseComponent
  attr_reader :name, :url, :icon

  CLASSES = %w[
    inline-flex
    items-center
    justify-center
    sm:px-6
    sm:py-3
    px-2
    py-1
    mx-auto
    border
    border-white
    shadow-sm
    md:text-xl
    text-base
    font-medium
    rounded-md
    text-white
    bg-violet-600
    hover:bg-violet-500
    sm:w-3/4
  ].freeze

  def initialize(app_link:)
    @name = app_link[:name]
    @url = app_link[:url]
    @icon = app_link[:icon]
  end

  def render_icon = render("icons/#{icon}", color: "#fff", classes: "sm:h-10 h-8 sm:w-10 w-8")

  def render_name = tag.span(name, class: "sm:inline hidden pl-3")

  def call
    tag.a(href: url, class: join_classes(CLASSES)) do
      render_icon + render_name
    end
  end
end
