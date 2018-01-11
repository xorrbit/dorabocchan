function dump_map()
  map = memory.readbyterange(0xc000, (64*64))
  console.clear()
  console.writeline("dumping map...")
  
  mapstr = ""
  for x=0,63,1 do
    for y=0,63,1 do
	  index = (x*64)+y
	  d = map[index]
	  mapstr = mapstr .. string.format('%02X', d)
	end
	mapstr = mapstr .. "\n"
  end
  console.write(mapstr)
end

form = forms.newform(128, 240, "Spike McFang")
dump_button = forms.button(form, "Dump map", dump_map, 0, 0, 120, 20)

while true do
  hp = memory.read_u16_le(0x4ce0)
  hp = (bit.rshift(hp, 6) + 1) / 2
  
  px = memory.read_u16_le(0x1c20)
  py = memory.read_u16_le(0x1da0)
  
  gui.text(0, 0, "hp: ")
  gui.text(40, 0, hp)
  gui.text(0, 16, "pos: ")
  gui.text(50, 16, px)
  gui.text(80, 16, ",")
  gui.text(90, 16, py)  
  
  emu.frameadvance();
end