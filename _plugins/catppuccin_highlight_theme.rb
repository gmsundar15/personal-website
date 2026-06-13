# frozen_string_literal: true

# Site-local customization: keep al_folio_core's head/theme wiring, but point the
# existing light/dark syntax-highlighting links at this site's Catppuccin CSS.
Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  next unless item.output&.include?('id="highlight_theme_light"')

  item.output = item.output
                    .gsub('/assets/css/jekyll-pygments-themes-github.css', '/assets/css/jekyll-pygments-latte.css')
                    .gsub('/assets/css/jekyll-pygments-themes-native.css', '/assets/css/jekyll-pygments-mocha.css')
end
