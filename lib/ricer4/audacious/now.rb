module Ricer4::Plugins::Audacious
  class Now < Ricer4::Plugin
    
    trigger_is "audacious.now"
    
    def what_audacious_is_playing
      back = `audtool current-song`
      back.strip.gsub(/\s+/, ' ') rescue nil
    end
    
    has_usage
    def execute
      rply :msg_playing, who: bot.config.owner, song: what_audacious_is_playing
    end
    
  end
end
