//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "~/.config/dwmblocks/scripts/volume.sh",	1,	10},
	{"", "~/.config/dwmblocks/scripts/storage.sh",	10,	18},
	{"", "~/.config/dwmblocks/scripts/memory.sh",	5,	18},
	{"", "~/.config/dwmblocks/scripts/temp.sh",	5,	18},
	{"💻 ", "~/.config/dwmblocks/scripts/cpu.sh",	5,	18},
	{"🔋 ", "~/.config/dwmblocks/scripts/bat.sh",	10,	18},
	{"", "date '+%d/%m/%Y %A %I:%M:%S'",	5,	0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "|";
static unsigned int delimLen = 5;
