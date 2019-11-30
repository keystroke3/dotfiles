static const char norm_fg[] = "#8fc5c6";
static const char norm_bg[] = "#0c0816";
static const char norm_border[] = "#64898a";

static const char sel_fg[] = "#8fc5c6";
static const char sel_bg[] = "#D03C6E";
static const char sel_border[] = "#8fc5c6";

static const char urg_fg[] = "#8fc5c6";
static const char urg_bg[] = "#9E2A5E";
static const char urg_border[] = "#9E2A5E";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
