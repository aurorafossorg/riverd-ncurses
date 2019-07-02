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

extern (D) auto wattron(T0, T1)(auto ref T0 win, auto ref T1 at)
{
	return wattr_on(win, NCURSES_CAST!attr_t(at), null);
}

extern (D) auto wattroff(T0, T1)(auto ref T0 win, auto ref T1 at)
{
	return wattr_off(win, NCURSES_CAST!attr_t(at), null);
}

extern (D) auto border(T0, T1, T2, T3, T4, T5, T6, T7)(auto ref T0 ls, auto ref T1 rs, auto ref T2 ts, auto ref T3 bs, auto ref T4 tl, auto ref T5 tr, auto ref T6 bl, auto ref T7 br)
{
	return wborder(stdscr, ls, rs, ts, bs, tl, tr, bl, br);
}

/*
 * X/Open says this returns a bool; SVr4 also checked for out-of-range line.
 * The macro provides compatibility:
 */
extern (D) auto is_linetouched(T0, T1)(auto ref T0 w, auto ref T1 l)
{
	return (!w || (l > getmaxy(w)) || (l < 0)) ? ERR : is_linetouched(w, l);
}

/*
 * vid_attr() was implemented originally based on a draft of X/Open curses.
 */
extern (D) auto vid_attr(T0, T1, T2)(auto ref T0 a, auto ref T1 pair, auto ref T2 opts)
{
	return vidattr(a);
}

/*
 * Most of the pseudo functions are macros that either provide compatibility
 * with older versions of curses, or provide inline functionality to improve
 * performance.
 */

/*
 * These pseudo functions are always implemented as macros:
 */

/*
 * These miscellaneous pseudo functions are provided for compatibility:
 */

extern (D) auto wgetstr(T0, T1)(auto ref T0 w, auto ref T1 s)
{
	return wgetnstr(w, s, -1);
}

extern (D) auto getnstr(T0, T1)(auto ref T0 s, auto ref T1 n)
{
	return wgetnstr(stdscr, s, n);
}

extern (D) auto setterm(T)(auto ref T term)
{
	return setupterm(term, 1, cast(int*) 0);
}

extern (D) auto scroll(T)(auto ref T win)
{
	return wscrl(win, 1);
}

extern (D) auto touchwin(T)(auto ref T win)
{
	return wtouchln(win, 0, getmaxy(win), 1);
}

extern (D) auto touchline(T0, T1, T2)(auto ref T0 win, auto ref T1 s, auto ref T2 c)
{
	return wtouchln(win, s, c, 1);
}

extern (D) auto untouchwin(T)(auto ref T win)
{
	return wtouchln(win, 0, getmaxy(win), 0);
}

extern (D) auto box(T0, T1, T2)(auto ref T0 win, auto ref T1 v, auto ref T2 h)
{
	return wborder(win, v, v, h, h, 0, 0, 0, 0);
}

extern (D) auto border(T0, T1, T2, T3, T4, T5, T6, T7)(auto ref T0 ls, auto ref T1 rs, auto ref T2 ts, auto ref T3 bs, auto ref T4 tl, auto ref T5 tr, auto ref T6 bl, auto ref T7 br)
{
	return wborder(stdscr, ls, rs, ts, bs, tl, tr, bl, br);
}

extern (D) auto hline(T0, T1)(auto ref T0 ch, auto ref T1 n)
{
	return whline(stdscr, ch, n);
}

extern (D) auto vline(T0, T1)(auto ref T0 ch, auto ref T1 n)
{
	return wvline(stdscr, ch, n);
}

extern (D) auto winstr(T0, T1)(auto ref T0 w, auto ref T1 s)
{
	return winnstr(w, s, -1);
}

extern (D) auto winchstr(T0, T1)(auto ref T0 w, auto ref T1 s)
{
	return winchnstr(w, s, -1);
}

extern (D) auto winsstr(T0, T1)(auto ref T0 w, auto ref T1 s)
{
	return winsnstr(w, s, -1);
}

extern (D) auto redrawwin(T)(auto ref T win)
{
	return wredrawln(win, 0, NCURSES_OK_ADDR(win) ? win._maxy + 1 : -1);
}

/* NCURSES_OPAQUE */

extern (D) auto waddstr(T0, T1)(auto ref T0 win, auto ref T1 str)
{
	return waddnstr(win, str, -1);
}

extern (D) auto waddchstr(T0, T1)(auto ref T0 win, auto ref T1 str)
{
	return waddchnstr(win, str, -1);
}

/*
 * pseudo functions for standard screen
 */

extern (D) auto addch(T)(auto ref T ch)
{
	return waddch(stdscr, ch);
}

extern (D) auto addchnstr(T0, T1)(auto ref T0 str, auto ref T1 n)
{
	return waddchnstr(stdscr, str, n);
}

extern (D) auto addchstr(T)(auto ref T str)
{
	return waddchstr(stdscr, str);
}

extern (D) auto addnstr(T0, T1)(auto ref T0 str, auto ref T1 n)
{
	return waddnstr(stdscr, str, n);
}

extern (D) auto addstr(T)(auto ref T str)
{
	return waddnstr(stdscr, str, -1);
}

extern (D) auto attr_get(T0, T1, T2)(auto ref T0 ap, auto ref T1 cp, auto ref T2 o)
{
	return wattr_get(stdscr, ap, cp, o);
}

extern (D) auto attr_off(T0, T1)(auto ref T0 a, auto ref T1 o)
{
	return wattr_off(stdscr, a, o);
}

extern (D) auto attr_on(T0, T1)(auto ref T0 a, auto ref T1 o)
{
	return wattr_on(stdscr, a, o);
}

extern (D) auto attr_set(T0, T1, T2)(auto ref T0 a, auto ref T1 c, auto ref T2 o)
{
	return wattr_set(stdscr, a, c, o);
}

extern (D) auto attroff(T)(auto ref T at)
{
	return wattroff(stdscr, at);
}

extern (D) auto attron(T)(auto ref T at)
{
	return wattron(stdscr, at);
}

extern (D) auto attrset(T)(auto ref T at)
{
	return wattrset(stdscr, at);
}

extern (D) auto bkgd(T)(auto ref T ch)
{
	return wbkgd(stdscr, ch);
}

extern (D) auto bkgdset(T)(auto ref T ch)
{
	return wbkgdset(stdscr, ch);
}

extern (D) auto chgat(T0, T1, T2, T3)(auto ref T0 n, auto ref T1 a, auto ref T2 c, auto ref T3 o)
{
	return wchgat(stdscr, n, a, c, o);
}

extern (D) auto color_set(T0, T1)(auto ref T0 c, auto ref T1 o)
{
	return wcolor_set(stdscr, c, o);
}

extern (D) auto echochar(T)(auto ref T c)
{
	return wechochar(stdscr, c);
}

extern (D) auto getstr(T)(auto ref T str)
{
	return wgetstr(stdscr, str);
}

extern (D) auto inchnstr(T0, T1)(auto ref T0 s, auto ref T1 n)
{
	return winchnstr(stdscr, s, n);
}

extern (D) auto inchstr(T)(auto ref T s)
{
	return winchstr(stdscr, s);
}

extern (D) auto innstr(T0, T1)(auto ref T0 s, auto ref T1 n)
{
	return winnstr(stdscr, s, n);
}

extern (D) auto insch(T)(auto ref T c)
{
	return winsch(stdscr, c);
}

extern (D) auto insdelln(T)(auto ref T n)
{
	return winsdelln(stdscr, n);
}

extern (D) auto insnstr(T0, T1)(auto ref T0 s, auto ref T1 n)
{
	return winsnstr(stdscr, s, n);
}

extern (D) auto insstr(T)(auto ref T s)
{
	return winsstr(stdscr, s);
}

extern (D) auto instr(T)(auto ref T s)
{
	return winstr(stdscr, s);
}

extern (D) auto move(T0, T1)(auto ref T0 y, auto ref T1 x)
{
	return wmove(stdscr, y, x);
}

extern (D) auto setscrreg(T0, T1)(auto ref T0 t, auto ref T1 b)
{
	return wsetscrreg(stdscr, t, b);
}

extern (D) auto timeout(T)(auto ref T delay)
{
	return wtimeout(stdscr, delay);
}

extern (D) auto wdeleteln(T)(auto ref T win)
{
	return winsdelln(win, -1);
}

extern (D) auto winsertln(T)(auto ref T win)
{
	return winsdelln(win, 1);
}

/*
 * mv functions
 */

extern (D) auto mvwaddch(T0, T1, T2, T3)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 ch)
{
	return wmove(win, y, x) == ERR ? ERR : waddch(win, ch);
}

extern (D) auto mvwaddchnstr(T0, T1, T2, T3, T4)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 str, auto ref T4 n)
{
	return wmove(win, y, x) == ERR ? ERR : waddchnstr(win, str, n);
}

extern (D) auto mvwaddchstr(T0, T1, T2, T3)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 str)
{
	return wmove(win, y, x) == ERR ? ERR : waddchnstr(win, str, -1);
}

extern (D) auto mvwaddnstr(T0, T1, T2, T3, T4)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 str, auto ref T4 n)
{
	return wmove(win, y, x) == ERR ? ERR : waddnstr(win, str, n);
}

extern (D) auto mvwaddstr(T0, T1, T2, T3)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 str)
{
	return wmove(win, y, x) == ERR ? ERR : waddnstr(win, str, -1);
}

extern (D) auto mvwchgat(T0, T1, T2, T3, T4, T5, T6)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 n, auto ref T4 a, auto ref T5 c, auto ref T6 o)
{
	return wmove(win, y, x) == ERR ? ERR : wchgat(win, n, a, c, o);
}

extern (D) auto mvwdelch(T0, T1, T2)(auto ref T0 win, auto ref T1 y, auto ref T2 x)
{
	return wmove(win, y, x) == ERR ? ERR : wdelch(win);
}

extern (D) auto mvwgetch(T0, T1, T2)(auto ref T0 win, auto ref T1 y, auto ref T2 x)
{
	return wmove(win, y, x) == ERR ? ERR : wgetch(win);
}

extern (D) auto mvwgetnstr(T0, T1, T2, T3, T4)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 str, auto ref T4 n)
{
	return wmove(win, y, x) == ERR ? ERR : wgetnstr(win, str, n);
}

extern (D) auto mvwgetstr(T0, T1, T2, T3)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 str)
{
	return wmove(win, y, x) == ERR ? ERR : wgetstr(win, str);
}

extern (D) auto mvwhline(T0, T1, T2, T3, T4)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 c, auto ref T4 n)
{
	return wmove(win, y, x) == ERR ? ERR : whline(win, c, n);
}

extern (D) auto mvwinch(T0, T1, T2)(auto ref T0 win, auto ref T1 y, auto ref T2 x)
{
	return wmove(win, y, x) == ERR ? NCURSES_CAST!chtype(ERR) : winch(win);
}

extern (D) auto mvwinchnstr(T0, T1, T2, T3, T4)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 s, auto ref T4 n)
{
	return wmove(win, y, x) == ERR ? ERR : winchnstr(win, s, n);
}

extern (D) auto mvwinchstr(T0, T1, T2, T3)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 s)
{
	return wmove(win, y, x) == ERR ? ERR : winchstr(win, s);
}

extern (D) auto mvwinnstr(T0, T1, T2, T3, T4)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 s, auto ref T4 n)
{
	return wmove(win, y, x) == ERR ? ERR : winnstr(win, s, n);
}

extern (D) auto mvwinsch(T0, T1, T2, T3)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 c)
{
	return wmove(win, y, x) == ERR ? ERR : winsch(win, c);
}

extern (D) auto mvwinsnstr(T0, T1, T2, T3, T4)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 s, auto ref T4 n)
{
	return wmove(win, y, x) == ERR ? ERR : winsnstr(win, s, n);
}

extern (D) auto mvwinsstr(T0, T1, T2, T3)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 s)
{
	return wmove(win, y, x) == ERR ? ERR : winsstr(win, s);
}

extern (D) auto mvwinstr(T0, T1, T2, T3)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 s)
{
	return wmove(win, y, x) == ERR ? ERR : winstr(win, s);
}

extern (D) auto mvwvline(T0, T1, T2, T3, T4)(auto ref T0 win, auto ref T1 y, auto ref T2 x, auto ref T3 c, auto ref T4 n)
{
	return wmove(win, y, x) == ERR ? ERR : wvline(win, c, n);
}

extern (D) auto mvaddch(T0, T1, T2)(auto ref T0 y, auto ref T1 x, auto ref T2 ch)
{
	return mvwaddch(stdscr, y, x, ch);
}

extern (D) auto mvaddchnstr(T0, T1, T2, T3)(auto ref T0 y, auto ref T1 x, auto ref T2 str, auto ref T3 n)
{
	return mvwaddchnstr(stdscr, y, x, str, n);
}

extern (D) auto mvaddchstr(T0, T1, T2)(auto ref T0 y, auto ref T1 x, auto ref T2 str)
{
	return mvwaddchstr(stdscr, y, x, str);
}

extern (D) auto mvaddnstr(T0, T1, T2, T3)(auto ref T0 y, auto ref T1 x, auto ref T2 str, auto ref T3 n)
{
	return mvwaddnstr(stdscr, y, x, str, n);
}

extern (D) auto mvaddstr(T0, T1, T2)(auto ref T0 y, auto ref T1 x, auto ref T2 str)
{
	return mvwaddstr(stdscr, y, x, str);
}

extern (D) auto mvchgat(T0, T1, T2, T3, T4, T5)(auto ref T0 y, auto ref T1 x, auto ref T2 n, auto ref T3 a, auto ref T4 c, auto ref T5 o)
{
	return mvwchgat(stdscr, y, x, n, a, c, o);
}

extern (D) auto mvdelch(T0, T1)(auto ref T0 y, auto ref T1 x)
{
	return mvwdelch(stdscr, y, x);
}

extern (D) auto mvgetch(T0, T1)(auto ref T0 y, auto ref T1 x)
{
	return mvwgetch(stdscr, y, x);
}

extern (D) auto mvgetnstr(T0, T1, T2, T3)(auto ref T0 y, auto ref T1 x, auto ref T2 str, auto ref T3 n)
{
	return mvwgetnstr(stdscr, y, x, str, n);
}

extern (D) auto mvgetstr(T0, T1, T2)(auto ref T0 y, auto ref T1 x, auto ref T2 str)
{
	return mvwgetstr(stdscr, y, x, str);
}

extern (D) auto mvhline(T0, T1, T2, T3)(auto ref T0 y, auto ref T1 x, auto ref T2 c, auto ref T3 n)
{
	return mvwhline(stdscr, y, x, c, n);
}

extern (D) auto mvinch(T0, T1)(auto ref T0 y, auto ref T1 x)
{
	return mvwinch(stdscr, y, x);
}

extern (D) auto mvinchnstr(T0, T1, T2, T3)(auto ref T0 y, auto ref T1 x, auto ref T2 s, auto ref T3 n)
{
	return mvwinchnstr(stdscr, y, x, s, n);
}

extern (D) auto mvinchstr(T0, T1, T2)(auto ref T0 y, auto ref T1 x, auto ref T2 s)
{
	return mvwinchstr(stdscr, y, x, s);
}

extern (D) auto mvinnstr(T0, T1, T2, T3)(auto ref T0 y, auto ref T1 x, auto ref T2 s, auto ref T3 n)
{
	return mvwinnstr(stdscr, y, x, s, n);
}

extern (D) auto mvinsch(T0, T1, T2)(auto ref T0 y, auto ref T1 x, auto ref T2 c)
{
	return mvwinsch(stdscr, y, x, c);
}

extern (D) auto mvinsnstr(T0, T1, T2, T3)(auto ref T0 y, auto ref T1 x, auto ref T2 s, auto ref T3 n)
{
	return mvwinsnstr(stdscr, y, x, s, n);
}

extern (D) auto mvinsstr(T0, T1, T2)(auto ref T0 y, auto ref T1 x, auto ref T2 s)
{
	return mvwinsstr(stdscr, y, x, s);
}

extern (D) auto mvinstr(T0, T1, T2)(auto ref T0 y, auto ref T1 x, auto ref T2 s)
{
	return mvwinstr(stdscr, y, x, s);
}

extern (D) auto mvvline(T0, T1, T2, T3)(auto ref T0 y, auto ref T1 x, auto ref T2 c, auto ref T3 n)
{
	return mvwvline(stdscr, y, x, c, n);
}

/* NCURSES_OPAQUE */

extern (D) auto slk_attr_off(T0, T1)(auto ref T0 a, auto ref T1 v)
{
	return v ? ERR : slk_attroff(a);
}

extern (D) auto slk_attr_on(T0, T1)(auto ref T0 a, auto ref T1 v)
{
	return v ? ERR : slk_attron(a);
}

extern (D) auto mouse_trafo(T0, T1, T2)(auto ref T0 y, auto ref T1 x, auto ref T2 to_screen)
{
	return wmouse_trafo(stdscr, y, x, to_screen);
}

extern (D) void getyx(U:WINDOW*, T: int)(U win, ref T y, ref T x)
{
	y = getcury(win);
	x = getcurx(win);
}

extern (D) void getparyx(U:WINDOW*, T: int)(U win, ref T y, ref T x)
{
	y = getpary(win);
	x = getparx(win);
}
extern (D) void getmaxyx(U:WINDOW*, T: int)(U win, ref T y, ref T x)
{
	y = getmaxy(win);
	x = getmaxx(win);
}
extern (D) void getbegyx(U:WINDOW*, T: int)(U win, ref T y, ref T x)
{
	y = getbegy(win);
	x = getbegx(win);
}
