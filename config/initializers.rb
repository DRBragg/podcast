Bridgetown.configure do |config|
  init :"bridgetown-view-component" do
    ViewComponent::Base.config.view_component_path = "src/_components"
  end
end
