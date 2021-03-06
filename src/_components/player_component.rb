class PlayerComponent < BaseComponent
  attr_reader :size, :tags, :limit

  SRC_BASE = "https://www.buzzsprout.com/1927628.js".freeze

  def initialize(size: :small, tags: [], limit: 0)
    @size = size
    @tags = tags
    @limit = limit
  end

  def query_string
    query = ["player=#{size}", "container_id=#{container_id}"]
    query << "tags=#{tags.join("+")}" if tags.any?
    query << "limit=#{limit}" if limit.positive?
    query.join "&"
  end

  def container_id
    ["buzzsprout-player", size, tags.join("-")].join("-")
  end

  def src
    "#{SRC_BASE}?#{query_string}"
  end

  def call
    tag.div(id: container_id) do
      tag.script(src: src, type: "text/javascript", charset: "utf-8")
    end
  end
end
