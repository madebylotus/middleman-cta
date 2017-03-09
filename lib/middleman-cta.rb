require "middleman-core"

Middleman::Extensions.register :cta do
  require 'cta/instance'
  require 'cta/extension'

  CTA::Extension
end
