atom_feed do |feed|
  feed.title    Blogo.config.site_title
  feed.subtitle Blogo.config.site_subtitle
  feed.updated  @updated

  @posts.each do |post|
    feed.entry(post, url: url_to_post(post)) do |entry|
      entry.url     url_to_post(post)
      entry.title   post.title
      entry.content post_overview(post), :type => 'html'
      entry.updated post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")

      entry.author do |author|
        author.name post.user.name
      end
    end
  end
end
