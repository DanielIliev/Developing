require 'rubygems'
require 'rubygame'

Rubygame.init
Rubygame::Mixer.open_audio()
filename = 'image.jpeg'

class Game
	include Rubygame
	def user_interface
		@screen = Screen.set_mode [640, 480]
		i = 1
		@clock = Clock.new
		@clock.target_framerate = 60		
		@queue = EventQueue.new
		@game_over = false		
		while @game_over != true do
			if i % 2 == 0
				@screen.fill [0,38,153]
				@screen.update
				sleep 1.5
			elsif i % 2 != 0
				@screen.fill [0,204,51]
				@screen.update
				sleep 1.5
			end
			i = rand(10000)
			@screen.fill [rand(255),rand(255),rand(255)]
			@screen.update
			sleep 1.5
			@queue.each do |event|
				case event
					when QuitEvent
						@game_over = true
				end
			end
		end
	end
	def music
	end
end

Rubygame.quit

p = Game.new
p.user_interface()
p.music()
