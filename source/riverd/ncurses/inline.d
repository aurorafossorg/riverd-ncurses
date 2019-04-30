module riverd.ncurses.inline;

import riverd.ncurses.types;

version(RiverD_NCurses_Static) {
	import riverd.ncurses.statfun;
	alias nclear = riverd.ncurses.statfun.clear;
} else {
	import riverd.ncurses.dynload;
	alias nclear = riverd.ncurses.dynload.clear;
}

alias fixterm = reset_prog_mode;
alias resetterm = reset_shell_mode;
alias saveterm = def_prog_mode;
alias crmode = cbreak;
alias nocrmode = nocbreak;

alias vw_printw = vwprintw;
alias vw_scanw = vwscanw;

alias _tracech_t = _tracechtype;
alias _tracech_t2 = _tracechtype2;

extern (D) auto clear()
{
	return wclear(stdscr);
}

extern (D) auto clrtobot()
{
	return wclrtobot(stdscr);
}

extern (D) auto clrtoeol()
{
	return wclrtoeol(stdscr);
}

extern (D) auto delch()
{
	return wdelch(stdscr);
}

extern (D) auto deleteln()
{
	return winsdelln(stdscr, -1);
}


extern (D) auto erase()
{
	return werase(stdscr);
}

extern (D) auto getch()
{
	return wgetch(stdscr);
}

extern (D) auto inch()
{
	return winch(stdscr);
}

extern (D) auto insertln()
{
	return winsdelln(stdscr, 1);
}

extern (D) auto scrl(T)(auto ref T n)
{
	return wscrl(stdscr, n);
}

extern (D) auto refresh()
{
	return wrefresh(stdscr);
}

extern (D) auto wstandout(T)(auto ref T win)
{
	return wattrset(win, A_STANDOUT);
}

extern (D) auto wstandend(T)(auto ref T win)
{
	return wattrset(win, A_NORMAL);
}

extern (D) auto standend()
{
	return wstandend(stdscr);
}

extern (D) auto standout()
{
	return wstandout(stdscr);
}