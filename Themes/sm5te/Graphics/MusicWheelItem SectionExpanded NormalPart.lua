return Def.ActorFrame{
	Def.Banner{
		InitCommand=cmd(x,86;diffuse,color("0.75,0.75,0.75,1"));
		SetMessageCommand=function(self,param)
			if param.Text then
				self:LoadFromSongGroup(param.Text);
				self:scaletoclipped((256/80)*40,40)
			end
		end;
	};
	LoadActor(THEME:GetPathG("_section expanded","base"))..{
		InitCommand=cmd();
	};
	Def.Quad{
		Name="Border";
		InitCommand=cmd(zoomto,300,2;diffuse,color("#444444");valign,1;y,20);
	};
};