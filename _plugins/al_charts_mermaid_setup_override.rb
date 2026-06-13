# frozen_string_literal: true

# Site-local customization: keep al_charts ownership, but use this site's
# Catppuccin Mermaid setup script instead of the plugin default setup asset.
module SiteAlChartsMermaidSetupOverride
  module Patch
    def render(context)
      super.sub(%r{(<script defer src="[^"]*)/assets/al_charts/js/mermaid-setup\.js("[^>]*></script>)}, '\1/assets/js/mermaid-init.js\2')
    end
  end

  def self.apply
    return unless defined?(AlCharts::ChartsScriptsTag)
    return if AlCharts::ChartsScriptsTag < Patch

    AlCharts::ChartsScriptsTag.prepend(Patch)
  end
end

Jekyll::Hooks.register :site, :after_init do |_site|
  SiteAlChartsMermaidSetupOverride.apply
end

SiteAlChartsMermaidSetupOverride.apply
