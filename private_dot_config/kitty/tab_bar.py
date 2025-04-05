# pyright: reportMissingImports=false
import datetime
from getpass import getuser
from socket import gethostname

from kitty.fast_data_types import Screen, get_options
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_tab_with_powerline,
)
from kitty.utils import color_as_int

opts = get_options()

PURPLE = as_rgb(0xAF5FD7)
GRAY = as_rgb(color_as_int(opts.inactive_tab_foreground))

RIGHT_SEP = "|"


def _draw_right_status(screen: Screen, is_last: bool) -> int:
    if not is_last:
        return screen.cursor.x
    draw_attributed_string(Formatter.reset, screen)

    bg = screen.cursor.bg
    cells = [
        (PURPLE, bg, getuser()),
        (GRAY, bg, f"@{gethostname()} {RIGHT_SEP}"),
        (PURPLE, bg, datetime.datetime.now().strftime(" %d %b %H:%M ")),
    ]

    right_status_length = sum(len(cell[2]) for cell in cells)
    draw_spaces = screen.columns - screen.cursor.x - right_status_length
    if draw_spaces > 0:
        screen.draw(" " * draw_spaces)

    for fg, bg, cell in cells:
        screen.cursor.fg = fg
        screen.cursor.bg = bg
        screen.draw(cell)
    screen.cursor.fg = 0
    screen.cursor.bg = 0

    screen.cursor.x = max(screen.cursor.x, screen.columns - right_status_length)
    return screen.cursor.x


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    end = draw_tab_with_powerline(
        draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
    )

    _draw_right_status(screen, is_last)
    return end
