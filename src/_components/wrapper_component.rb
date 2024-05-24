# frozen_string_literal: true

# Don't inherit from BaseComponent because we don't need the extras.
class WrapperComponent < ViewComponent::Base
  attr_reader :component_instance, :as, :options

  # So we only render the wrapper if the component is rendered.
  delegate :render?, to: :component_instance

  def initialize(component_instance, as:, **options)
    @component_instance = component_instance
    @as = as
    @options = options
  end

  def call
    tag.send(as, rendered_component, **options)
  end

  private

  def rendered_component
    # If a block is passed we need to forward it to the component instance and not try to render it in the wrapper context.
    # I know this is a bit hacky but it's the best to make it work.
    # Might try to upsteam to ViewComponent if it works well for us.
    passed_block, @__vc_render_in_block = @__vc_render_in_block, nil
    component_instance.render_in(view_context, &passed_block).html_safe
  end
end
