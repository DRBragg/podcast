class BaseComponent < ViewComponent::Base
  Bridgetown::ViewComponentHelpers.allow_rails_helpers :tag
  include Bridgetown::ViewComponentHelpers

  private

  def join_classes(*classes)
    classes.flatten.compact.join(" ")
  end
end
