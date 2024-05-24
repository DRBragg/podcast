class BaseComponent < ViewComponent::Base
  Bridgetown::ViewComponentHelpers.allow_rails_helpers :tag
  include Bridgetown::ViewComponentHelpers

  # "Wraps" the component in an element.
  # Useful for conditional, one off wrappers.
  # Will only render if the component being wrapped is rendered.
  def wrapped_with(tag, **options)
    WrapperComponent.new(self, as: tag, **options)
  end

  private

  def join_classes(*classes)
    classes.flatten.compact.join(" ")
  end
end
