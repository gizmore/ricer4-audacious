module Ricer4::Plugins::Audacious
  class About < Ricer4::Plugin
    
    trigger_is "audacious"
    
    has_usage
    def execute
      reply get_usage
    end
    
  end
end
