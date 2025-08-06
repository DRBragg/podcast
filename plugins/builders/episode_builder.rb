class Builders::EpisodeBuilder < SiteBuilder
  def build
    hook :site, :post_read do
      site.data[:episodes].reject { |e| e[:private] }.each do |episode|
        add_resource :episodes, "#{Bridgetown::Utils.slugify(episode[:title])}.md" do
          layout "episode"
          title episode[:title]
          description episode[:description]
          tags episode[:tags]
          release_date episode[:published_at]
          summary episode[:summary]
        end
      end
    end
  end
end
