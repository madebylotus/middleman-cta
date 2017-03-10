require "middleman-core"

Middleman::Extensions.register :cta do
  require 'cta/instance'
  require 'cta/redcarpet/cta_renderer'
  require 'cta/extension'

  CTA::Extension
end
