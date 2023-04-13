t = Def.ActorFrame {}

t[#t+1] = Def.Sprite {
	
	Texture="MorsioJAM 5x4.png",
	Frame0000=0,	Delay0000=0.2,
	Frame0001=1,	Delay0001=0.2,
	Frame0002=2,	Delay0002=0.2,
	Frame0003=3,	Delay0003=0.2,
	Frame0004=4,	Delay0004=0.2,
	Frame0005=5,	Delay0005=0.2,
	Frame0006=6,	Delay0006=0.2,
	Frame0007=7,	Delay0007=0.2,
	Frame0008=8,	Delay0008=0.2,
	Frame0009=9,	Delay0009=0.2,
	Frame0010=10,	Delay0010=0.2,
	Frame0011=11,	Delay0011=0.2,
	Frame0012=12,	Delay0012=0.2,
	Frame0013=13,	Delay0013=0.2,
	Frame0014=14,	Delay0014=0.2,
	Frame0015=15,	Delay0015=0.2,
	Frame0016=16,	Delay0016=0.2,
	Frame0017=17,	Delay0017=0.2,
	Frame0018=18,	Delay0018=0.2,
	Frame0019=19,	Delay0019=0.2,
	
	OnCommand=function(self)
		self:effectclock("bgm")
--[[ 		self:cropright(0.02)
		self:cropleft(0.02)
		self:croptop(0.02)
		self:cropbottom(0.02)
		self:zoom(2) ]]
	end
	
}

return t