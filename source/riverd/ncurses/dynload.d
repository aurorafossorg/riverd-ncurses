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

module riverd.ncurses.dynload;

import riverd.loader;

public import riverd.ncurses.dynfun;

version(D_BetterC)
{
	void* dylib_load_ncurses() {
		version(Posix) void* handle = dylib_load("libncursesw.so");

		if(handle is null) return null;

		dylib_bindSymbol(handle, cast(void**)&initscr, "initscr");
		dylib_bindSymbol(handle, cast(void**)&longname, "longname");
		dylib_bindSymbol(handle, cast(void**)&newpad, "newpad");
		dylib_bindSymbol(handle, cast(void**)&newterm, "newterm");
		dylib_bindSymbol(handle, cast(void**)&newwin, "newwin");
		dylib_bindSymbol(handle, cast(void**)&set_term, "set_term");
		dylib_bindSymbol(handle, cast(void**)&slk_label, "slk_label");
		dylib_bindSymbol(handle, cast(void**)&subpad, "subpad");
		dylib_bindSymbol(handle, cast(void**)&subwin, "subwin");
		dylib_bindSymbol(handle, cast(void**)&termname, "termname");
		dylib_bindSymbol(handle, cast(void**)&tigetstr, "tigetstr");
		dylib_bindSymbol(handle, cast(void**)&tparm, "tparm");
		dylib_bindSymbol(handle, cast(void**)&tiparm, "tiparm");
		dylib_bindSymbol(handle, cast(void**)&keybound, "keybound");
		dylib_bindSymbol(handle, cast(void**)&wgetparent, "wgetparent");
		dylib_bindSymbol(handle, cast(void**)&new_prescr, "new_prescr");
		dylib_bindSymbol(handle, cast(void**)&getwin_sp, "getwin_sp");
		dylib_bindSymbol(handle, cast(void**)&longname_sp, "longname_sp");
		dylib_bindSymbol(handle, cast(void**)&newpad_sp, "newpad_sp");
		dylib_bindSymbol(handle, cast(void**)&newterm_sp, "newterm_sp");
		dylib_bindSymbol(handle, cast(void**)&newwin_sp, "newwin_sp");
		dylib_bindSymbol(handle, cast(void**)&getwin, "getwin");
		dylib_bindSymbol(handle, cast(void**)&derwin, "derwin");
		dylib_bindSymbol(handle, cast(void**)&dupwin, "dupwin");
		dylib_bindSymbol(handle, cast(void**)&termname_sp, "termname_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_label_sp, "slk_label_sp");
		dylib_bindSymbol(handle, cast(void**)&curses_version, "curses_version");
		dylib_bindSymbol(handle, cast(void**)&keyname_sp, "keyname_sp");
		dylib_bindSymbol(handle, cast(void**)&keyname, "keyname");
		dylib_bindSymbol(handle, cast(void**)&addchnstr, "addchnstr");
		dylib_bindSymbol(handle, cast(void**)&addchstr, "addchstr");
		dylib_bindSymbol(handle, cast(void**)&addnstr, "addnstr");
		dylib_bindSymbol(handle, cast(void**)&addstr, "addstr");
		dylib_bindSymbol(handle, cast(void**)&attr_get, "attr_get");
		dylib_bindSymbol(handle, cast(void**)&attr_off, "attr_off");
		dylib_bindSymbol(handle, cast(void**)&attr_on, "attr_on");
		dylib_bindSymbol(handle, cast(void**)&attr_set, "attr_set");
		dylib_bindSymbol(handle, cast(void**)&baudrate, "baudrate");
		dylib_bindSymbol(handle, cast(void**)&beep, "beep");
		dylib_bindSymbol(handle, cast(void**)&can_change_color, "can_change_color");
		dylib_bindSymbol(handle, cast(void**)&cbreak, "cbreak");
		dylib_bindSymbol(handle, cast(void**)&clearok, "clearok");
		dylib_bindSymbol(handle, cast(void**)&color_content, "color_content");
		dylib_bindSymbol(handle, cast(void**)&copywin, "copywin");
		dylib_bindSymbol(handle, cast(void**)&curs_set, "curs_set");
		dylib_bindSymbol(handle, cast(void**)&def_prog_mode, "def_prog_mode");
		dylib_bindSymbol(handle, cast(void**)&def_shell_mode, "def_shell_mode");
		dylib_bindSymbol(handle, cast(void**)&delay_output, "delay_output");
		dylib_bindSymbol(handle, cast(void**)&delscreen, "delscreen");
		dylib_bindSymbol(handle, cast(void**)&delwin, "delwin");
		dylib_bindSymbol(handle, cast(void**)&doupdate, "doupdate");
		dylib_bindSymbol(handle, cast(void**)&echo, "echo");
		dylib_bindSymbol(handle, cast(void**)&endwin, "endwin");
		dylib_bindSymbol(handle, cast(void**)&erasechar, "erasechar");
		dylib_bindSymbol(handle, cast(void**)&filter, "filter");
		dylib_bindSymbol(handle, cast(void**)&flash, "flash");
		dylib_bindSymbol(handle, cast(void**)&flushinp, "flushinp");
		dylib_bindSymbol(handle, cast(void**)&getbkgd, "getbkgd");
		dylib_bindSymbol(handle, cast(void**)&halfdelay, "halfdelay");
		dylib_bindSymbol(handle, cast(void**)&has_colors, "has_colors");
		dylib_bindSymbol(handle, cast(void**)&has_ic, "has_ic");
		dylib_bindSymbol(handle, cast(void**)&has_il, "has_il");
		dylib_bindSymbol(handle, cast(void**)&idcok, "idcok");
		dylib_bindSymbol(handle, cast(void**)&idlok, "idlok");
		dylib_bindSymbol(handle, cast(void**)&immedok, "immedok");
		dylib_bindSymbol(handle, cast(void**)&init_color, "init_color");
		dylib_bindSymbol(handle, cast(void**)&init_pair, "init_pair");
		dylib_bindSymbol(handle, cast(void**)&intrflush, "intrflush");
		dylib_bindSymbol(handle, cast(void**)&isendwin, "isendwin");
		dylib_bindSymbol(handle, cast(void**)&is_wintouched, "is_wintouched");
		dylib_bindSymbol(handle, cast(void**)&keypad, "keypad");
		dylib_bindSymbol(handle, cast(void**)&killchar, "killchar");
		dylib_bindSymbol(handle, cast(void**)&leaveok, "leaveok");
		dylib_bindSymbol(handle, cast(void**)&meta, "meta");
		dylib_bindSymbol(handle, cast(void**)&mvcur, "mvcur");
		dylib_bindSymbol(handle, cast(void**)&mvderwin, "mvderwin");
		dylib_bindSymbol(handle, cast(void**)&mvprintw, "mvprintw");
		dylib_bindSymbol(handle, cast(void**)&mvscanw, "mvscanw");
		dylib_bindSymbol(handle, cast(void**)&mvwaddch, "mvwaddch");
		dylib_bindSymbol(handle, cast(void**)&mvwaddchnstr, "mvwaddchnstr");
		dylib_bindSymbol(handle, cast(void**)&mvwaddchstr, "mvwaddchstr");
		dylib_bindSymbol(handle, cast(void**)&mvwaddnstr, "mvwaddnstr");
		dylib_bindSymbol(handle, cast(void**)&mvwaddstr, "mvwaddstr");
		dylib_bindSymbol(handle, cast(void**)&mvwchgat, "mvwchgat");
		dylib_bindSymbol(handle, cast(void**)&mvwdelch, "mvwdelch");
		dylib_bindSymbol(handle, cast(void**)&mvwgetch, "mvwgetch");
		dylib_bindSymbol(handle, cast(void**)&mvwgetnstr, "mvwgetnstr");
		dylib_bindSymbol(handle, cast(void**)&mvwgetstr, "mvwgetstr");
		dylib_bindSymbol(handle, cast(void**)&mvwhline, "mvwhline");
		dylib_bindSymbol(handle, cast(void**)&mvwin, "mvwin");
		dylib_bindSymbol(handle, cast(void**)&mvwprintw, "mvwprintw");
		dylib_bindSymbol(handle, cast(void**)&mvwscanw, "mvwscanw");
		dylib_bindSymbol(handle, cast(void**)&mvwvline, "mvwvline");
		dylib_bindSymbol(handle, cast(void**)&napms, "napms");
		dylib_bindSymbol(handle, cast(void**)&nl, "nl");
		dylib_bindSymbol(handle, cast(void**)&nocbreak, "nocbreak");
		dylib_bindSymbol(handle, cast(void**)&nodelay, "nodelay");
		dylib_bindSymbol(handle, cast(void**)&noecho, "noecho");
		dylib_bindSymbol(handle, cast(void**)&nonl, "nonl");
		dylib_bindSymbol(handle, cast(void**)&noqiflush, "noqiflush");
		dylib_bindSymbol(handle, cast(void**)&noraw, "noraw");
		dylib_bindSymbol(handle, cast(void**)&notimeout, "notimeout");
		dylib_bindSymbol(handle, cast(void**)&overlay, "overlay");
		dylib_bindSymbol(handle, cast(void**)&overwrite, "overwrite");
		dylib_bindSymbol(handle, cast(void**)&pair_content, "pair_content");
		dylib_bindSymbol(handle, cast(void**)&PAIR_NUMBER, "PAIR_NUMBER");
		dylib_bindSymbol(handle, cast(void**)&pechochar, "pechochar");
		dylib_bindSymbol(handle, cast(void**)&pnoutrefresh, "pnoutrefresh");
		dylib_bindSymbol(handle, cast(void**)&prefresh, "prefresh");
		dylib_bindSymbol(handle, cast(void**)&printw, "printw");
		dylib_bindSymbol(handle, cast(void**)&putwin, "putwin");
		dylib_bindSymbol(handle, cast(void**)&qiflush, "qiflush");
		dylib_bindSymbol(handle, cast(void**)&raw, "raw");
		dylib_bindSymbol(handle, cast(void**)&redrawwin, "redrawwin");
		dylib_bindSymbol(handle, cast(void**)&resetty, "resetty");
		dylib_bindSymbol(handle, cast(void**)&reset_prog_mode, "reset_prog_mode");
		dylib_bindSymbol(handle, cast(void**)&reset_shell_mode, "reset_shell_mode");
		dylib_bindSymbol(handle, cast(void**)&ripoffline, "ripoffline");
		dylib_bindSymbol(handle, cast(void**)&savetty, "savetty");
		dylib_bindSymbol(handle, cast(void**)&scanw, "scanw");
		dylib_bindSymbol(handle, cast(void**)&scr_dump, "scr_dump");
		dylib_bindSymbol(handle, cast(void**)&scr_init, "scr_init");
		dylib_bindSymbol(handle, cast(void**)&scrollok, "scrollok");
		dylib_bindSymbol(handle, cast(void**)&scr_restore, "scr_restore");
		dylib_bindSymbol(handle, cast(void**)&scr_set, "scr_set");
		dylib_bindSymbol(handle, cast(void**)&setscrreg, "setscrreg");
		dylib_bindSymbol(handle, cast(void**)&slk_attroff, "slk_attroff");
		dylib_bindSymbol(handle, cast(void**)&slk_attron, "slk_attron");
		dylib_bindSymbol(handle, cast(void**)&slk_attrset, "slk_attrset");
		dylib_bindSymbol(handle, cast(void**)&slk_attr, "slk_attr");
		dylib_bindSymbol(handle, cast(void**)&slk_attr_set, "slk_attr_set");
		dylib_bindSymbol(handle, cast(void**)&slk_clear, "slk_clear");
		dylib_bindSymbol(handle, cast(void**)&slk_color, "slk_color");
		dylib_bindSymbol(handle, cast(void**)&slk_init, "slk_init");
		dylib_bindSymbol(handle, cast(void**)&slk_noutrefresh, "slk_noutrefresh");
		dylib_bindSymbol(handle, cast(void**)&slk_refresh, "slk_refresh");
		dylib_bindSymbol(handle, cast(void**)&slk_restore, "slk_restore");
		dylib_bindSymbol(handle, cast(void**)&slk_set, "slk_set");
		dylib_bindSymbol(handle, cast(void**)&slk_touch, "slk_touch");
		dylib_bindSymbol(handle, cast(void**)&start_color, "start_color");
		dylib_bindSymbol(handle, cast(void**)&syncok, "syncok");
		dylib_bindSymbol(handle, cast(void**)&termattrs, "termattrs");
		dylib_bindSymbol(handle, cast(void**)&typeahead, "typeahead");
		dylib_bindSymbol(handle, cast(void**)&ungetch, "ungetch");
		dylib_bindSymbol(handle, cast(void**)&use_env, "use_env");
		dylib_bindSymbol(handle, cast(void**)&use_tioctl, "use_tioctl");
		dylib_bindSymbol(handle, cast(void**)&vidattr, "vidattr");
		dylib_bindSymbol(handle, cast(void**)&vidputs, "vidputs");
		dylib_bindSymbol(handle, cast(void**)&vwprintw, "vwprintw");
		dylib_bindSymbol(handle, cast(void**)&vw_printw, "vw_printw");
		dylib_bindSymbol(handle, cast(void**)&vwscanw, "vwscanw");
		dylib_bindSymbol(handle, cast(void**)&vw_scanw, "vw_scanw");
		dylib_bindSymbol(handle, cast(void**)&waddch, "waddch");
		dylib_bindSymbol(handle, cast(void**)&waddchnstr, "waddchnstr");
		dylib_bindSymbol(handle, cast(void**)&waddchstr, "waddchstr");
		dylib_bindSymbol(handle, cast(void**)&waddnstr, "waddnstr");
		dylib_bindSymbol(handle, cast(void**)&wattrset, "wattrset");
		dylib_bindSymbol(handle, cast(void**)&wattr_get, "wattr_get");
		dylib_bindSymbol(handle, cast(void**)&wattr_on, "wattr_on");
		dylib_bindSymbol(handle, cast(void**)&wattr_off, "wattr_off");
		dylib_bindSymbol(handle, cast(void**)&wattr_set, "wattr_set");
		dylib_bindSymbol(handle, cast(void**)&wbkgd, "wbkgd");
		dylib_bindSymbol(handle, cast(void**)&wbkgdset, "wbkgdset");
		dylib_bindSymbol(handle, cast(void**)&wborder, "wborder");
		dylib_bindSymbol(handle, cast(void**)&wchgat, "wchgat");
		dylib_bindSymbol(handle, cast(void**)&wclear, "wclear");
		dylib_bindSymbol(handle, cast(void**)&wclrtobot, "wclrtobot");
		dylib_bindSymbol(handle, cast(void**)&wclrtoeol, "wclrtoeol");
		dylib_bindSymbol(handle, cast(void**)&wcolor_set, "wcolor_set");
		dylib_bindSymbol(handle, cast(void**)&wcursyncup, "wcursyncup");
		dylib_bindSymbol(handle, cast(void**)&wdelch, "wdelch");
		dylib_bindSymbol(handle, cast(void**)&wechochar, "wechochar");
		dylib_bindSymbol(handle, cast(void**)&werase, "werase");
		dylib_bindSymbol(handle, cast(void**)&wgetch, "wgetch");
		dylib_bindSymbol(handle, cast(void**)&wgetnstr, "wgetnstr");
		dylib_bindSymbol(handle, cast(void**)&whline, "whline");
		dylib_bindSymbol(handle, cast(void**)&winch, "winch");
		dylib_bindSymbol(handle, cast(void**)&winchnstr, "winchnstr");
		dylib_bindSymbol(handle, cast(void**)&winnstr, "winnstr");
		dylib_bindSymbol(handle, cast(void**)&winsch, "winsch");
		dylib_bindSymbol(handle, cast(void**)&winsdelln, "winsdelln");
		dylib_bindSymbol(handle, cast(void**)&winsnstr, "winsnstr");
		dylib_bindSymbol(handle, cast(void**)&wmove, "wmove");
		dylib_bindSymbol(handle, cast(void**)&wnoutrefresh, "wnoutrefresh");
		dylib_bindSymbol(handle, cast(void**)&wprintw, "wprintw");
		dylib_bindSymbol(handle, cast(void**)&wredrawln, "wredrawln");
		dylib_bindSymbol(handle, cast(void**)&wrefresh, "wrefresh");
		dylib_bindSymbol(handle, cast(void**)&wscanw, "wscanw");
		dylib_bindSymbol(handle, cast(void**)&wscrl, "wscrl");
		dylib_bindSymbol(handle, cast(void**)&wsetscrreg, "wsetscrreg");
		dylib_bindSymbol(handle, cast(void**)&wsyncdown, "wsyncdown");
		dylib_bindSymbol(handle, cast(void**)&wsyncup, "wsyncup");
		dylib_bindSymbol(handle, cast(void**)&wtimeout, "wtimeout");
		dylib_bindSymbol(handle, cast(void**)&wtouchln, "wtouchln");
		dylib_bindSymbol(handle, cast(void**)&wvline, "wvline");
		dylib_bindSymbol(handle, cast(void**)&tigetflag, "tigetflag");
		dylib_bindSymbol(handle, cast(void**)&tigetnum, "tigetnum");
		dylib_bindSymbol(handle, cast(void**)&putp, "putp");
		dylib_bindSymbol(handle, cast(void**)&getattrs, "getattrs");
		dylib_bindSymbol(handle, cast(void**)&is_term_resized, "is_term_resized");
		dylib_bindSymbol(handle, cast(void**)&alloc_pair, "alloc_pair");
		dylib_bindSymbol(handle, cast(void**)&assume_default_colors, "assume_default_colors");
		dylib_bindSymbol(handle, cast(void**)&define_key, "define_key");
		dylib_bindSymbol(handle, cast(void**)&extended_color_content, "extended_color_content");
		dylib_bindSymbol(handle, cast(void**)&extended_pair_content, "extended_pair_content");
		dylib_bindSymbol(handle, cast(void**)&extended_slk_color, "extended_slk_color");
		dylib_bindSymbol(handle, cast(void**)&find_pair, "find_pair");
		dylib_bindSymbol(handle, cast(void**)&free_pair, "free_pair");
		dylib_bindSymbol(handle, cast(void**)&get_escdelay, "get_escdelay");
		dylib_bindSymbol(handle, cast(void**)&init_extended_color, "init_extended_color");
		dylib_bindSymbol(handle, cast(void**)&init_extended_pair, "init_extended_pair");
		dylib_bindSymbol(handle, cast(void**)&key_defined, "key_defined");
		dylib_bindSymbol(handle, cast(void**)&keyok, "keyok");
		dylib_bindSymbol(handle, cast(void**)&reset_color_pairs, "reset_color_pairs");
		dylib_bindSymbol(handle, cast(void**)&resize_term, "resize_term");
		dylib_bindSymbol(handle, cast(void**)&resizeterm, "resizeterm");
		dylib_bindSymbol(handle, cast(void**)&set_escdelay, "set_escdelay");
		dylib_bindSymbol(handle, cast(void**)&set_tabsize, "set_tabsize");
		dylib_bindSymbol(handle, cast(void**)&use_default_colors, "use_default_colors");
		dylib_bindSymbol(handle, cast(void**)&use_extended_names, "use_extended_names");
		dylib_bindSymbol(handle, cast(void**)&use_legacy_coding, "use_legacy_coding");
		dylib_bindSymbol(handle, cast(void**)&use_screen, "use_screen");
		dylib_bindSymbol(handle, cast(void**)&use_window, "use_window");
		dylib_bindSymbol(handle, cast(void**)&wresize, "wresize");
		dylib_bindSymbol(handle, cast(void**)&nofilter, "nofilter");
		dylib_bindSymbol(handle, cast(void**)&is_cleared, "is_cleared");
		dylib_bindSymbol(handle, cast(void**)&is_idcok, "is_idcok");
		dylib_bindSymbol(handle, cast(void**)&is_idlok, "is_idlok");
		dylib_bindSymbol(handle, cast(void**)&is_immedok, "is_immedok");
		dylib_bindSymbol(handle, cast(void**)&is_keypad, "is_keypad");
		dylib_bindSymbol(handle, cast(void**)&is_leaveok, "is_leaveok");
		dylib_bindSymbol(handle, cast(void**)&is_nodelay, "is_nodelay");
		dylib_bindSymbol(handle, cast(void**)&is_notimeout, "is_notimeout");
		dylib_bindSymbol(handle, cast(void**)&is_pad, "is_pad");
		dylib_bindSymbol(handle, cast(void**)&is_scrollok, "is_scrollok");
		dylib_bindSymbol(handle, cast(void**)&is_subwin, "is_subwin");
		dylib_bindSymbol(handle, cast(void**)&is_syncok, "is_syncok");
		dylib_bindSymbol(handle, cast(void**)&wgetdelay, "wgetdelay");
		dylib_bindSymbol(handle, cast(void**)&wgetscrreg, "wgetscrreg");
		dylib_bindSymbol(handle, cast(void**)&baudrate_sp, "baudrate_sp");
		dylib_bindSymbol(handle, cast(void**)&beep_sp, "beep_sp");
		dylib_bindSymbol(handle, cast(void**)&can_change_color_sp, "can_change_color_sp");
		dylib_bindSymbol(handle, cast(void**)&cbreak_sp, "cbreak_sp");
		dylib_bindSymbol(handle, cast(void**)&curs_set_sp, "curs_set_sp");
		dylib_bindSymbol(handle, cast(void**)&color_content_sp, "color_content_sp");
		dylib_bindSymbol(handle, cast(void**)&def_prog_mode_sp, "def_prog_mode_sp");
		dylib_bindSymbol(handle, cast(void**)&def_shell_mode_sp, "def_shell_mode_sp");
		dylib_bindSymbol(handle, cast(void**)&delay_output_sp, "delay_output_sp");
		dylib_bindSymbol(handle, cast(void**)&doupdate_sp, "doupdate_sp");
		dylib_bindSymbol(handle, cast(void**)&echo_sp, "echo_sp");
		dylib_bindSymbol(handle, cast(void**)&endwin_sp, "endwin_sp");
		dylib_bindSymbol(handle, cast(void**)&erasechar_sp, "erasechar_sp");
		dylib_bindSymbol(handle, cast(void**)&filter_sp, "filter_sp");
		dylib_bindSymbol(handle, cast(void**)&flash_sp, "flash_sp");
		dylib_bindSymbol(handle, cast(void**)&flushinp_sp, "flushinp_sp");
		dylib_bindSymbol(handle, cast(void**)&halfdelay_sp, "halfdelay_sp");
		dylib_bindSymbol(handle, cast(void**)&has_colors_sp, "has_colors_sp");
		dylib_bindSymbol(handle, cast(void**)&has_ic_sp, "has_ic_sp");
		dylib_bindSymbol(handle, cast(void**)&has_il_sp, "has_il_sp");
		dylib_bindSymbol(handle, cast(void**)&init_color_sp, "init_color_sp");
		dylib_bindSymbol(handle, cast(void**)&init_pair_sp, "init_pair_sp");
		dylib_bindSymbol(handle, cast(void**)&intrflush_sp, "intrflush_sp");
		dylib_bindSymbol(handle, cast(void**)&isendwin_sp, "isendwin_sp");
		dylib_bindSymbol(handle, cast(void**)&killchar_sp, "killchar_sp");
		dylib_bindSymbol(handle, cast(void**)&mvcur_sp, "mvcur_sp");
		dylib_bindSymbol(handle, cast(void**)&napms_sp, "napms_sp");
		dylib_bindSymbol(handle, cast(void**)&nl_sp, "nl_sp");
		dylib_bindSymbol(handle, cast(void**)&nocbreak_sp, "nocbreak_sp");
		dylib_bindSymbol(handle, cast(void**)&noecho_sp, "noecho_sp");
		dylib_bindSymbol(handle, cast(void**)&nonl_sp, "nonl_sp");
		dylib_bindSymbol(handle, cast(void**)&noqiflush_sp, "noqiflush_sp");
		dylib_bindSymbol(handle, cast(void**)&noraw_sp, "noraw_sp");
		dylib_bindSymbol(handle, cast(void**)&pair_content_sp, "pair_content_sp");
		dylib_bindSymbol(handle, cast(void**)&qiflush_sp, "qiflush_sp");
		dylib_bindSymbol(handle, cast(void**)&raw_sp, "raw_sp");
		dylib_bindSymbol(handle, cast(void**)&reset_prog_mode_sp, "reset_prog_mode_sp");
		dylib_bindSymbol(handle, cast(void**)&reset_shell_mode_sp, "reset_shell_mode_sp");
		dylib_bindSymbol(handle, cast(void**)&resetty_sp, "resetty_sp");
		dylib_bindSymbol(handle, cast(void**)&ripoffline_sp, "ripoffline_sp");
		dylib_bindSymbol(handle, cast(void**)&savetty_sp, "savetty_sp");
		dylib_bindSymbol(handle, cast(void**)&scr_init_sp, "scr_init_sp");
		dylib_bindSymbol(handle, cast(void**)&scr_restore_sp, "scr_restore_sp");
		dylib_bindSymbol(handle, cast(void**)&scr_set_sp, "scr_set_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_attroff_sp, "slk_attroff_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_attron_sp, "slk_attron_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_attrset_sp, "slk_attrset_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_attr_sp, "slk_attr_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_attr_set_sp, "slk_attr_set_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_clear_sp, "slk_clear_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_color_sp, "slk_color_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_init_sp, "slk_init_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_noutrefresh_sp, "slk_noutrefresh_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_refresh_sp, "slk_refresh_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_restore_sp, "slk_restore_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_set_sp, "slk_set_sp");
		dylib_bindSymbol(handle, cast(void**)&slk_touch_sp, "slk_touch_sp");
		dylib_bindSymbol(handle, cast(void**)&start_color_sp, "start_color_sp");
		dylib_bindSymbol(handle, cast(void**)&termattrs_sp, "termattrs_sp");
		dylib_bindSymbol(handle, cast(void**)&typeahead_sp, "typeahead_sp");
		dylib_bindSymbol(handle, cast(void**)&ungetch_sp, "ungetch_sp");
		dylib_bindSymbol(handle, cast(void**)&use_env_sp, "use_env_sp");
		dylib_bindSymbol(handle, cast(void**)&use_tioctl_sp, "use_tioctl_sp");
		dylib_bindSymbol(handle, cast(void**)&vidattr_sp, "vidattr_sp");
		dylib_bindSymbol(handle, cast(void**)&vidputs_sp, "vidputs_sp");
		dylib_bindSymbol(handle, cast(void**)&keybound_sp, "keybound_sp");
		dylib_bindSymbol(handle, cast(void**)&alloc_pair_sp, "alloc_pair_sp");
		dylib_bindSymbol(handle, cast(void**)&assume_default_colors_sp, "assume_default_colors_sp");
		dylib_bindSymbol(handle, cast(void**)&define_key_sp, "define_key_sp");
		dylib_bindSymbol(handle, cast(void**)&extended_color_content_sp, "extended_color_content_sp");
		dylib_bindSymbol(handle, cast(void**)&extended_pair_content_sp, "extended_pair_content_sp");
		dylib_bindSymbol(handle, cast(void**)&extended_slk_color_sp, "extended_slk_color_sp");
		dylib_bindSymbol(handle, cast(void**)&get_escdelay_sp, "get_escdelay_sp");
		dylib_bindSymbol(handle, cast(void**)&find_pair_sp, "find_pair_sp");
		dylib_bindSymbol(handle, cast(void**)&free_pair_sp, "free_pair_sp");
		dylib_bindSymbol(handle, cast(void**)&init_extended_color_sp, "init_extended_color_sp");
		dylib_bindSymbol(handle, cast(void**)&init_extended_pair_sp, "init_extended_pair_sp");
		dylib_bindSymbol(handle, cast(void**)&is_term_resized_sp, "is_term_resized_sp");
		dylib_bindSymbol(handle, cast(void**)&key_defined_sp, "key_defined_sp");
		dylib_bindSymbol(handle, cast(void**)&keyok_sp, "keyok_sp");
		dylib_bindSymbol(handle, cast(void**)&nofilter_sp, "nofilter_sp");
		dylib_bindSymbol(handle, cast(void**)&reset_color_pairs_sp, "reset_color_pairs_sp");
		dylib_bindSymbol(handle, cast(void**)&resize_term_sp, "resize_term_sp");
		dylib_bindSymbol(handle, cast(void**)&resizeterm_sp, "resizeterm_sp");
		dylib_bindSymbol(handle, cast(void**)&set_escdelay_sp, "set_escdelay_sp");
		dylib_bindSymbol(handle, cast(void**)&set_tabsize_sp, "set_tabsize_sp");
		dylib_bindSymbol(handle, cast(void**)&use_default_colors_sp, "use_default_colors_sp");
		dylib_bindSymbol(handle, cast(void**)&use_legacy_coding_sp, "use_legacy_coding_sp");
		dylib_bindSymbol(handle, cast(void**)&has_mouse, "has_mouse");
		dylib_bindSymbol(handle, cast(void**)&getmouse, "getmouse");
		dylib_bindSymbol(handle, cast(void**)&ungetmouse, "ungetmouse");
		dylib_bindSymbol(handle, cast(void**)&mousemask, "mousemask");
		dylib_bindSymbol(handle, cast(void**)&wenclose, "wenclose");
		dylib_bindSymbol(handle, cast(void**)&mouseinterval, "mouseinterval");
		dylib_bindSymbol(handle, cast(void**)&wmouse_trafo, "wmouse_trafo");
		dylib_bindSymbol(handle, cast(void**)&has_mouse_sp, "has_mouse_sp");
		dylib_bindSymbol(handle, cast(void**)&getmouse_sp, "getmouse_sp");
		dylib_bindSymbol(handle, cast(void**)&ungetmouse_sp, "ungetmouse_sp");
		dylib_bindSymbol(handle, cast(void**)&mousemask_sp, "mousemask_sp");
		dylib_bindSymbol(handle, cast(void**)&mouseinterval_sp, "mouseinterval_sp");
		dylib_bindSymbol(handle, cast(void**)&mcprint, "mcprint");
		dylib_bindSymbol(handle, cast(void**)&has_key, "has_key");
		dylib_bindSymbol(handle, cast(void**)&has_key_sp, "has_key_sp");
		dylib_bindSymbol(handle, cast(void**)&mcprint_sp, "mcprint_sp");
		dylib_bindSymbol(handle, cast(void**)&_tracef, "_tracef");
		dylib_bindSymbol(handle, cast(void**)&_traceattr, "_traceattr");
		dylib_bindSymbol(handle, cast(void**)&_traceattr2, "_traceattr2");
		dylib_bindSymbol(handle, cast(void**)&_tracechar, "_tracechar");
		dylib_bindSymbol(handle, cast(void**)&_tracechtype, "_tracechtype");
		dylib_bindSymbol(handle, cast(void**)&_tracechtype2, "_tracechtype2");
		dylib_bindSymbol(handle, cast(void**)&trace, "trace");
		dylib_bindSymbol(handle, cast(void**)&unctrl, "unctrl");
		dylib_bindSymbol(handle, cast(void**)&wunctrl, "wunctrl");

		dylib_bindSymbol(handle, cast(void**)&cursrc, "cursrc");
		dylib_bindSymbol(handle, cast(void**)&newscr, "newscr");
		dylib_bindSymbol(handle, cast(void**)&stdscr, "stdscr");
		dylib_bindSymbol(handle, cast(void**)&ttytype, "ttytype");
		dylib_bindSymbol(handle, cast(void**)&COLORS, "COLORS");
		dylib_bindSymbol(handle, cast(void**)&COLOR_PAIRS, "COLOR_PAIRS");
		dylib_bindSymbol(handle, cast(void**)&COLS, "COLS");
		dylib_bindSymbol(handle, cast(void**)&ESCDELAY, "ESCDELAY");
		dylib_bindSymbol(handle, cast(void**)&LINES, "LINES");
		dylib_bindSymbol(handle, cast(void**)&TABSIZE, "TABSIZE");

		return handle;
	}
}
else
{
	version(Posix) private enum string[] _libs = ["libncursesw.so"];

	mixin(DylibLoaderBuilder!("NCurses", _libs, riverd.ncurses.dynfun));
}

@system
unittest {
	void* _handle = dylib_load_ncurses();
	assert(dylib_is_loaded(_handle));

	dylib_unload(_handle);
}
