//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "~/.scripts/statusbar/volume",	1,	10},
	{"", "~/.scripts/statusbar/bat",	10,	18},
	{"", "~/.scripts/statusbar/storage",	10,	18},
	{"", "~/.scripts/statusbar/memory",	5,	18},
	{"", "~/.scripts/statusbar/temp",	5,	18},
	{"","~/.scripts/statusbar/cpu",	5,	18},
	{"", "date '+%d/%m/%Y %A %I:%M:%S'",	5,	0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "|";
static unsigned int delimLen = 5;
