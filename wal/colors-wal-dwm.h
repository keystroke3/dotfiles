static const char norm_fg[] = "#f6e4d9";
static const char norm_bg[] = "#1c0a1b";
static const char norm_border[] = "#ac9f97";

static const char sel_fg[] = "#f6e4d9";
static const char sel_bg[] = "#EC5744";
static const char sel_border[] = "#f6e4d9";

static const char urg_fg[] = "#f6e4d9";
static const char urg_bg[] = "#CA2B41";
static const char urg_border[] = "#CA2B41";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
