class ContainerComponent < BaseComponent
  attr_reader :opts, :tag_opts

  def initialize(**opts)
    # super(**opts)
    @opts = opts
  end

  def call
    tag.send tag_name, content, class: classes, **opts.except(:type, :as, :classes, :max_w)
  end

  private

  def tag_name
    @tag_name ||= opts.fetch(:as, :div).to_sym
  end

  def classes
    @classes ||= join_classes [opts[:classes], classes_for_type]
  end

  def classes_for_type
    join_classes ["container", opts.fetch(:max_w, "max-w-prose")]
  end
end
