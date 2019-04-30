/*
                                    __
                                   / _|
  __ _ _   _ _ __ ___  _ __ __ _  | |_ ___  ___ ___
 / _` | | | | '__/ _ \| '__/ _` | |  _/ _ \/ __/ __|
| (_| | |_| | | | (_) | | | (_| | | || (_) \__ \__ \
 \__,_|\__,_|_|  \___/|_|  \__,_| |_| \___/|___/___/

Copyright (C) 2018-2019 Aurora Free Open Source Software.

This file is part of the Aurora Free Open Source Software. This
organization promote free and open source software that you can
redistribute and/or modify under the terms of the GNU Lesser General
Public License Version 3 as published by the Free Software Foundation or
(at your option) any later version approved by the Aurora Free Open Source
Software Organization. The license is available in the package root path
as 'LICENSE' file. Please review the following information to ensure the
GNU Lesser General Public License version 3 requirements will be met:
https://www.gnu.org/licenses/lgpl.html .

Alternatively, this file may be used under the terms of the GNU General
Public License version 3 or later as published by the Free Software
Foundation. Please review the following information to ensure the GNU
General Public License requirements will be met:
http://www.gnu.org/licenses/gpl-3.0.html.

NOTE: All products, services or anything associated to trademarks and
service marks used or referenced on this file are the property of their
respective companies/owners or its subsidiaries. Other names and brands
may be claimed as the property of others.

For more info about intellectual property visit: aurorafoss.org or
directly send an email to: contact (at) aurorafoss.org .
*/

module riverd.ncurses.statfun;

import riverd.ncurses.types;
import core.stdc.stdarg;
import core.stdc.stdio;

extern(C) @nogc nothrow {

	/*
	* Function prototypes.  This is the complete X/Open Curses list of required
	* functions.  Those marked `generated' will have sources generated from the
	* macro definitions later in this file, in order to satisfy XPG4.2
	* requirements.
	*/

	int addch (const chtype);
	int addchnstr (const(chtype)*, int);
	int addchstr (const(chtype)*);
	int addnstr (const(char)*, int);
	int addstr (const(char)*);
	int attroff (int);
	int attron (int);
	int attrset (int);
	int attr_get (attr_t*, short*, void*);
	int attr_off (attr_t, void*);
	int attr_on (attr_t, void*);
	int attr_set (attr_t, short, void*);
	int baudrate ();
	int beep ();
	int bkgd (chtype);
	void bkgdset (chtype);
	int border (chtype, chtype, chtype, chtype, chtype, chtype, chtype, chtype);
	int box (WINDOW*, chtype, chtype);
	bool can_change_color ();
	int cbreak ();
	int chgat (int, attr_t, short, const(void)*);
	int clear ();
	int clearok (WINDOW*, bool);
	int clrtobot ();
	int clrtoeol ();
	int color_content (short, short*, short*, short*);
	int color_set (short, void*);
	int COLOR_PAIR (int);
	int copywin (const(WINDOW)*, WINDOW*, int, int, int, int, int, int, int);
	int curs_set (int);
	int def_prog_mode ();
	int def_shell_mode ();
	int delay_output (int);
	int delch ();
	void delscreen (SCREEN*);
	int delwin (WINDOW*);
	int deleteln ();
	WINDOW* derwin (WINDOW*, int, int, int, int);
	int doupdate ();
	WINDOW* dupwin (WINDOW*);
	int echo ();
	int echochar (const chtype);
	int erase ();
	int endwin ();
	char erasechar ();
	void filter ();
	int flash ();
	int flushinp ();
	chtype getbkgd (WINDOW*);
	int getch ();
	int getnstr (char*, int);
	int getstr (char*);
	WINDOW* getwin (FILE*);
	int halfdelay (int);
	bool has_colors ();
	bool has_ic ();
	bool has_il ();
	int hline (chtype, int);
	void idcok (WINDOW*, bool);
	int idlok (WINDOW*, bool);
	void immedok (WINDOW*, bool);
	chtype inch ();
	int inchnstr (chtype*, int);
	int inchstr (chtype*);
	WINDOW* initscr ();
	int init_color (short, short, short, short);
	int init_pair (short, short, short);
	int innstr (char*, int);
	int insch (chtype);
	int insdelln (int);
	int insertln ();
	int insnstr (const(char)*, int);
	int insstr (const(char)*);
	int instr (char*);
	int intrflush (WINDOW*, bool);
	bool isendwin ();
	bool is_linetouched (WINDOW*, int);
	bool is_wintouched (WINDOW*);
	const(char)* keyname (int);
	int keypad (WINDOW*, bool);
	char killchar ();
	int leaveok (WINDOW*, bool);
	char* longname ();
	int meta (WINDOW*, bool);
	int move (int, int);
	int mvaddch (int, int, const chtype);
	int mvaddchnstr (int, int, const(chtype)*, int);
	int mvaddchstr (int, int, const(chtype)*);
	int mvaddnstr (int, int, const(char)*, int);
	int mvaddstr (int, int, const(char)*);
	int mvchgat (int, int, int, attr_t, short, const(void)*);
	int mvcur (int, int, int, int);
	int mvdelch (int, int);
	int mvderwin (WINDOW*, int, int);
	int mvgetch (int, int);
	int mvgetnstr (int, int, char*, int);
	int mvgetstr (int, int, char*);
	int mvhline (int, int, chtype, int);
	chtype mvinch (int, int);
	int mvinchnstr (int, int, chtype*, int);
	int mvinchstr (int, int, chtype*);
	int mvinnstr (int, int, char*, int);
	int mvinsch (int, int, chtype);
	int mvinsnstr (int, int, const(char)*, int);
	int mvinsstr (int, int, const(char)*);
	int mvinstr (int, int, char*);
	int mvprintw (int, int, const(char)*, ...);
	int mvscanw (int, int, const(char)*, ...);
	int mvvline (int, int, chtype, int);
	int mvwaddch (WINDOW*, int, int, const chtype);
	int mvwaddchnstr (WINDOW*, int, int, const(chtype)*, int);
	int mvwaddchstr (WINDOW*, int, int, const(chtype)*);
	int mvwaddnstr (WINDOW*, int, int, const(char)*, int);
	int mvwaddstr (WINDOW*, int, int, const(char)*);
	int mvwchgat (WINDOW*, int, int, int, attr_t, short, const(void)*);
	int mvwdelch (WINDOW*, int, int);
	int mvwgetch (WINDOW*, int, int);
	int mvwgetnstr (WINDOW*, int, int, char*, int);
	int mvwgetstr (WINDOW*, int, int, char*);
	int mvwhline (WINDOW*, int, int, chtype, int);
	int mvwin (WINDOW*, int, int);
	chtype mvwinch (WINDOW*, int, int);
	int mvwinchnstr (WINDOW*, int, int, chtype*, int);
	int mvwinchstr (WINDOW*, int, int, chtype*);
	int mvwinnstr (WINDOW*, int, int, char*, int);
	int mvwinsch (WINDOW*, int, int, chtype);
	int mvwinsnstr (WINDOW*, int, int, const(char)*, int);
	int mvwinsstr (WINDOW*, int, int, const(char)*);
	int mvwinstr (WINDOW*, int, int, char*);
	int mvwprintw (WINDOW*, int, int, const(char)*, ...);
	int mvwscanw (WINDOW*, int, int, const(char)*, ...);
	int mvwvline (WINDOW*, int, int, chtype, int);
	int napms (int);
	WINDOW* newpad (int, int);
	SCREEN* newterm (const(char)*, FILE*, FILE*);
	WINDOW* newwin (int, int, int, int);
	int nl ();
	int nocbreak ();
	int nodelay (WINDOW*, bool);
	int noecho ();
	int nonl ();
	void noqiflush ();
	int noraw ();
	int notimeout (WINDOW*, bool);
	int overlay (const(WINDOW)*, WINDOW*);
	int overwrite (const(WINDOW)*, WINDOW*);
	int pair_content (short, short*, short*);
	int PAIR_NUMBER (int);
	int pechochar (WINDOW*, const chtype);
	int pnoutrefresh (WINDOW*, int, int, int, int, int, int);
	int prefresh (WINDOW*, int, int, int, int, int, int);
	int printw (const(char)*, ...);
	int putwin (WINDOW*, FILE*);
	void qiflush ();
	int raw ();
	int redrawwin (WINDOW*);
	int refresh ();
	int resetty ();
	int reset_prog_mode ();
	int reset_shell_mode ();
	int ripoffline (int, int function (WINDOW*, int));
	int savetty ();
	int scanw (const(char)*, ...);
	int scr_dump (const(char)*);
	int scr_init (const(char)*);
	int scrl (int);
	int scroll (WINDOW*);
	int scrollok (WINDOW*, bool);
	int scr_restore (const(char)*);
	int scr_set (const(char)*);
	int setscrreg (int, int);
	SCREEN* set_term (SCREEN*);
	int slk_attroff (const chtype);
	int slk_attr_off (const attr_t, void*); /* generated:WIDEC */
	int slk_attron (const chtype);
	int slk_attr_on (attr_t, void*); /* generated:WIDEC */
	int slk_attrset (const chtype);
	attr_t slk_attr ();
	int slk_attr_set (const attr_t, short, void*);
	int slk_clear ();
	int slk_color (short);
	int slk_init (int);
	char* slk_label (int);
	int slk_noutrefresh ();
	int slk_refresh ();
	int slk_restore ();
	int slk_set (int, const(char)*, int);
	int slk_touch ();
	int standout ();
	int standend ();
	int start_color ();
	WINDOW* subpad (WINDOW*, int, int, int, int);
	WINDOW* subwin (WINDOW*, int, int, int, int);
	int syncok (WINDOW*, bool);
	chtype termattrs ();
	char* termname ();
	void timeout (int);
	int touchline (WINDOW*, int, int);
	int touchwin (WINDOW*);
	int typeahead (int);
	int ungetch (int);
	int untouchwin (WINDOW*);
	void use_env (bool);
	void use_tioctl (bool);
	int vidattr (chtype);
	int vidputs (chtype, NCURSES_OUTC);
	int vline (chtype, int);
	int vwprintw (WINDOW*, const(char)*, va_list);
	int vw_printw (WINDOW*, const(char)*, va_list);
	int vwscanw (WINDOW*, const(char)*, va_list);
	int vw_scanw (WINDOW*, const(char)*, va_list);
	int waddch (WINDOW*, const chtype);
	int waddchnstr (WINDOW*, const(chtype)*, int);
	int waddchstr (WINDOW*, const(chtype)*);
	int waddnstr (WINDOW*, const(char)*, int);
	int waddstr (WINDOW*, const(char)*);
	int wattron (WINDOW*, int);
	int wattroff (WINDOW*, int);
	int wattrset (WINDOW*, int);
	int wattr_get (WINDOW*, attr_t*, short*, void*);
	int wattr_on (WINDOW*, attr_t, void*);
	int wattr_off (WINDOW*, attr_t, void*);
	int wattr_set (WINDOW*, attr_t, short, void*);
	int wbkgd (WINDOW*, chtype);
	void wbkgdset (WINDOW*, chtype);
	int wborder (WINDOW*, chtype, chtype, chtype, chtype, chtype, chtype, chtype, chtype);
	int wchgat (WINDOW*, int, attr_t, short, const(void)*);
	int wclear (WINDOW*);
	int wclrtobot (WINDOW*);
	int wclrtoeol (WINDOW*);
	int wcolor_set (WINDOW*, short, void*);
	void wcursyncup (WINDOW*);
	int wdelch (WINDOW*);
	int wdeleteln (WINDOW*);
	int wechochar (WINDOW*, const chtype);
	int werase (WINDOW*);
	int wgetch (WINDOW*);
	int wgetnstr (WINDOW*, char*, int);
	int wgetstr (WINDOW*, char*);
	int whline (WINDOW*, chtype, int);
	chtype winch (WINDOW*);
	int winchnstr (WINDOW*, chtype*, int);
	int winchstr (WINDOW*, chtype*);
	int winnstr (WINDOW*, char*, int);
	int winsch (WINDOW*, chtype);
	int winsdelln (WINDOW*, int);
	int winsertln (WINDOW*);
	int winsnstr (WINDOW*, const(char)*, int);
	int winsstr (WINDOW*, const(char)*);
	int winstr (WINDOW*, char*);
	int wmove (WINDOW*, int, int);
	int wnoutrefresh (WINDOW*);
	int wprintw (WINDOW*, const(char)*, ...);
	int wredrawln (WINDOW*, int, int);
	int wrefresh (WINDOW*);
	int wscanw (WINDOW*, const(char)*, ...);
	int wscrl (WINDOW*, int);
	int wsetscrreg (WINDOW*, int, int);
	int wstandout (WINDOW*);
	int wstandend (WINDOW*);
	void wsyncdown (WINDOW*);
	void wsyncup (WINDOW*);
	void wtimeout (WINDOW*, int);
	int wtouchln (WINDOW*, int, int, int);
	int wvline (WINDOW*, chtype, int);

	/*
	* These are also declared in <term.h>:
	*/
	int tigetflag (const(char)*);
	int tigetnum (const(char)*);
	char* tigetstr (const(char)*);
	int putp (const(char)*);

	char* tparm (const(char)*, ...); /* special */

	/* special */
	/* special */

	char* tiparm (const(char)*, ...); /* special */

	/*
	* These functions are not in X/Open, but we use them in macro definitions:
	*/
	int getattrs (const(WINDOW)*);
	int getcurx (const(WINDOW)*);
	int getcury (const(WINDOW)*);
	int getbegx (const(WINDOW)*);
	int getbegy (const(WINDOW)*);
	int getmaxx (const(WINDOW)*);
	int getmaxy (const(WINDOW)*);
	int getparx (const(WINDOW)*);
	int getpary (const(WINDOW)*);

	/*
	* These functions are extensions - not in X/Open Curses.
	*/
	bool is_term_resized (int, int);
	char* keybound (int, int);
	const(char)* curses_version ();
	int alloc_pair (int, int);
	int assume_default_colors (int, int);
	int define_key (const(char)*, int);
	int extended_color_content (int, int*, int*, int*);
	int extended_pair_content (int, int*, int*);
	int extended_slk_color (int);
	int find_pair (int, int);
	int free_pair (int);
	int get_escdelay ();
	int init_extended_color (int, int, int, int);
	int init_extended_pair (int, int, int);
	int key_defined (const(char)*);
	int keyok (int, bool);
	void reset_color_pairs ();
	int resize_term (int, int);
	int resizeterm (int, int);
	int set_escdelay (int);
	int set_tabsize (int);
	int use_default_colors ();
	int use_extended_names (bool);
	int use_legacy_coding (int);
	int use_screen (SCREEN*, NCURSES_SCREEN_CB, void*);
	int use_window (WINDOW*, NCURSES_WINDOW_CB, void*);
	int wresize (WINDOW*, int, int);
	void nofilter ();

	/*
	* These extensions provide access to information stored in the WINDOW even
	* when NCURSES_OPAQUE is set:
	*/
	WINDOW* wgetparent (const(WINDOW)*);
	bool is_cleared (const(WINDOW)*);
	bool is_idcok (const(WINDOW)*);
	bool is_idlok (const(WINDOW)*);
	bool is_immedok (const(WINDOW)*);
	bool is_keypad (const(WINDOW)*);
	bool is_leaveok (const(WINDOW)*);
	bool is_nodelay (const(WINDOW)*);
	bool is_notimeout (const(WINDOW)*);
	bool is_pad (const(WINDOW)*);
	bool is_scrollok (const(WINDOW)*);
	bool is_subwin (const(WINDOW)*);
	bool is_syncok (const(WINDOW)*);
	int wgetdelay (const(WINDOW)*);
int wgetscrreg (const(WINDOW)*, int*, int*);

	SCREEN* new_prescr (); /* implemented:SP_FUNC */

	int baudrate_sp (SCREEN*); /* implemented:SP_FUNC */
	int beep_sp (SCREEN*); /* implemented:SP_FUNC */
	bool can_change_color_sp (SCREEN*); /* implemented:SP_FUNC */
	int cbreak_sp (SCREEN*); /* implemented:SP_FUNC */
	int curs_set_sp (SCREEN*, int); /* implemented:SP_FUNC */
	int color_content_sp (SCREEN*, short, short*, short*, short*); /* implemented:SP_FUNC */
	int def_prog_mode_sp (SCREEN*); /* implemented:SP_FUNC */
	int def_shell_mode_sp (SCREEN*); /* implemented:SP_FUNC */
	int delay_output_sp (SCREEN*, int); /* implemented:SP_FUNC */
	int doupdate_sp (SCREEN*); /* implemented:SP_FUNC */
	int echo_sp (SCREEN*); /* implemented:SP_FUNC */
	int endwin_sp (SCREEN*); /* implemented:SP_FUNC */
	char erasechar_sp (SCREEN*); /* implemented:SP_FUNC */
	void filter_sp (SCREEN*); /* implemented:SP_FUNC */
	int flash_sp (SCREEN*); /* implemented:SP_FUNC */
	int flushinp_sp (SCREEN*); /* implemented:SP_FUNC */
	WINDOW* getwin_sp (SCREEN*, FILE*); /* implemented:SP_FUNC */
	int halfdelay_sp (SCREEN*, int); /* implemented:SP_FUNC */
	bool has_colors_sp (SCREEN*); /* implemented:SP_FUNC */
	bool has_ic_sp (SCREEN*); /* implemented:SP_FUNC */
	bool has_il_sp (SCREEN*); /* implemented:SP_FUNC */
	int init_color_sp (SCREEN*, short, short, short, short); /* implemented:SP_FUNC */
	int init_pair_sp (SCREEN*, short, short, short); /* implemented:SP_FUNC */
	int intrflush_sp (SCREEN*, WINDOW*, bool); /* implemented:SP_FUNC */
	bool isendwin_sp (SCREEN*); /* implemented:SP_FUNC */
	const(char)* keyname_sp (SCREEN*, int); /* implemented:SP_FUNC */
	char killchar_sp (SCREEN*); /* implemented:SP_FUNC */
	char* longname_sp (SCREEN*); /* implemented:SP_FUNC */
	int mvcur_sp (SCREEN*, int, int, int, int); /* implemented:SP_FUNC */
	int napms_sp (SCREEN*, int); /* implemented:SP_FUNC */
	WINDOW* newpad_sp (SCREEN*, int, int); /* implemented:SP_FUNC */
	SCREEN* newterm_sp (SCREEN*, const(char)*, FILE*, FILE*); /* implemented:SP_FUNC */
	WINDOW* newwin_sp (SCREEN*, int, int, int, int); /* implemented:SP_FUNC */
	int nl_sp (SCREEN*); /* implemented:SP_FUNC */
	int nocbreak_sp (SCREEN*); /* implemented:SP_FUNC */
	int noecho_sp (SCREEN*); /* implemented:SP_FUNC */
	int nonl_sp (SCREEN*); /* implemented:SP_FUNC */
	void noqiflush_sp (SCREEN*); /* implemented:SP_FUNC */
	int noraw_sp (SCREEN*); /* implemented:SP_FUNC */
	int pair_content_sp (SCREEN*, short, short*, short*); /* implemented:SP_FUNC */
	void qiflush_sp (SCREEN*); /* implemented:SP_FUNC */
	int raw_sp (SCREEN*); /* implemented:SP_FUNC */
	int reset_prog_mode_sp (SCREEN*); /* implemented:SP_FUNC */
	int reset_shell_mode_sp (SCREEN*); /* implemented:SP_FUNC */
	int resetty_sp (SCREEN*); /* implemented:SP_FUNC */
	int ripoffline_sp (SCREEN*, int, int function (WINDOW*, int)); /* implemented:SP_FUNC */
	int savetty_sp (SCREEN*); /* implemented:SP_FUNC */
	int scr_init_sp (SCREEN*, const(char)*); /* implemented:SP_FUNC */
	int scr_restore_sp (SCREEN*, const(char)*); /* implemented:SP_FUNC */
	int scr_set_sp (SCREEN*, const(char)*); /* implemented:SP_FUNC */
	int slk_attroff_sp (SCREEN*, const chtype); /* implemented:SP_FUNC */
	int slk_attron_sp (SCREEN*, const chtype); /* implemented:SP_FUNC */
	int slk_attrset_sp (SCREEN*, const chtype); /* implemented:SP_FUNC */
	attr_t slk_attr_sp (SCREEN*); /* implemented:SP_FUNC */
	int slk_attr_set_sp (SCREEN*, const attr_t, short, void*); /* implemented:SP_FUNC */
	int slk_clear_sp (SCREEN*); /* implemented:SP_FUNC */
	int slk_color_sp (SCREEN*, short); /* implemented:SP_FUNC */
	int slk_init_sp (SCREEN*, int); /* implemented:SP_FUNC */
	char* slk_label_sp (SCREEN*, int); /* implemented:SP_FUNC */
	int slk_noutrefresh_sp (SCREEN*); /* implemented:SP_FUNC */
	int slk_refresh_sp (SCREEN*); /* implemented:SP_FUNC */
	int slk_restore_sp (SCREEN*); /* implemented:SP_FUNC */
	int slk_set_sp (SCREEN*, int, const(char)*, int); /* implemented:SP_FUNC */
	int slk_touch_sp (SCREEN*); /* implemented:SP_FUNC */
	int start_color_sp (SCREEN*); /* implemented:SP_FUNC */
	chtype termattrs_sp (SCREEN*); /* implemented:SP_FUNC */
	char* termname_sp (SCREEN*); /* implemented:SP_FUNC */
	int typeahead_sp (SCREEN*, int); /* implemented:SP_FUNC */
	int ungetch_sp (SCREEN*, int); /* implemented:SP_FUNC */
	void use_env_sp (SCREEN*, bool); /* implemented:SP_FUNC */
	void use_tioctl_sp (SCREEN*, bool); /* implemented:SP_FUNC */
	int vidattr_sp (SCREEN*, chtype); /* implemented:SP_FUNC */
	int vidputs_sp (SCREEN*, chtype, NCURSES_OUTC_sp); /* implemented:SP_FUNC */

	char* keybound_sp (SCREEN*, int, int); /* implemented:EXT_SP_FUNC */
	int alloc_pair_sp (SCREEN*, int, int); /* implemented:EXT_SP_FUNC */
	int assume_default_colors_sp (SCREEN*, int, int); /* implemented:EXT_SP_FUNC */
	int define_key_sp (SCREEN*, const(char)*, int); /* implemented:EXT_SP_FUNC */
	int extended_color_content_sp (SCREEN*, int, int*, int*, int*); /* implemented:EXT_SP_FUNC */
	int extended_pair_content_sp (SCREEN*, int, int*, int*); /* implemented:EXT_SP_FUNC */
	int extended_slk_color_sp (SCREEN*, int); /* implemented:EXT_SP_FUNC */
	int get_escdelay_sp (SCREEN*); /* implemented:EXT_SP_FUNC */
	int find_pair_sp (SCREEN*, int, int); /* implemented:EXT_SP_FUNC */
	int free_pair_sp (SCREEN*, int); /* implemented:EXT_SP_FUNC */
	int init_extended_color_sp (SCREEN*, int, int, int, int); /* implemented:EXT_SP_FUNC */
	int init_extended_pair_sp (SCREEN*, int, int, int); /* implemented:EXT_SP_FUNC */
	bool is_term_resized_sp (SCREEN*, int, int); /* implemented:EXT_SP_FUNC */
	int key_defined_sp (SCREEN*, const(char)*); /* implemented:EXT_SP_FUNC */
	int keyok_sp (SCREEN*, int, bool); /* implemented:EXT_SP_FUNC */
	void nofilter_sp (SCREEN*); /* implemented:EXT_SP_FUNC */
	void reset_color_pairs_sp (SCREEN*); /* implemented:EXT_SP_FUNC */
	int resize_term_sp (SCREEN*, int, int); /* implemented:EXT_SP_FUNC */
	int resizeterm_sp (SCREEN*, int, int); /* implemented:EXT_SP_FUNC */
	int set_escdelay_sp (SCREEN*, int); /* implemented:EXT_SP_FUNC */
	int set_tabsize_sp (SCREEN*, int); /* implemented:EXT_SP_FUNC */
	int use_default_colors_sp (SCREEN*); /* implemented:EXT_SP_FUNC */
	int use_legacy_coding_sp (SCREEN*, int); /* implemented:EXT_SP_FUNC */

	bool has_mouse ();
	int getmouse (MEVENT*);
	int ungetmouse (MEVENT*);
	mmask_t mousemask (mmask_t, mmask_t*);
	bool wenclose (const(WINDOW)*, int, int);
	int mouseinterval (int);
	bool wmouse_trafo (const(WINDOW)*, int*, int*, bool);
	bool mouse_trafo (int*, int*, bool);

	bool has_mouse_sp (SCREEN*);
	int getmouse_sp (SCREEN*, MEVENT*);
	int ungetmouse_sp (SCREEN*, MEVENT*);
	mmask_t mousemask_sp (SCREEN*, mmask_t, mmask_t*);
	int mouseinterval_sp (SCREEN*, int);

	/* other non-XSI functions */

	int mcprint (char*, int); /* direct data to printer */
	int has_key (int); /* do we have given key? */

	int has_key_sp (SCREEN*, int); /* do we have given key? */
	int mcprint_sp (SCREEN*, char*, int); /* direct data to printer */

	/* Debugging : use with libncurses_g.a */

	void _tracef (const(char)*, ...);
	char* _traceattr (attr_t);
	char* _traceattr2 (int, chtype);
	char* _tracechar (int);
	char* _tracechtype (chtype);
	char* _tracechtype2 (int, chtype);

	void trace (const uint);

	/* NCURSES_NOMACROS */

	/*
	 * Public variables.
	 *
	 * Notes:
	 *	a. ESCDELAY was an undocumented feature under AIX curses.
	 *	   It gives the ESC expire time in milliseconds.
	 *	b. ttytype is needed for backward compatibility
	 */

	extern __gshared WINDOW* curscr;
	extern __gshared WINDOW* newscr;
	extern __gshared WINDOW* stdscr;
	extern __gshared char[] ttytype;
	extern __gshared int COLORS;
	extern __gshared int COLOR_PAIRS;
	extern __gshared int COLS;
	extern __gshared int ESCDELAY;
	extern __gshared int LINES;
	extern __gshared int TABSIZE;
}