static const char norm_fg[] = "#f5e9e0";
static const char norm_bg[] = "#1c030d";
static const char norm_border[] = "#aba39c";

static const char sel_fg[] = "#f5e9e0";
static const char sel_bg[] = "#D28452";
static const char sel_border[] = "#f5e9e0";

static const char urg_fg[] = "#f5e9e0";
static const char urg_bg[] = "#DE6E4A";
static const char urg_border[] = "#DE6E4A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
