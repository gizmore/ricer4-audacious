module Ricer4::Plugins::Audacious
  class Announce < Ricer4::Plugin
    
    is_announce_trigger "audacious.announce"
    
    def plugin_init
      arm_subscribe('ricer/ready') do
        service_threaded do
          @current_song = what_audacious_is_playing
          loop do
            sleep 7.seconds
            check_new_song
          end
        end
      end
    end
    
    def what_audacious_is_playing
      get_plugin('Audacious/Now').what_audacious_is_playing
    end
    
    def check_new_song
      current_song = what_audacious_is_playing
      if @current_song != current_song
        @current_song = current_song
        announce_new_song
      end
    end
    
    def announce_new_song
      announce_targets do |target|
        target.localize!.send_message(announce_message)
      end
    end
    
    def announce_message
      t(:msg_next_song, who: bot.config.owner, song: @current_song)      
    end
    
  end
end
