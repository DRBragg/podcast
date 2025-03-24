class AppLinkComponent < BaseComponent
  attr_reader :name, :url, :icon

  CLASSES = %w[
    bg-violet-600
    border
    border-white
    font-medium
    hover:bg-violet-500
    inline-flex
    items-center
    justify-center
    md:text-lg
    mx-auto
    px-2
    py-1
    rounded-md
    shadow-sm
    sm:px-6
    sm:py-3
    sm:w-3/4
    text-base
    text-white
  ].freeze

  def initialize(app_link:)
    @name = app_link[:name]
    @url = app_link[:url]
    @icon = app_link[:icon]
  end

  def render_icon
    render IconComponent.new(icon, color: "#fff", classes: name.present? ? "h-8 w-8" : "h-8 w-30")
  end

  def render_name = tag.span(name, class: "sm:inline hidden pl-2") if name.present?

  def call
    tag.a(href: url, class: join_classes(CLASSES)) do
      render_icon + render_name
    end
  end
end
