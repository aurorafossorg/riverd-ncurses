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

module riverd.ncurses.dynfun;

import riverd.ncurses.types;

__gshared {
	// stfu
	da_initscr initscr; ///
	da_longname longname; ///
	da_newpad newpad; ///
	da_newterm newterm; ///
	da_newwin newwin; ///
	da_set_term set_term; ///
	da_slk_label slk_label; ///
	da_subpad subpad; ///
	da_subwin subwin; ///
	da_termname termname; ///
	da_tigetstr tigetstr; ///
	da_tparm tparm; ///
	da_tiparm tiparm; ///
	da_keybound keybound; ///
	da_wgetparent wgetparent; ///
	da_new_prescr new_prescr; ///
	da_getwin_sp getwin_sp; ///
	da_longname_sp longname_sp; ///
	da_newpad_sp newpad_sp; ///
	da_newterm_sp newterm_sp; ///
	da_newwin_sp newwin_sp; ///
	da_getwin getwin; ///
	da_derwin derwin; ///
	da_dupwin dupwin; ///
	da_termname_sp termname_sp; ///
	da_slk_label_sp slk_label_sp; ///
	da_curses_version curses_version; ///
	da_keyname_sp keyname_sp; ///
	da_keyname keyname; ///
	da_addchnstr addchnstr; ///
	da_addchstr addchstr; ///
	da_addnstr addnstr; ///
	da_addstr addstr; ///
	da_attr_get attr_get; ///
	da_attr_off attr_off; ///
	da_attr_on attr_on; ///
	da_attr_set attr_set; ///
	da_baudrate baudrate; ///
	da_beep beep; ///
	da_can_change_color can_change_color; ///
	da_cbreak cbreak; ///
	da_clearok clearok; ///
	da_color_content color_content; ///
	da_copywin copywin; ///
	da_curs_set curs_set; ///
	da_def_prog_mode def_prog_mode; ///
	da_def_shell_mode def_shell_mode; ///
	da_delay_output delay_output; ///
	da_delscreen delscreen; ///
	da_delwin delwin; ///
	da_doupdate doupdate; ///
	da_echo echo; ///
	da_endwin endwin; ///
	da_erasechar erasechar; ///
	da_filter filter; ///
	da_flash flash; ///
	da_flushinp flushinp; ///
	da_getbkgd getbkgd; ///
	da_halfdelay halfdelay; ///
	da_has_colors has_colors; ///
	da_has_ic has_ic; ///
	da_has_il has_il; ///
	da_idcok idcok; ///
	da_idlok idlok; ///
	da_immedok immedok; ///
	da_init_color init_color; ///
	da_init_pair init_pair; ///
	da_intrflush intrflush; ///
	da_isendwin isendwin; ///
	da_is_wintouched is_wintouched; ///
	da_keypad keypad; ///
	da_killchar killchar; ///
	da_leaveok leaveok; ///
	da_meta meta; ///
	da_mvcur mvcur; ///
	da_mvderwin mvderwin; ///
	da_mvprintw mvprintw; ///
	da_mvscanw mvscanw; ///
	da_mvwaddch mvwaddch; ///
	da_mvwaddchnstr mvwaddchnstr; ///
	da_mvwaddchstr mvwaddchstr; ///
	da_mvwaddnstr mvwaddnstr; ///
	da_mvwaddstr mvwaddstr; ///
	da_mvwchgat mvwchgat; ///
	da_mvwdelch mvwdelch; ///
	da_mvwgetch mvwgetch; ///
	da_mvwgetnstr mvwgetnstr; ///
	da_mvwgetstr mvwgetstr; ///
	da_mvwhline mvwhline; ///
	da_mvwin mvwin; ///
	da_mvwprintw mvwprintw; ///
	da_mvwscanw mvwscanw; ///
	da_mvwvline mvwvline; ///
	da_napms napms; ///
	da_nl nl; ///
	da_nocbreak nocbreak; ///
	da_nodelay nodelay; ///
	da_noecho noecho; ///
	da_nonl nonl; ///
	da_noqiflush noqiflush; ///
	da_noraw noraw; ///
	da_notimeout notimeout; ///
	da_overlay overlay; ///
	da_overwrite overwrite; ///
	da_pair_content pair_content; ///
	da_PAIR_NUMBER PAIR_NUMBER; ///
	da_pechochar pechochar; ///
	da_pnoutrefresh pnoutrefresh; ///
	da_prefresh prefresh; ///
	da_printw printw; ///
	da_putwin putwin; ///
	da_qiflush qiflush; ///
	da_raw raw; ///
	da_redrawwin redrawwin; ///
	da_resetty resetty; ///
	da_reset_prog_mode reset_prog_mode; ///
	da_reset_shell_mode reset_shell_mode; ///
	da_ripoffline ripoffline; ///
	da_savetty savetty; ///
	da_scanw scanw; ///
	da_scr_dump scr_dump; ///
	da_scr_init scr_init; ///
	da_scrollok scrollok; ///
	da_scr_restore scr_restore; ///
	da_scr_set scr_set; ///
	da_setscrreg setscrreg; ///
	da_slk_attroff slk_attroff; ///
	da_slk_attron slk_attron; ///
	da_slk_attrset slk_attrset; ///
	da_slk_attr slk_attr; ///
	da_slk_attr_set slk_attr_set; ///
	da_slk_clear slk_clear; ///
	da_slk_color slk_color; ///
	da_slk_init slk_init; ///
	da_slk_noutrefresh slk_noutrefresh; ///
	da_slk_refresh slk_refresh; ///
	da_slk_restore slk_restore; ///
	da_slk_set slk_set; ///
	da_slk_touch slk_touch; ///
	da_start_color start_color; ///
	da_syncok syncok; ///
	da_termattrs termattrs; ///
	da_typeahead typeahead; ///
	da_ungetch ungetch; ///
	da_use_env use_env; ///
	da_use_tioctl use_tioctl; ///
	da_vidattr vidattr; ///
	da_vidputs vidputs; ///
	da_vwprintw vwprintw; ///
	da_vw_printw vw_printw; ///
	da_vwscanw vwscanw; ///
	da_vw_scanw vw_scanw; ///
	da_waddch waddch; ///
	da_waddchnstr waddchnstr; ///
	da_waddchstr waddchstr; ///
	da_waddnstr waddnstr; ///
	da_wattrset wattrset; ///
	da_wattr_get wattr_get; ///
	da_wattr_on wattr_on; ///
	da_wattr_off wattr_off; ///
	da_wattr_set wattr_set; ///
	da_wbkgd wbkgd; ///
	da_wbkgdset wbkgdset; ///
	da_wborder wborder; ///
	da_wchgat wchgat; ///
	da_wclear wclear; ///
	da_wclrtobot wclrtobot; ///
	da_wclrtoeol wclrtoeol; ///
	da_wcolor_set wcolor_set; ///
	da_wcursyncup wcursyncup; ///
	da_wdelch wdelch; ///
	da_wechochar wechochar; ///
	da_werase werase; ///
	da_wgetch wgetch; ///
	da_wgetnstr wgetnstr; ///
	da_whline whline; ///
	da_winch winch; ///
	da_winchnstr winchnstr; ///
	da_winnstr winnstr; ///
	da_winsch winsch; ///
	da_winsdelln winsdelln; ///
	da_winsnstr winsnstr; ///
	da_wmove wmove; ///
	da_wnoutrefresh wnoutrefresh; ///
	da_wprintw wprintw; ///
	da_wredrawln wredrawln; ///
	da_wrefresh wrefresh; ///
	da_wscanw wscanw; ///
	da_wscrl wscrl; ///
	da_wsetscrreg wsetscrreg; ///
	da_wsyncdown wsyncdown; ///
	da_wsyncup wsyncup; ///
	da_wtimeout wtimeout; ///
	da_wtouchln wtouchln; ///
	da_wvline wvline; ///
	da_tigetflag tigetflag; ///
	da_tigetnum tigetnum; ///
	da_putp putp; ///
	da_getattrs getattrs; ///
	da_is_term_resized is_term_resized; ///
	da_alloc_pair alloc_pair; ///
	da_assume_default_colors assume_default_colors; ///
	da_define_key define_key; ///
	da_extended_color_content extended_color_content; ///
	da_extended_pair_content extended_pair_content; ///
	da_extended_slk_color extended_slk_color; ///
	da_find_pair find_pair; ///
	da_free_pair free_pair; ///
	da_get_escdelay get_escdelay; ///
	da_init_extended_color init_extended_color; ///
	da_init_extended_pair init_extended_pair; ///
	da_key_defined key_defined; ///
	da_keyok keyok; ///
	da_reset_color_pairs reset_color_pairs; ///
	da_resize_term resize_term; ///
	da_resizeterm resizeterm; ///
	da_set_escdelay set_escdelay; ///
	da_set_tabsize set_tabsize; ///
	da_use_default_colors use_default_colors; ///
	da_use_extended_names use_extended_names; ///
	da_use_legacy_coding use_legacy_coding; ///
	da_use_screen use_screen; ///
	da_use_window use_window; ///
	da_wresize wresize; ///
	da_nofilter nofilter; ///
	da_is_cleared is_cleared; ///
	da_is_idcok is_idcok; ///
	da_is_idlok is_idlok; ///
	da_is_immedok is_immedok; ///
	da_is_keypad is_keypad; ///
	da_is_leaveok is_leaveok; ///
	da_is_nodelay is_nodelay; ///
	da_is_notimeout is_notimeout; ///
	da_is_pad is_pad; ///
	da_is_scrollok is_scrollok; ///
	da_is_subwin is_subwin; ///
	da_is_syncok is_syncok; ///
	da_wgetdelay wgetdelay; ///
	da_wgetscrreg wgetscrreg; ///
	da_baudrate_sp baudrate_sp; ///
	da_beep_sp beep_sp; ///
	da_can_change_color_sp can_change_color_sp; ///
	da_cbreak_sp cbreak_sp; ///
	da_curs_set_sp curs_set_sp; ///
	da_color_content_sp color_content_sp; ///
	da_def_prog_mode_sp def_prog_mode_sp; ///
	da_def_shell_mode_sp def_shell_mode_sp; ///
	da_delay_output_sp delay_output_sp; ///
	da_doupdate_sp doupdate_sp; ///
	da_echo_sp echo_sp; ///
	da_endwin_sp endwin_sp; ///
	da_erasechar_sp erasechar_sp; ///
	da_filter_sp filter_sp; ///
	da_flash_sp flash_sp; ///
	da_flushinp_sp flushinp_sp; ///
	da_halfdelay_sp halfdelay_sp; ///
	da_has_colors_sp has_colors_sp; ///
	da_has_ic_sp has_ic_sp; ///
	da_has_il_sp has_il_sp; ///
	da_init_color_sp init_color_sp; ///
	da_init_pair_sp init_pair_sp; ///
	da_intrflush_sp intrflush_sp; ///
	da_isendwin_sp isendwin_sp; ///
	da_killchar_sp killchar_sp; ///
	da_mvcur_sp mvcur_sp; ///
	da_napms_sp napms_sp; ///
	da_nl_sp nl_sp; ///
	da_nocbreak_sp nocbreak_sp; ///
	da_noecho_sp noecho_sp; ///
	da_nonl_sp nonl_sp; ///
	da_noqiflush_sp noqiflush_sp; ///
	da_noraw_sp noraw_sp; ///
	da_pair_content_sp pair_content_sp; ///
	da_qiflush_sp qiflush_sp; ///
	da_raw_sp raw_sp; ///
	da_reset_prog_mode_sp reset_prog_mode_sp; ///
	da_reset_shell_mode_sp reset_shell_mode_sp; ///
	da_resetty_sp resetty_sp; ///
	da_ripoffline_sp ripoffline_sp; ///
	da_savetty_sp savetty_sp; ///
	da_scr_init_sp scr_init_sp; ///
	da_scr_restore_sp scr_restore_sp; ///
	da_scr_set_sp scr_set_sp; ///
	da_slk_attroff_sp slk_attroff_sp; ///
	da_slk_attron_sp slk_attron_sp; ///
	da_slk_attrset_sp slk_attrset_sp; ///
	da_slk_attr_sp slk_attr_sp; ///
	da_slk_attr_set_sp slk_attr_set_sp; ///
	da_slk_clear_sp slk_clear_sp; ///
	da_slk_color_sp slk_color_sp; ///
	da_slk_init_sp slk_init_sp; ///
	da_slk_noutrefresh_sp slk_noutrefresh_sp; ///
	da_slk_refresh_sp slk_refresh_sp; ///
	da_slk_restore_sp slk_restore_sp; ///
	da_slk_set_sp slk_set_sp; ///
	da_slk_touch_sp slk_touch_sp; ///
	da_start_color_sp start_color_sp; ///
	da_termattrs_sp termattrs_sp; ///
	da_typeahead_sp typeahead_sp; ///
	da_ungetch_sp ungetch_sp; ///
	da_use_env_sp use_env_sp; ///
	da_use_tioctl_sp use_tioctl_sp; ///
	da_vidattr_sp vidattr_sp; ///
	da_vidputs_sp vidputs_sp; ///
	da_keybound_sp keybound_sp; ///
	da_alloc_pair_sp alloc_pair_sp; ///
	da_assume_default_colors_sp assume_default_colors_sp; ///
	da_define_key_sp define_key_sp; ///
	da_extended_color_content_sp extended_color_content_sp; ///
	da_extended_pair_content_sp extended_pair_content_sp; ///
	da_extended_slk_color_sp extended_slk_color_sp; ///
	da_get_escdelay_sp get_escdelay_sp; ///
	da_find_pair_sp find_pair_sp; ///
	da_free_pair_sp free_pair_sp; ///
	da_init_extended_color_sp init_extended_color_sp; ///
	da_init_extended_pair_sp init_extended_pair_sp; ///
	da_is_term_resized_sp is_term_resized_sp; ///
	da_key_defined_sp key_defined_sp; ///
	da_keyok_sp keyok_sp; ///
	da_nofilter_sp nofilter_sp; ///
	da_reset_color_pairs_sp reset_color_pairs_sp; ///
	da_resize_term_sp resize_term_sp; ///
	da_resizeterm_sp resizeterm_sp; ///
	da_set_escdelay_sp set_escdelay_sp; ///
	da_set_tabsize_sp set_tabsize_sp; ///
	da_use_default_colors_sp use_default_colors_sp; ///
	da_use_legacy_coding_sp use_legacy_coding_sp; ///
	da_has_mouse has_mouse; ///
	da_getmouse getmouse; ///
	da_ungetmouse ungetmouse; ///
	da_mousemask mousemask; ///
	da_wenclose wenclose; ///
	da_mouseinterval mouseinterval; ///
	da_wmouse_trafo wmouse_trafo; ///
	da_has_mouse_sp has_mouse_sp; ///
	da_getmouse_sp getmouse_sp; ///
	da_ungetmouse_sp ungetmouse_sp; ///
	da_mousemask_sp mousemask_sp; ///
	da_mouseinterval_sp mouseinterval_sp; ///
	da_mcprint mcprint; ///
	da_has_key has_key; ///
	da_has_key_sp has_key_sp; ///
	da_mcprint_sp mcprint_sp; ///
	da__tracef _tracef; ///
	da__traceattr _traceattr; ///
	da__traceattr2 _traceattr2; ///
	da__tracechar _tracechar; ///
	da__tracechtype _tracechtype; ///
	da__tracechtype2 _tracechtype2; ///
	da_trace trace; ///
	da_unctrl unctrl; ///
	da_wunctrl wunctrl; ///

	da_cursrc cursrc; ///
	da_newscr newscr; ///
	da_newscr stdscr; ///
	da_ttytype ttytype; ///
	da_COLORS COLORS; ///
	da_COLOR_PAIRS COLOR_PAIRS; ///
	da_COLS COLS; ///
	da_ESCDELAY ESCDELAY; ///
	da_LINES LINES; ///
	da_TABSIZE TABSIZE; ///
}
