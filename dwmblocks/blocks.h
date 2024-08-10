//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
    /*
    {
        "...", // icon
        "...", // command
        "...", // update interval
        "..."  // update signal
    }
    */
	{ " ", "", 3600, 0 }, // empty boundary block
	{
        //"CPU: ",
        "[C] ",
        "top -bn1 | awk '/Cpu/ {print $2 \"%\"}'",
        2,
        0
    },
	{
        //"Mem: ",
        "[M] ",
        "free -h | awk '/^Mem/ { print $3\" ⧸ \"$2 }' | sed s/i//g",
        2,
        0
    },
	{
        //"Drive: ",
        "[D] ",
        "~/.setup/utils/get_storage",
        5,
        0
    },
	{
        "⬆ ",
        "~/.setup/utils/get_uptime",
        5,
        0
    },
	{
        "",
        "date '+%Y-%m-%d %H:%M:%S'",
        1,
        0
    },
	{ " ", "", 3600, 0 }, // empty boundary block
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " ｜ ";
static unsigned int delimLen = 5;
