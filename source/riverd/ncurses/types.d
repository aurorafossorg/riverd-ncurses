/*
									__
								   / _|
  __ _ _   _ _ __ ___  _ __ __ _  | |_ ___  ___ ___
 / _` | | | | '__/ _ \| '__/ _` | |  _/ _ \/ __/ __|
| (_| | |_| | | | (_) | | | (_| | | || (_) \__ \__ \
 \__,_|\__,_|_|  \___/|_|  \__,_| |_| \___/|___/___/

Copyright (C) 1992,1995 Zeyd M. Ben-Halim <zmbenhal@netcom.com>
Copyright (C) 1992,1995 Eric S. Raymond <esr@snark.thyrsus.com>
Copyright (C) 1998-2016,2017 Free Software Foundation, Inc.
Copyright (C) 2018-2019 Aurora Free Open Source Software.
Copyright (C) 2018-2019 Luís Ferreira <luis@aurorafoss.org>
Copyright (C) 1996-on Thomas E. Dickey

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

module riverd.ncurses.types;

import core.stdc.stdint;
import core.stdc.config;
import core.stdc.stdio;
import core.stdc.stdarg;

import std.traits;


/* octal implementation */
private T octal(T)(const string num)
{
	T value = 0;

	foreach (const char s; num)
	{
		if (s < '0' || s > '7')
			continue;

		value *= 8;
		value += s - '0';
	}

	return value;
}

extern(C):

enum CURSES = 1;
enum CURSES_H = 1;

/* These are defined only in curses.h, and are used for conditional compiles */
enum NCURSES_VERSION_MAJOR = 6;
enum NCURSES_VERSION_MINOR = 1;
enum NCURSES_VERSION_PATCH = 20180127;

/* This is defined in more than one ncurses header, for identification */

enum NCURSES_VERSION = "6.1";

/*
 * Identify the mouse encoding version.
 */
enum NCURSES_MOUSE_VERSION = 2;

/*
 * Definitions to facilitate DLL's.
 */

/*
 * User-definable tweak to disable the include of <stdbool.h>.
 */

enum NCURSES_ENABLE_STDBOOL_H = 1;

/*
 * NCURSES_ATTR_T is used to quiet compiler warnings when building ncurses
 * configured using --disable-macros.
 */

alias NCURSES_ATTR_T = int;

/*
 * Expands to 'const' if ncurses is configured using --enable-const.  Note that
 * doing so makes it incompatible with other implementations of X/Open Curses.
 */

/*
 * The standard type used for color values, and for color-pairs.  The latter
 * allows the curses library to enumerate the combinations of foreground and
 * background colors used by an application, and is normally the product of the
 * total foreground and background colors.
 *
 * X/Open uses "short" for both of these types, ultimately because they are
 * numbers from the SVr4 terminal database, which uses 16-bit signed values.
 */

alias NCURSES_COLOR_T = short;

alias NCURSES_PAIRS_T = short;

/*
 * Definitions used to make WINDOW and similar structs opaque.
 */

enum NCURSES_OPAQUE = 0;
enum NCURSES_OPAQUE_FORM = 0;
enum NCURSES_OPAQUE_MENU = 0;
enum NCURSES_OPAQUE_PANEL = 0;

/*
 * Definition used to optionally suppress wattr* macros to help with the
 * transition from ncurses5 to ncurses6 by allowing the header files to
 * be shared across development packages for ncursesw in both ABIs.
 */

enum NCURSES_WATTR_MACROS = 1;

/*
 * The reentrant code relies on the opaque setting, but adds features.
 */

enum NCURSES_REENTRANT = 0;

/*
 * Control whether bindings for interop support are added.
 */

enum NCURSES_INTEROP_FUNCS = 1;

/*
 * The internal type used for window dimensions.
 */

alias NCURSES_SIZE_T = short;

/*
 * Control whether tparm() supports varargs or fixed-parameter list.
 */

enum NCURSES_TPARM_VARARGS = 1;

/*
 * Control type used for tparm's arguments.  While X/Open equates long and
 * char* values, this is not always workable for 64-bit platforms.
 */

alias NCURSES_TPARM_ARG = intptr_t;

/*
 * Control whether ncurses uses wcwidth() for checking width of line-drawing
 * characters.
 */

enum NCURSES_WCWIDTH_GRAPHICS = 1;

enum CCHARW_MAX = 5;

struct cchar_t
{
	attr_t attr;
	wchar[CCHARW_MAX] chars;
	int ext_color; /* color pair, must be more than 16-bits */
}

/*
 * NCURSES_CH_T is used in building the library, but not used otherwise in
 * this header file, since that would make the normal/wide-character versions
 * of the header incompatible.
 */
alias NCURSES_CH_T = cchar_t;

alias chtype = uint;
alias mmask_t = uint;

/*
 * We need FILE, etc.  Include this before checking any feature symbols.
 */

/*
 * With XPG4, you must define _XOPEN_SOURCE_EXTENDED, it is redundant (or
 * conflicting) when _XOPEN_SOURCE is 500 or greater.  If NCURSES_WIDECHAR is
 * not already defined, e.g., if the platform relies upon nonstandard feature
 * test macros, define it at this point if the standard feature test macros
 * indicate that it should be defined.
 */

enum NCURSES_WIDECHAR = 0;

/* NCURSES_WIDECHAR */

/* we need va_list */
/* we want wchar_t */

/* X/Open and SVr4 specify that curses implements 'bool'.  However, C++ may also
 * implement it.  If so, we must use the C++ compiler's type to avoid conflict
 * with other interfaces.
 *
 * A further complication is that <stdbool.h> may declare 'bool' to be a
 * different type, such as an enum which is not necessarily compatible with
 * C++.  If we have <stdbool.h>, make 'bool' a macro, so users may #undef it.
 * Otherwise, let it remain a typedef to avoid conflicts with other #define's.
 * In either case, make a typedef for NCURSES_BOOL which can be used if needed
 * from either C or C++.
 */

enum TRUE = 1;
enum FALSE = 0;

alias NCURSES_BOOL = bool;

/* there is no predefined bool - use our own */

/* !__cplusplus, etc. */

extern (D) auto NCURSES_CAST(type, T)(auto ref T value)
{
	return type(value);
}

extern (D) auto NCURSES_OK_ADDR(T)(auto ref T p)
{
	return 0 != NCURSES_CAST!(const(void)*)(p);
}

/*
 * X/Open attributes.  In the ncurses implementation, they are identical to the
 * A_ attributes.
 */
enum WA_ATTRIBUTES = A_ATTRIBUTES;
enum WA_NORMAL = A_NORMAL;
enum WA_STANDOUT = A_STANDOUT;
enum WA_UNDERLINE = A_UNDERLINE;
enum WA_REVERSE = A_REVERSE;
enum WA_BLINK = A_BLINK;
enum WA_DIM = A_DIM;
enum WA_BOLD = A_BOLD;
enum WA_ALTCHARSET = A_ALTCHARSET;
enum WA_INVIS = A_INVIS;
enum WA_PROTECT = A_PROTECT;
enum WA_HORIZONTAL = A_HORIZONTAL;
enum WA_LEFT = A_LEFT;
enum WA_LOW = A_LOW;
enum WA_RIGHT = A_RIGHT;
enum WA_TOP = A_TOP;
enum WA_VERTICAL = A_VERTICAL;

enum WA_ITALIC = A_ITALIC; /* ncurses extension */

/* colors */
enum COLOR_BLACK = 0;
enum COLOR_RED = 1;
enum COLOR_GREEN = 2;
enum COLOR_YELLOW = 3;
enum COLOR_BLUE = 4;
enum COLOR_MAGENTA = 5;
enum COLOR_CYAN = 6;
enum COLOR_WHITE = 7;

/* line graphics */

extern __gshared chtype[256] acs_map;


/* acs symbols */

/* VT100 symbols begin here */

@property auto ACS_ULCORNER()()
{   return acs_map[cast(ubyte)'l']; }
@property auto ACS_LLCORNER()()
{   return acs_map[cast(ubyte)'m']; }
@property auto ACS_URCORNER()()
{   return acs_map[cast(ubyte)'k']; }
@property auto ACS_LRCORNER()()
{   return acs_map[cast(ubyte)'j']; }
@property auto ACS_LTEE()()
{   return acs_map[cast(ubyte)'t']; }
@property auto ACS_RTEE()()
{   return acs_map[cast(ubyte)'u']; }
@property auto ACS_BTEE()()
{   return acs_map[cast(ubyte)'v']; }
@property auto ACS_TTEE()()
{   return acs_map[cast(ubyte)'w']; }
@property auto ACS_HLINE()()
{   return acs_map[cast(ubyte)'q']; }
@property auto ACS_VLINE()()
{   return acs_map[cast(ubyte)'x']; }
@property auto ACS_PLUS()()
{   return acs_map[cast(ubyte)'n']; }
@property auto ACS_S1()()
{   return acs_map[cast(ubyte)'o']; }
@property auto ACS_S9()()
{   return acs_map[cast(ubyte)'s']; }
@property auto ACS_DIAMOND()()
{   return acs_map[cast(ubyte)'`']; }
@property auto ACS_CKBOARD()()
{   return acs_map[cast(ubyte)'a']; }
@property auto ACS_DEGREE()()
{   return acs_map[cast(ubyte)'f']; }
@property auto ACS_PLMINUS()()
{   return acs_map[cast(ubyte)'g']; }
@property auto ACS_BULLET()()
{   return acs_map[cast(ubyte)'~']; }

/* Teletype 5410v1 symbols begin here */
@property auto ACS_LARROW()()
{   return acs_map[cast(ubyte)',']; }
@property auto ACS_RARROW()()
{   return  acs_map[cast(ubyte)'+'];}
@property auto ACS_DARROW()()
{   return acs_map[cast(ubyte)'.']; }
@property auto ACS_UARROW()()
{   return acs_map[cast(ubyte)'-']; }
@property auto ACS_BOARD()()
{   return acs_map[cast(ubyte)'h']; }
@property auto ACS_LANTERN()()
{   return acs_map[cast(ubyte)'i']; }
@property auto ACS_BLOCK()()
{   return acs_map[cast(ubyte)'0']; }

/*
 * These aren't documented, but a lot of System Vs have them anyway
 * (you can spot pprryyzz{{||}} in a lot of AT&T terminfo strings).
 * The ACS_names may not match AT&T's, our source didn't know them.
 */
@property auto ACS_S3()()
{   return acs_map[cast(ubyte)'p']; }
@property auto ACS_S7()()
{   return acs_map[cast(ubyte)'r']; }
@property auto ACS_LEQUAL()()
{   return acs_map[cast(ubyte)'y']; }
@property auto ACS_GEQUAL()()
{   return acs_map[cast(ubyte)'z']; }
@property auto ACS_PI()()
{   return acs_map[cast(ubyte)'{']; }
@property auto ACS_NEQUAL()()
{   return acs_map[cast(ubyte)'|']; }
@property auto ACS_STERLING()()
{   return acs_map[cast(ubyte)'}']; }

/*
 * Line drawing ACS names are of the form ACS_trbl, where t is the top, r
 * is the right, b is the bottom, and l is the left.  t, r, b, and l might
 * be B (blank), S (single), D (double), or T (thick).  The subset defined
 * here only uses B and S.
 */
@property auto ACS_BSSB()()
{   return ACS_ULCORNER();  }
@property auto ACS_SSBB()()
{   return ACS_LLCORNER();  }
@property auto ACS_BBSS()()
{   return ACS_URCORNER();  }
@property auto ACS_SBBS()()
{   return ACS_LRCORNER();  }
@property auto ACS_SBSS()()
{   return ACS_RTEE();      }
@property auto ACS_SSSB()()
{   return ACS_LTEE();      }
@property auto ACS_SSBS()()
{   return ACS_BTEE();      }
@property auto ACS_BSSS()()
{   return ACS_TTEE();      }
@property auto ACS_BSBS()()
{   return ACS_HLINE();     }
@property auto ACS_SBSB()()
{   return ACS_VLINE();     }
@property auto ACS_SSSS()()
{ return ACS_PLUS(); }


/** error codes */
enum {
	ERR = -1, /** error */
	OK = 0, /** ok */
}


/** values for the _flags member */
enum {
	_SUBWIN = 0x01, /** is this a sub-window? */
	_ENDLINE = 0x02, /** is the window flush right? */
	_FULLWIN = 0x04, /** is the window full-screen? */
	_SCROLLWIN = 0x08, /** bottom edge is at screen bottom? */
	_ISPAD = 0x10, /** is this window a pad? */
	_HASMOVED = 0x20, /** has cursor moved since last refresh? */
	_WRAPPED = 0x40, /** cursor was just wrappped */
}


/**
 * this value is used in the firstchar and lastchar fields to mark
 * unchanged lines
 */
enum _NOCHANGE = -1;


/**
 * this value is used in the oldindex field to mark lines created by insertions
 * and scrolls.
 */
enum _NEWINDEX = -1;

struct screen;
alias SCREEN = screen;
alias WINDOW = _win_st;

alias attr_t = uint; /* ...must be at least as wide as chtype */

/* libutf8.h defines it w/o undefining first */

/* ...to get mbstate_t, etc. */

/*
 * cchar_t stores an array of CCHARW_MAX wide characters.  The first is
 * normally a spacing character.  The others are non-spacing.  If those
 * (spacing and nonspacing) do not fill the array, a null L'\0' follows.
 * Otherwise, a null is assumed to follow when extracting via getcchar().
 */

/* color pair, must be more than 16-bits */

/* NCURSES_WIDECHAR */

struct ldat;

struct _win_st
{
	short _cury;
	short _curx; /* current cursor position */

	/* window location and size */
	short _maxy;
	short _maxx; /* maximums of x and y, NOT window size */
	short _begy;
	short _begx; /* screen coords of upper-left-hand corner */

	short _flags; /* window state flags */

	/* attribute tracking */
	attr_t _attrs; /* current attribute for non-space character */
	chtype _bkgd; /* current background char/attribute pair */

	/* option values set by user */
	bool _notimeout; /* no time out on function-key entry? */
	bool _clear; /* consider all data in the window invalid? */
	bool _leaveok; /* OK to not reset cursor on exit? */
	bool _scroll; /* OK to scroll this window? */
	bool _idlok; /* OK to use insert/delete line? */
	bool _idcok; /* OK to use insert/delete char? */
	bool _immed; /* window in immed mode? (not yet used) */
	bool _sync; /* window in sync mode? */
	bool _use_keypad; /* process function keys into KEY_ symbols? */
	int _delay; /* 0 = nodelay, <0 = blocking, >0 = delay */

	ldat* _line; /* the actual line data */

	/* global screen state */
	short _regtop; /* top line of scrolling region */
	short _regbottom; /* bottom line of scrolling region */

	/* these are used only if this is a sub-window */
	int _parx; /* x coordinate of this window in parent */
	int _pary; /* y coordinate of this window in parent */
	WINDOW* _parent; /* pointer to parent if a sub-window */

	/* these are used only if this is a pad */
	struct pdat
	{
		short _pad_y;
		short _pad_x;
		short _pad_top;
		short _pad_left;
		short _pad_bottom;
		short _pad_right;
	}

	pdat _pad;

	short _yoffset; /* real begy is _begy + _yoffset */

	/* current background char/attribute pair */

	/* current color-pair for non-space character */
}

/*
 * Curses uses a helper function.  Define our type for this to simplify
 * extending it for the sp-funcs feature.
 */
alias NCURSES_OUTC = int function (int);

enum NCURSES_EXT_FUNCS = 20180127;
alias NCURSES_WINDOW_CB = int function (WINDOW*, void*);
alias NCURSES_SCREEN_CB = int function (SCREEN*, void*);

/*
 * Extra extension-functions, which pass a SCREEN pointer rather than using
 * a global variable SP.
 */

enum NCURSES_SP_FUNCS = 20180127;


alias NCURSES_OUTC_sp = int function (SCREEN*, int);

/* attributes */

enum NCURSES_ATTR_SHIFT = 8;

extern (D) auto NCURSES_BITS(T0, T1)(auto ref T0 mask, auto ref T1 shift)
{
	return NCURSES_CAST!chtype(mask) << (shift + NCURSES_ATTR_SHIFT);
}

enum A_NORMAL = 1U - 1U;
enum A_ATTRIBUTES = NCURSES_BITS(~(1U - 1U), 0);
enum A_CHARTEXT = NCURSES_BITS(1U, 0) - 1U;
enum A_COLOR = NCURSES_BITS(((1U) << 8) - 1U, 0);
enum A_STANDOUT = NCURSES_BITS(1U, 8);
enum A_UNDERLINE = NCURSES_BITS(1U, 9);
enum A_REVERSE = NCURSES_BITS(1U, 10);
enum A_BLINK = NCURSES_BITS(1U, 11);
enum A_DIM = NCURSES_BITS(1U, 12);
enum A_BOLD = NCURSES_BITS(1U, 13);
enum A_ALTCHARSET = NCURSES_BITS(1U, 14);
enum A_INVIS = NCURSES_BITS(1U, 15);
enum A_PROTECT = NCURSES_BITS(1U, 16);
enum A_HORIZONTAL = NCURSES_BITS(1U, 17);
enum A_LEFT = NCURSES_BITS(1U, 18);
enum A_LOW = NCURSES_BITS(1U, 19);
enum A_RIGHT = NCURSES_BITS(1U, 20);
enum A_TOP = NCURSES_BITS(1U, 21);
enum A_VERTICAL = NCURSES_BITS(1U, 22);

enum A_ITALIC = NCURSES_BITS(1U, 23); /* ncurses extension */

/* It seems older SYSV curses versions define these */
extern (D) auto getcurx(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._curx : ERR;
}

extern (D) auto getcury(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._cury : ERR;
}

extern (D) auto getbegx(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._begx : ERR;
}

extern (D) auto getbegy(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._begy : ERR;
}

extern (D) auto getmaxx(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? (win._maxx + 1) : ERR;
}

extern (D) auto getmaxy(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? (win._maxy + 1) : ERR;
}

extern (D) auto getparx(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._parx : ERR;
}

extern (D) auto getpary(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._pary : ERR;
}

/*
 * These apply to the first 256 color pairs.
 */
extern (D) auto COLOR_PAIR(T)(auto ref T n)
{
	return NCURSES_BITS(n, 0) & A_COLOR;
}

extern (D) auto PAIR_NUMBER(T)(auto ref T a)
{
	return NCURSES_CAST!int((NCURSES_CAST!c_ulong(a) & A_COLOR) >> NCURSES_ATTR_SHIFT);
}

/*
 * Some wide-character functions can be implemented without the extensions.
 */
extern (D) auto getbkgd(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? (win._bkgd) : 0;
}

/* !(NCURSES_WIDECHAR && NCURSES_EXE_COLORS) */
/* (NCURSES_WIDECHAR && NCURSES_EXE_COLORS) */
/* NCURSES_WATTR_MACROS */
/* NCURSES_OPAQUE */

/*
 * X/Open curses deprecates SVr4 vwprintw/vwscanw, which are supposed to use
 * varargs.h.  It adds new calls vw_printw/vw_scanw, which are supposed to
 * use POSIX stdarg.h.  The ncurses versions of vwprintw/vwscanw already
 * use stdarg.h, so...
 */

/*
 * Export fallback function for use in C++ binding.
 */

/*
 * These macros are extensions - not in X/Open Curses.
 */

extern (D) auto is_cleared(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._clear : FALSE;
}

extern (D) auto is_idcok(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._idcok : FALSE;
}

extern (D) auto is_idlok(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._idlok : FALSE;
}

extern (D) auto is_immedok(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._immed : FALSE;
}

extern (D) auto is_keypad(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._use_keypad : FALSE;
}

extern (D) auto is_leaveok(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._leaveok : FALSE;
}

extern (D) auto is_nodelay(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? (win._delay == 0) : FALSE;
}

extern (D) auto is_notimeout(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._notimeout : FALSE;
}

extern (D) auto is_pad(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? (win._flags & _ISPAD) != 0 : FALSE;
}

extern (D) auto is_scrollok(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._scroll : FALSE;
}

extern (D) auto is_subwin(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? (win._flags & _SUBWIN) != 0 : FALSE;
}

extern (D) auto is_syncok(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._sync : FALSE;
}

extern (D) auto wgetdelay(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._delay : 0;
}

extern (D) auto wgetparent(T)(auto ref T win)
{
	return NCURSES_OK_ADDR(win) ? win._parent : 0;
}

/*
 * Pseudo-character tokens outside ASCII range.  The curses wgetch() function
 * will return any given one of these only if the corresponding k- capability
 * is defined in your terminal's terminfo entry.
 *
 * Some keys (KEY_A1, etc) are arranged like this:
 *	a1     up    a3
 *	left   b2    right
 *	c1     down  c3
 *
 * A few key codes do not depend upon the terminfo entry.
 */
enum KEY_CODE_YES = octal!int("400"); /* A wchar_t contains a key code */
enum KEY_MIN = octal!int("401"); /* Minimum curses key */
enum KEY_BREAK = octal!int("401"); /* Break key (unreliable) */
enum KEY_SRESET = octal!int("530"); /* Soft (partial) reset (unreliable) */
enum KEY_RESET = octal!int("531"); /* Reset or hard reset (unreliable) */
/*
 * These definitions were generated by ./MKkey_defs.sh ./Caps
 */
enum KEY_DOWN = octal!int("402"); /* down-arrow key */
enum KEY_UP = octal!int("403"); /* up-arrow key */
enum KEY_LEFT = octal!int("404"); /* left-arrow key */
enum KEY_RIGHT = octal!int("405"); /* right-arrow key */
enum KEY_HOME = octal!int("406"); /* home key */
enum KEY_BACKSPACE = octal!int("407"); /* backspace key */
enum KEY_F0 = octal!int("410"); /* Function keys.  Space for 64 */
extern (D) auto KEY_F(T)(auto ref T n)
{
	return KEY_F0 + n;
} /* Value of function key n */
enum KEY_DL = octal!int("510"); /* delete-line key */
enum KEY_IL = octal!int("511"); /* insert-line key */
enum KEY_DC = octal!int("512"); /* delete-character key */
enum KEY_IC = octal!int("513"); /* insert-character key */
enum KEY_EIC = octal!int("514"); /* sent by rmir or smir in insert mode */
enum KEY_CLEAR = octal!int("515"); /* clear-screen or erase key */
enum KEY_EOS = octal!int("516"); /* clear-to-end-of-screen key */
enum KEY_EOL = octal!int("517"); /* clear-to-end-of-line key */
enum KEY_SF = octal!int("520"); /* scroll-forward key */
enum KEY_SR = octal!int("521"); /* scroll-backward key */
enum KEY_NPAGE = octal!int("522"); /* next-page key */
enum KEY_PPAGE = octal!int("523"); /* previous-page key */
enum KEY_STAB = octal!int("524"); /* set-tab key */
enum KEY_CTAB = octal!int("525"); /* clear-tab key */
enum KEY_CATAB = octal!int("526"); /* clear-all-tabs key */
enum KEY_ENTER = octal!int("527"); /* enter/send key */
enum KEY_PRINT = octal!int("532"); /* print key */
enum KEY_LL = octal!int("533"); /* lower-left key (home down) */
enum KEY_A1 = octal!int("534"); /* upper left of keypad */
enum KEY_A3 = octal!int("535"); /* upper right of keypad */
enum KEY_B2 = octal!int("536"); /* center of keypad */
enum KEY_C1 = octal!int("537"); /* lower left of keypad */
enum KEY_C3 = octal!int("540"); /* lower right of keypad */
enum KEY_BTAB = octal!int("541"); /* back-tab key */
enum KEY_BEG = octal!int("542"); /* begin key */
enum KEY_CANCEL = octal!int("543"); /* cancel key */
enum KEY_CLOSE = octal!int("544"); /* close key */
enum KEY_COMMAND = octal!int("545"); /* command key */
enum KEY_COPY = octal!int("546"); /* copy key */
enum KEY_CREATE = octal!int("547"); /* create key */
enum KEY_END = octal!int("550"); /* end key */
enum KEY_EXIT = octal!int("551"); /* exit key */
enum KEY_FIND = octal!int("552"); /* find key */
enum KEY_HELP = octal!int("553"); /* help key */
enum KEY_MARK = octal!int("554"); /* mark key */
enum KEY_MESSAGE = octal!int("555"); /* message key */
enum KEY_MOVE = octal!int("556"); /* move key */
enum KEY_NEXT = octal!int("557"); /* next key */
enum KEY_OPEN = octal!int("560"); /* open key */
enum KEY_OPTIONS = octal!int("561"); /* options key */
enum KEY_PREVIOUS = octal!int("562"); /* previous key */
enum KEY_REDO = octal!int("563"); /* redo key */
enum KEY_REFERENCE = octal!int("564"); /* reference key */
enum KEY_REFRESH = octal!int("565"); /* refresh key */
enum KEY_REPLACE = octal!int("566"); /* replace key */
enum KEY_RESTART = octal!int("567"); /* restart key */
enum KEY_RESUME = octal!int("570"); /* resume key */
enum KEY_SAVE = octal!int("571"); /* save key */
enum KEY_SBEG = octal!int("572"); /* shifted begin key */
enum KEY_SCANCEL = octal!int("573"); /* shifted cancel key */
enum KEY_SCOMMAND = octal!int("574"); /* shifted command key */
enum KEY_SCOPY = octal!int("575"); /* shifted copy key */
enum KEY_SCREATE = octal!int("576"); /* shifted create key */
enum KEY_SDC = octal!int("577"); /* shifted delete-character key */
enum KEY_SDL = octal!int("600"); /* shifted delete-line key */
enum KEY_SELECT = octal!int("601"); /* select key */
enum KEY_SEND = octal!int("602"); /* shifted end key */
enum KEY_SEOL = octal!int("603"); /* shifted clear-to-end-of-line key */
enum KEY_SEXIT = octal!int("604"); /* shifted exit key */
enum KEY_SFIND = octal!int("605"); /* shifted find key */
enum KEY_SHELP = octal!int("606"); /* shifted help key */
enum KEY_SHOME = octal!int("607"); /* shifted home key */
enum KEY_SIC = octal!int("610"); /* shifted insert-character key */
enum KEY_SLEFT = octal!int("611"); /* shifted left-arrow key */
enum KEY_SMESSAGE = octal!int("612"); /* shifted message key */
enum KEY_SMOVE = octal!int("613"); /* shifted move key */
enum KEY_SNEXT = octal!int("614"); /* shifted next key */
enum KEY_SOPTIONS = octal!int("615"); /* shifted options key */
enum KEY_SPREVIOUS = octal!int("616"); /* shifted previous key */
enum KEY_SPRINT = octal!int("617"); /* shifted print key */
enum KEY_SREDO = octal!int("620"); /* shifted redo key */
enum KEY_SREPLACE = octal!int("621"); /* shifted replace key */
enum KEY_SRIGHT = octal!int("622"); /* shifted right-arrow key */
enum KEY_SRSUME = octal!int("623"); /* shifted resume key */
enum KEY_SSAVE = octal!int("624"); /* shifted save key */
enum KEY_SSUSPEND = octal!int("625"); /* shifted suspend key */
enum KEY_SUNDO = octal!int("626"); /* shifted undo key */
enum KEY_SUSPEND = octal!int("627"); /* suspend key */
enum KEY_UNDO = octal!int("630"); /* undo key */
enum KEY_MOUSE = octal!int("631"); /* Mouse event has occurred */
enum KEY_RESIZE = octal!int("632"); /* Terminal resize event */
enum KEY_EVENT = octal!int("633"); /* We were interrupted by an event */

enum KEY_MAX = octal!int("777"); /* Maximum key value is 0633 */
/* $Id: curses.wide,v 1.50 2017/03/26 16:05:21 tom Exp $ */
/*
 * vile:cmode:
 * This file is part of ncurses, designed to be appended after curses.h.in
 * (see that file for the relevant copyright).
 */
enum _XOPEN_CURSES = 1;

/* mouse interface */

extern (D) auto NCURSES_MOUSE_MASK(T0, T1)(auto ref T0 b, auto ref T1 m)
{
	return m << ((b - 1) * 5);
}

/* macros to extract single event-bits from masks */
extern (D) auto BUTTON_RELEASE(T0, T1)(auto ref T0 e, auto ref T1 x)
{
	return e & NCURSES_MOUSE_MASK(x, octal!int("1"));
}

extern (D) auto BUTTON_PRESS(T0, T1)(auto ref T0 e, auto ref T1 x)
{
	return e & NCURSES_MOUSE_MASK(x, octal!int("2"));
}

extern (D) auto BUTTON_CLICK(T0, T1)(auto ref T0 e, auto ref T1 x)
{
	return e & NCURSES_MOUSE_MASK(x, octal!int("4"));
}

extern (D) auto BUTTON_DOUBLE_CLICK(T0, T1)(auto ref T0 e, auto ref T1 x)
{
	return e & NCURSES_MOUSE_MASK(x, octal!int("10"));
}

extern (D) auto BUTTON_TRIPLE_CLICK(T0, T1)(auto ref T0 e, auto ref T1 x)
{
	return e & NCURSES_MOUSE_MASK(x, octal!int("20"));
}

extern (D) auto BUTTON_RESERVED_EVENT(T0, T1)(auto ref T0 e, auto ref T1 x)
{
	return e & NCURSES_MOUSE_MASK(x, octal!int("40"));
}

enum NCURSES_BUTTON_RELEASED = octal!int("1L");
enum NCURSES_BUTTON_PRESSED = octal!int("2L");
enum NCURSES_BUTTON_CLICKED = octal!int("4L");
enum NCURSES_DOUBLE_CLICKED = octal!int("10L");
enum NCURSES_TRIPLE_CLICKED = octal!int("20L");
enum NCURSES_RESERVED_EVENT = octal!int("40L");

/* event masks */
enum BUTTON1_RELEASED = NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_RELEASED);
enum BUTTON1_PRESSED = NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_PRESSED);
enum BUTTON1_CLICKED = NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_CLICKED);
enum BUTTON1_DOUBLE_CLICKED = NCURSES_MOUSE_MASK(1, NCURSES_DOUBLE_CLICKED);
enum BUTTON1_TRIPLE_CLICKED = NCURSES_MOUSE_MASK(1, NCURSES_TRIPLE_CLICKED);

enum BUTTON2_RELEASED = NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_RELEASED);
enum BUTTON2_PRESSED = NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_PRESSED);
enum BUTTON2_CLICKED = NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_CLICKED);
enum BUTTON2_DOUBLE_CLICKED = NCURSES_MOUSE_MASK(2, NCURSES_DOUBLE_CLICKED);
enum BUTTON2_TRIPLE_CLICKED = NCURSES_MOUSE_MASK(2, NCURSES_TRIPLE_CLICKED);

enum BUTTON3_RELEASED = NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_RELEASED);
enum BUTTON3_PRESSED = NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_PRESSED);
enum BUTTON3_CLICKED = NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_CLICKED);
enum BUTTON3_DOUBLE_CLICKED = NCURSES_MOUSE_MASK(3, NCURSES_DOUBLE_CLICKED);
enum BUTTON3_TRIPLE_CLICKED = NCURSES_MOUSE_MASK(3, NCURSES_TRIPLE_CLICKED);

enum BUTTON4_RELEASED = NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_RELEASED);
enum BUTTON4_PRESSED = NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_PRESSED);
enum BUTTON4_CLICKED = NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_CLICKED);
enum BUTTON4_DOUBLE_CLICKED = NCURSES_MOUSE_MASK(4, NCURSES_DOUBLE_CLICKED);
enum BUTTON4_TRIPLE_CLICKED = NCURSES_MOUSE_MASK(4, NCURSES_TRIPLE_CLICKED);

/*
 * In 32 bits the version-1 scheme does not provide enough space for a 5th
 * button, unless we choose to change the ABI by omitting the reserved-events.
 */

enum BUTTON5_RELEASED = NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_RELEASED);
enum BUTTON5_PRESSED = NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_PRESSED);
enum BUTTON5_CLICKED = NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_CLICKED);
enum BUTTON5_DOUBLE_CLICKED = NCURSES_MOUSE_MASK(5, NCURSES_DOUBLE_CLICKED);
enum BUTTON5_TRIPLE_CLICKED = NCURSES_MOUSE_MASK(5, NCURSES_TRIPLE_CLICKED);

enum BUTTON_CTRL = NCURSES_MOUSE_MASK(6, octal!int("1L"));
enum BUTTON_SHIFT = NCURSES_MOUSE_MASK(6, octal!int("2L"));
enum BUTTON_ALT = NCURSES_MOUSE_MASK(6, octal!int("4L"));
enum REPORT_MOUSE_POSITION = NCURSES_MOUSE_MASK(6, octal!int("10L"));

enum ALL_MOUSE_EVENTS = REPORT_MOUSE_POSITION - 1;

struct MEVENT
{
	short id; /* ID to distinguish multiple devices */
	int x;
	int y;
	int z; /* event coordinates (character-cell) */
	mmask_t bstate; /* button state bits */
}

/** trace masks */
enum {
	TRACE_DISABLE = 0x0000, /** turn off tracing */
	TRACE_TIMES = 0x0001, /** trace user and system times of updates */
	TRACE_TPUTS = 0x0002, /** trace tputs calls */
	TRACE_UPDATE = 0x0004, /** trace update actions, old & new screens */
	TRACE_MOVE = 0x0008, /** trace cursor moves and scrolls */
	TRACE_CHARPUT = 0x0010, /** trace all character outputs */
	TRACE_ORDINARY = 0x001F, /** trace all update actions */
	TRACE_CALLS = 0x0020, /** trace all curses calls */
	TRACE_VIRTPUT = 0x0040, /** trace virtual character puts */
	TRACE_IEVENT = 0x0080, /** trace low-level input processing */
	TRACE_BITS = 0x0100, /** trace state of TTY control bits */
	TRACE_ICALLS = 0x0200, /** trace internal/nested calls */
	TRACE_CCALLS = 0x0400, /** trace per-character calls */
	TRACE_DATABASE = 0x0800, /** trace read/write of terminfo/termcap data */
	TRACE_ATTRS = 0x1000, /** trace attribute updates */

	TRACE_SHIFT = 13, /** number of bits in the trace masks */
	TRACE_MAXIMUM = (1 << TRACE_SHIFT) - 1, /** maximum trace level */
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

extern (D) auto wattron(T0, T1)(auto ref T0 win, auto ref T1 at)
{
	return wattr_on(win, NCURSES_CAST!attr_t(at), NULL);
}

extern (D) auto wattroff(T0, T1)(auto ref T0 win, auto ref T1 at)
{
	return wattr_off(win, NCURSES_CAST!attr_t(at), NULL);
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

extern(C) @nogc nothrow {
	alias da_initscr = WINDOW* function();
	alias da_longname = char* function();
	alias da_newpad = WINDOW* function(int, int);
	alias da_newterm = SCREEN* function(const(char)*, FILE*, FILE*);
	alias da_newwin = WINDOW* function(int, int, int, int);
	alias da_set_term = SCREEN* function(SCREEN*);
	alias da_slk_label = char* function(int);
	alias da_subpad = WINDOW* function(WINDOW*, int, int, int, int);
	alias da_subwin = WINDOW* function(WINDOW*, int, int, int, int);
	alias da_termname = char* function();
	alias da_tigetstr = char* function(const(char)*);
	alias da_tparm = char* function(const(char)*, ...);
	alias da_tiparm = char* function(const(char)*, ...);
	alias da_keybound = char* function(int, int);
	alias da_wgetparent = WINDOW* function(const(WINDOW)*);
	alias da_new_prescr = SCREEN* function();
	alias da_getwin_sp = WINDOW* function(SCREEN*, FILE*);
	alias da_longname_sp = char* function(SCREEN*);
	alias da_newpad_sp = WINDOW* function(SCREEN*, int, int);
	alias da_newterm_sp = SCREEN* function(SCREEN*, const(char)*, FILE*, FILE*);
	alias da_newwin_sp = WINDOW* function(SCREEN*, int, int, int, int);
	alias da_getwin = WINDOW* function(FILE*);
	alias da_derwin = WINDOW* function(WINDOW*, int, int, int, int);
	alias da_dupwin = WINDOW* function(WINDOW*);
	alias da_termname_sp = char* function(SCREEN*);
	alias da_slk_label_sp = char* function(SCREEN*, int);
	alias da_curses_version = const(char)* function();
	alias da_keyname_sp = const(char)* function(SCREEN*, int);
	alias da_keyname = const(char)* function(int);
	alias da_addch = int function(const chtype);
	alias da_addchnstr = int function(const(chtype)*, int);
	alias da_addchstr = int function(const(chtype)*);
	alias da_addnstr = int function(const(char)*, int);
	alias da_addstr = int function(const(char)*);
	alias da_attroff = int function(int);
	alias da_attron = int function(int);
	alias da_attrset = int function(int);
	alias da_attr_get = int function(attr_t*, short*, void*);
	alias da_attr_off = int function(attr_t, void*);
	alias da_attr_on = int function(attr_t, void*);
	alias da_attr_set = int function(attr_t, short, void*);
	alias da_baudrate = int function();
	alias da_beep = int function();
	alias da_bkgd = int function(chtype);
	alias da_bkgdset = void function(chtype);
	alias da_border = int function(chtype, chtype, chtype, chtype, chtype, chtype, chtype, chtype);
	alias da_box = int function(WINDOW*, chtype, chtype);
	alias da_can_change_color = bool function();
	alias da_cbreak = int function();
	alias da_chgat = int function(int, attr_t, short, const(void)*);
	alias da_clear = int function();
	alias da_clearok = int function(WINDOW*, bool);
	alias da_clrtobot = int function();
	alias da_clrtoeol = int function();
	alias da_color_content = int function(short, short*, short*, short*);
	alias da_color_set = int function(short, void*);
	alias da_COLOR_PAIR = int function(int);
	alias da_copywin = int function(const(WINDOW)*, WINDOW*, int, int, int, int, int, int, int);
	alias da_curs_set = int function(int);
	alias da_def_prog_mode = int function();
	alias da_def_shell_mode = int function();
	alias da_delay_output = int function(int);
	alias da_delch = int function();
	alias da_delscreen = void function(SCREEN*);
	alias da_delwin = int function(WINDOW*);
	alias da_deleteln = int function();
	alias da_doupdate = int function();
	alias da_echo = int function();
	alias da_echochar = int function(const chtype);
	alias da_erase = int function();
	alias da_endwin = int function();
	alias da_erasechar = char function();
	alias da_filter = void function();
	alias da_flash = int function();
	alias da_flushinp = int function();
	alias da_getbkgd = chtype function(WINDOW*);
	alias da_getch = int function();
	alias da_getnstr = int function(char*, int);
	alias da_getstr = int function(char*);
	alias da_halfdelay = int function(int);
	alias da_has_colors = bool function();
	alias da_has_ic = bool function();
	alias da_has_il = bool function();
	alias da_hline = int function(chtype, int);
	alias da_idcok = void function(WINDOW*, bool);
	alias da_idlok = int function(WINDOW*, bool);
	alias da_immedok = void function(WINDOW*, bool);
	alias da_inch = chtype function();
	alias da_inchnstr = int function(chtype*, int);
	alias da_inchstr = int function(chtype*);
	alias da_init_color = int function(short, short, short, short);
	alias da_init_pair = int function(short, short, short);
	alias da_innstr = int function(char*, int);
	alias da_insch = int function(chtype);
	alias da_insdelln = int function(int);
	alias da_insertln = int function();
	alias da_insnstr = int function(const(char)*, int);
	alias da_insstr = int function(const(char)*);
	alias da_instr = int function(char*);
	alias da_intrflush = int function(WINDOW*, bool);
	alias da_isendwin = bool function();
	alias da_is_linetouched = bool function(WINDOW*, int);
	alias da_is_wintouched = bool function(WINDOW*);
	alias da_keypad = int function(WINDOW*, bool);
	alias da_killchar = char function();
	alias da_leaveok = int function(WINDOW*, bool);
	alias da_meta = int function(WINDOW*, bool);
	alias da_move = int function(int, int);
	alias da_mvaddch = int function(int, int, const chtype);
	alias da_mvaddchnstr = int function(int, int, const(chtype)*, int);
	alias da_mvaddchstr = int function(int, int, const(chtype)*);
	alias da_mvaddnstr = int function(int, int, const(char)*, int);
	alias da_mvaddstr = int function(int, int, const(char)*);
	alias da_mvchgat = int function(int, int, int, attr_t, short, const(void)*);
	alias da_mvcur = int function(int, int, int, int);
	alias da_mvdelch = int function(int, int);
	alias da_mvderwin = int function(WINDOW*, int, int);
	alias da_mvgetch = int function(int, int);
	alias da_mvgetnstr = int function(int, int, char*, int);
	alias da_mvgetstr = int function(int, int, char*);
	alias da_mvhline = int function(int, int, chtype, int);
	alias da_mvinch = chtype function(int, int);
	alias da_mvinchnstr = int function(int, int, chtype*, int);
	alias da_mvinchstr = int function(int, int, chtype*);
	alias da_mvinnstr = int function(int, int, char*, int);
	alias da_mvinsch = int function(int, int, chtype);
	alias da_mvinsnstr = int function(int, int, const(char)*, int);
	alias da_mvinsstr = int function(int, int, const(char)*);
	alias da_mvinstr = int function(int, int, char*);
	alias da_mvprintw = int function(int, int, const(char)*, ...);
	alias da_mvscanw = int function(int, int, const(char)*, ...);
	alias da_mvvline = int function(int, int, chtype, int);
	alias da_mvwaddch = int function(WINDOW*, int, int, const chtype);
	alias da_mvwaddchnstr = int function(WINDOW*, int, int, const(chtype)*, int);
	alias da_mvwaddchstr = int function(WINDOW*, int, int, const(chtype)*);
	alias da_mvwaddnstr = int function(WINDOW*, int, int, const(char)*, int);
	alias da_mvwaddstr = int function(WINDOW*, int, int, const(char)*);
	alias da_mvwchgat = int function(WINDOW*, int, int, int, attr_t, short, const(void)*);
	alias da_mvwdelch = int function(WINDOW*, int, int);
	alias da_mvwgetch = int function(WINDOW*, int, int);
	alias da_mvwgetnstr = int function(WINDOW*, int, int, char*, int);
	alias da_mvwgetstr = int function(WINDOW*, int, int, char*);
	alias da_mvwhline = int function(WINDOW*, int, int, chtype, int);
	alias da_mvwin = int function(WINDOW*, int, int);
	alias da_mvwinch = chtype function(WINDOW*, int, int);
	alias da_mvwinchnstr = int function(WINDOW*, int, int, chtype*, int);
	alias da_mvwinchstr = int function(WINDOW*, int, int, chtype*);
	alias da_mvwinnstr = int function(WINDOW*, int, int, char*, int);
	alias da_mvwinsch = int function(WINDOW*, int, int, chtype);
	alias da_mvwinsnstr = int function(WINDOW*, int, int, const(char)*, int);
	alias da_mvwinsstr = int function(WINDOW*, int, int, const(char)*);
	alias da_mvwinstr = int function(WINDOW*, int, int, char*);
	alias da_mvwprintw = int function(WINDOW*, int, int, const(char)*, ...);
	alias da_mvwscanw = int function(WINDOW*, int, int, const(char)*, ...);
	alias da_mvwvline = int function(WINDOW*, int, int, chtype, int);
	alias da_napms = int function(int);
	alias da_nl = int function();
	alias da_nocbreak = int function();
	alias da_nodelay = int function(WINDOW*, bool);
	alias da_noecho = int function();
	alias da_nonl = int function();
	alias da_noqiflush = void function();
	alias da_noraw = int function();
	alias da_notimeout = int function(WINDOW*, bool);
	alias da_overlay = int function(const(WINDOW)*, WINDOW*);
	alias da_overwrite = int function(const(WINDOW)*, WINDOW*);
	alias da_pair_content = int function(short, short*, short*);
	alias da_PAIR_NUMBER = int function(int);
	alias da_pechochar = int function(WINDOW*, const chtype);
	alias da_pnoutrefresh = int function(WINDOW*, int, int, int, int, int, int);
	alias da_prefresh = int function(WINDOW*, int, int, int, int, int, int);
	alias da_printw = int function(const(char)*, ...);
	alias da_putwin = int function(WINDOW*, FILE*);
	alias da_qiflush = void function();
	alias da_raw = int function();
	alias da_redrawwin = int function(WINDOW*);
	alias da_refresh = int function();
	alias da_resetty = int function();
	alias da_reset_prog_mode = int function();
	alias da_reset_shell_mode = int function();
	alias da_ripoffline = int function(int, int function (WINDOW*, int));
	alias da_savetty = int function();
	alias da_scanw = int function(const(char)*, ...);
	alias da_scr_dump = int function(const(char)*);
	alias da_scr_init = int function(const(char)*);
	alias da_scrl = int function(int);
	alias da_scroll = int function(WINDOW*);
	alias da_scrollok = int function(WINDOW*, bool);
	alias da_scr_restore = int function(const(char)*);
	alias da_scr_set = int function(const(char)*);
	alias da_setscrreg = int function(int, int);
	alias da_slk_attroff = int function(const chtype);
	alias da_slk_attr_off = int function(const attr_t, void*);
	alias da_slk_attron = int function(const chtype);
	alias da_slk_attr_on = int function(attr_t, void*);
	alias da_slk_attrset = int function(const chtype);
	alias da_slk_attr = attr_t function();
	alias da_slk_attr_set = int function(const attr_t, short, void*);
	alias da_slk_clear = int function();
	alias da_slk_color = int function(short);
	alias da_slk_init = int function(int);
	alias da_slk_noutrefresh = int function();
	alias da_slk_refresh = int function();
	alias da_slk_restore = int function();
	alias da_slk_set = int function(int, const(char)*, int);
	alias da_slk_touch = int function();
	alias da_standout = int function();
	alias da_standend = int function();
	alias da_start_color = int function();
	alias da_syncok = int function(WINDOW*, bool);
	alias da_termattrs = chtype function();
	alias da_timeout = void function(int);
	alias da_touchline = int function(WINDOW*, int, int);
	alias da_touchwin = int function(WINDOW*);
	alias da_typeahead = int function(int);
	alias da_ungetch = int function(int);
	alias da_untouchwin = int function(WINDOW*);
	alias da_use_env = void function(bool);
	alias da_use_tioctl = void function(bool);
	alias da_vidattr = int function(chtype);
	alias da_vidputs = int function(chtype, NCURSES_OUTC);
	alias da_vline = int function(chtype, int);
	alias da_vwprintw = int function(WINDOW*, const(char)*, va_list);
	alias da_vw_printw = int function(WINDOW*, const(char)*, va_list);
	alias da_vwscanw = int function(WINDOW*, const(char)*, va_list);
	alias da_vw_scanw = int function(WINDOW*, const(char)*, va_list);
	alias da_waddch = int function(WINDOW*, const chtype);
	alias da_waddchnstr = int function(WINDOW*, const(chtype)*, int);
	alias da_waddchstr = int function(WINDOW*, const(chtype)*);
	alias da_waddnstr = int function(WINDOW*, const(char)*, int);
	alias da_waddstr = int function(WINDOW*, const(char)*);
	alias da_wattron = int function(WINDOW*, int);
	alias da_wattroff = int function(WINDOW*, int);
	alias da_wattrset = int function(WINDOW*, int);
	alias da_wattr_get = int function(WINDOW*, attr_t*, short*, void*);
	alias da_wattr_on = int function(WINDOW*, attr_t, void*);
	alias da_wattr_off = int function(WINDOW*, attr_t, void*);
	alias da_wattr_set = int function(WINDOW*, attr_t, short, void*);
	alias da_wbkgd = int function(WINDOW*, chtype);
	alias da_wbkgdset = void function(WINDOW*, chtype);
	alias da_wborder = int function(WINDOW*, chtype, chtype, chtype, chtype, chtype, chtype, chtype, chtype);
	alias da_wchgat = int function(WINDOW*, int, attr_t, short, const(void)*);
	alias da_wclear = int function(WINDOW*);
	alias da_wclrtobot = int function(WINDOW*);
	alias da_wclrtoeol = int function(WINDOW*);
	alias da_wcolor_set = int function(WINDOW*, short, void*);
	alias da_wcursyncup = void function(WINDOW*);
	alias da_wdelch = int function(WINDOW*);
	alias da_wdeleteln = int function(WINDOW*);
	alias da_wechochar = int function(WINDOW*, const chtype);
	alias da_werase = int function(WINDOW*);
	alias da_wgetch = int function(WINDOW*);
	alias da_wgetnstr = int function(WINDOW*, char*, int);
	alias da_wgetstr = int function(WINDOW*, char*);
	alias da_whline = int function(WINDOW*, chtype, int);
	alias da_winch = chtype function(WINDOW*);
	alias da_winchnstr = int function(WINDOW*, chtype*, int);
	alias da_winchstr = int function(WINDOW*, chtype*);
	alias da_winnstr = int function(WINDOW*, char*, int);
	alias da_winsch = int function(WINDOW*, chtype);
	alias da_winsdelln = int function(WINDOW*, int);
	alias da_winsertln = int function(WINDOW*);
	alias da_winsnstr = int function(WINDOW*, const(char)*, int);
	alias da_winsstr = int function(WINDOW*, const(char)*);
	alias da_winstr = int function(WINDOW*, char*);
	alias da_wmove = int function(WINDOW*, int, int);
	alias da_wnoutrefresh = int function(WINDOW*);
	alias da_wprintw = int function(WINDOW*, const(char)*, ...);
	alias da_wredrawln = int function(WINDOW*, int, int);
	alias da_wrefresh = int function(WINDOW*);
	alias da_wscanw = int function(WINDOW*, const(char)*, ...);
	alias da_wscrl = int function(WINDOW*, int);
	alias da_wsetscrreg = int function(WINDOW*, int, int);
	alias da_wstandout = int function(WINDOW*);
	alias da_wstandend = int function(WINDOW*);
	alias da_wsyncdown = void function(WINDOW*);
	alias da_wsyncup = void function(WINDOW*);
	alias da_wtimeout = void function(WINDOW*, int);
	alias da_wtouchln = int function(WINDOW*, int, int, int);
	alias da_wvline = int function(WINDOW*, chtype, int);
	alias da_tigetflag = int function(const(char)*);
	alias da_tigetnum = int function(const(char)*);
	alias da_putp = int function(const(char)*);
	alias da_getattrs = int function(const(WINDOW)*);
	alias da_getcurx = int function(const(WINDOW)*);
	alias da_getcury = int function(const(WINDOW)*);
	alias da_getbegx = int function(const(WINDOW)*);
	alias da_getbegy = int function(const(WINDOW)*);
	alias da_getmaxx = int function(const(WINDOW)*);
	alias da_getmaxy = int function(const(WINDOW)*);
	alias da_getparx = int function(const(WINDOW)*);
	alias da_getpary = int function(const(WINDOW)*);
	alias da_is_term_resized = bool function(int, int);
	alias da_alloc_pair = int function(int, int);
	alias da_assume_default_colors = int function(int, int);
	alias da_define_key = int function(const(char)*, int);
	alias da_extended_color_content = int function(int, int*, int*, int*);
	alias da_extended_pair_content = int function(int, int*, int*);
	alias da_extended_slk_color = int function(int);
	alias da_find_pair = int function(int, int);
	alias da_free_pair = int function(int);
	alias da_get_escdelay = int function();
	alias da_init_extended_color = int function(int, int, int, int);
	alias da_init_extended_pair = int function(int, int, int);
	alias da_key_defined = int function(const(char)*);
	alias da_keyok = int function(int, bool);
	alias da_reset_color_pairs = void function();
	alias da_resize_term = int function(int, int);
	alias da_resizeterm = int function(int, int);
	alias da_set_escdelay = int function(int);
	alias da_set_tabsize = int function(int);
	alias da_use_default_colors = int function();
	alias da_use_extended_names = int function(bool);
	alias da_use_legacy_coding = int function(int);
	alias da_use_screen = int function(SCREEN*, NCURSES_SCREEN_CB, void*);
	alias da_use_window = int function(WINDOW*, NCURSES_WINDOW_CB, void*);
	alias da_wresize = int function(WINDOW*, int, int);
	alias da_nofilter = void function();
	alias da_is_cleared = bool function(const(WINDOW)*);
	alias da_is_idcok = bool function(const(WINDOW)*);
	alias da_is_idlok = bool function(const(WINDOW)*);
	alias da_is_immedok = bool function(const(WINDOW)*);
	alias da_is_keypad = bool function(const(WINDOW)*);
	alias da_is_leaveok = bool function(const(WINDOW)*);
	alias da_is_nodelay = bool function(const(WINDOW)*);
	alias da_is_notimeout = bool function(const(WINDOW)*);
	alias da_is_pad = bool function(const(WINDOW)*);
	alias da_is_scrollok = bool function(const(WINDOW)*);
	alias da_is_subwin = bool function(const(WINDOW)*);
	alias da_is_syncok = bool function(const(WINDOW)*);
	alias da_wgetdelay = int function(const(WINDOW)*);
	alias da_wgetscrreg = int function(const(WINDOW)*, int*, int*);
	alias da_baudrate_sp = int function(SCREEN*);
	alias da_beep_sp = int function(SCREEN*);
	alias da_can_change_color_sp = bool function(SCREEN*);
	alias da_cbreak_sp = int function(SCREEN*);
	alias da_curs_set_sp = int function(SCREEN*, int);
	alias da_color_content_sp = int function(SCREEN*, short, short*, short*, short*);
	alias da_def_prog_mode_sp = int function(SCREEN*);
	alias da_def_shell_mode_sp = int function(SCREEN*);
	alias da_delay_output_sp = int function(SCREEN*, int);
	alias da_doupdate_sp = int function(SCREEN*);
	alias da_echo_sp = int function(SCREEN*);
	alias da_endwin_sp = int function(SCREEN*);
	alias da_erasechar_sp = char function(SCREEN*);
	alias da_filter_sp = void function(SCREEN*);
	alias da_flash_sp = int function(SCREEN*);
	alias da_flushinp_sp = int function(SCREEN*);
	alias da_halfdelay_sp = int function(SCREEN*, int);
	alias da_has_colors_sp = bool function(SCREEN*);
	alias da_has_ic_sp = bool function(SCREEN*);
	alias da_has_il_sp = bool function(SCREEN*);
	alias da_init_color_sp = int function(SCREEN*, short, short, short, short);
	alias da_init_pair_sp = int function(SCREEN*, short, short, short);
	alias da_intrflush_sp = int function(SCREEN*, WINDOW*, bool);
	alias da_isendwin_sp = bool function(SCREEN*);
	alias da_killchar_sp = char function(SCREEN*);
	alias da_mvcur_sp = int function(SCREEN*, int, int, int, int);
	alias da_napms_sp = int function(SCREEN*, int);
	alias da_nl_sp = int function(SCREEN*);
	alias da_nocbreak_sp = int function(SCREEN*);
	alias da_noecho_sp = int function(SCREEN*);
	alias da_nonl_sp = int function(SCREEN*);
	alias da_noqiflush_sp = void function(SCREEN*);
	alias da_noraw_sp = int function(SCREEN*);
	alias da_pair_content_sp = int function(SCREEN*, short, short*, short*);
	alias da_qiflush_sp = void function(SCREEN*);
	alias da_raw_sp = int function(SCREEN*);
	alias da_reset_prog_mode_sp = int function(SCREEN*);
	alias da_reset_shell_mode_sp = int function(SCREEN*);
	alias da_resetty_sp = int function(SCREEN*);
	alias da_ripoffline_sp = int function(SCREEN*, int, int function (WINDOW*, int));
	alias da_savetty_sp = int function(SCREEN*);
	alias da_scr_init_sp = int function(SCREEN*, const(char)*);
	alias da_scr_restore_sp = int function(SCREEN*, const(char)*);
	alias da_scr_set_sp = int function(SCREEN*, const(char)*);
	alias da_slk_attroff_sp = int function(SCREEN*, const chtype);
	alias da_slk_attron_sp = int function(SCREEN*, const chtype);
	alias da_slk_attrset_sp = int function(SCREEN*, const chtype);
	alias da_slk_attr_sp = attr_t function(SCREEN*);
	alias da_slk_attr_set_sp = int function(SCREEN*, const attr_t, short, void*);
	alias da_slk_clear_sp = int function(SCREEN*);
	alias da_slk_color_sp = int function(SCREEN*, short);
	alias da_slk_init_sp = int function(SCREEN*, int);
	alias da_slk_noutrefresh_sp = int function(SCREEN*);
	alias da_slk_refresh_sp = int function(SCREEN*);
	alias da_slk_restore_sp = int function(SCREEN*);
	alias da_slk_set_sp = int function(SCREEN*, int, const(char)*, int);
	alias da_slk_touch_sp = int function(SCREEN*);
	alias da_start_color_sp = int function(SCREEN*);
	alias da_termattrs_sp = chtype function(SCREEN*);
	alias da_typeahead_sp = int function(SCREEN*, int);
	alias da_ungetch_sp = int function(SCREEN*, int);
	alias da_use_env_sp = void function(SCREEN*, bool);
	alias da_use_tioctl_sp = void function(SCREEN*, bool);
	alias da_vidattr_sp = int function(SCREEN*, chtype);
	alias da_vidputs_sp = int function(SCREEN*, chtype, NCURSES_OUTC_sp);
	alias da_keybound_sp = char* function(SCREEN*, int, int);
	alias da_alloc_pair_sp = int function(SCREEN*, int, int);
	alias da_assume_default_colors_sp = int function(SCREEN*, int, int);
	alias da_define_key_sp = int function(SCREEN*, const(char)*, int);
	alias da_extended_color_content_sp = int function(SCREEN*, int, int*, int*, int*);
	alias da_extended_pair_content_sp = int function(SCREEN*, int, int*, int*);
	alias da_extended_slk_color_sp = int function(SCREEN*, int);
	alias da_get_escdelay_sp = int function(SCREEN*);
	alias da_find_pair_sp = int function(SCREEN*, int, int);
	alias da_free_pair_sp = int function(SCREEN*, int);
	alias da_init_extended_color_sp = int function(SCREEN*, int, int, int, int);
	alias da_init_extended_pair_sp = int function(SCREEN*, int, int, int);
	alias da_is_term_resized_sp = bool function(SCREEN*, int, int);
	alias da_key_defined_sp = int function(SCREEN*, const(char)*);
	alias da_keyok_sp = int function(SCREEN*, int, bool);
	alias da_nofilter_sp = void function(SCREEN*);
	alias da_reset_color_pairs_sp = void function(SCREEN*);
	alias da_resize_term_sp = int function(SCREEN*, int, int);
	alias da_resizeterm_sp = int function(SCREEN*, int, int);
	alias da_set_escdelay_sp = int function(SCREEN*, int);
	alias da_set_tabsize_sp = int function(SCREEN*, int);
	alias da_use_default_colors_sp = int function(SCREEN*);
	alias da_use_legacy_coding_sp = int function(SCREEN*, int);
	alias da_has_mouse = bool function();
	alias da_getmouse = int function(MEVENT*);
	alias da_ungetmouse = int function(MEVENT*);
	alias da_mousemask = mmask_t function(mmask_t, mmask_t*);
	alias da_wenclose = bool function(const(WINDOW)*, int, int);
	alias da_mouseinterval = int function(int);
	alias da_wmouse_trafo = bool function(const(WINDOW)*, int*, int*, bool);
	alias da_mouse_trafo = bool function(int*, int*, bool);
	alias da_has_mouse_sp = bool function(SCREEN*);
	alias da_getmouse_sp = int function(SCREEN*, MEVENT*);
	alias da_ungetmouse_sp = int function(SCREEN*, MEVENT*);
	alias da_mousemask_sp = mmask_t function(SCREEN*, mmask_t, mmask_t*);
	alias da_mouseinterval_sp = int function(SCREEN*, int);
	alias da_mcprint = int function(char*, int);
	alias da_has_key = int function(int);
	alias da_has_key_sp = int function(SCREEN*, int);
	alias da_mcprint_sp = int function(SCREEN*, char*, int);
	alias da__tracef = void function(const(char)*, ...);
	alias da__traceattr = char* function(attr_t);
	alias da__traceattr2 = char* function(int, chtype);
	alias da__tracechar = char* function(int);
	alias da__tracechtype = char* function(chtype);
	alias da__tracechtype2 = char* function(int, chtype);
	alias da_trace = void function(const uint);

	alias da_cursrc = WINDOW*;
	alias da_newscr = WINDOW*;
	alias da_stdscr = WINDOW*;
	alias da_ttytype = char[];
	alias da_COLORS = int;
	alias da_COLOR_PAIRS = int;
	alias da_COLS = int;
	alias da_ESCDELAY = int;
	alias da_LINES = int;
	alias da_TABSIZE = int;
}
