static const char norm_fg[] = "#afc2d5";
static const char norm_bg[] = "#120819";
static const char norm_border[] = "#7a8795";

static const char sel_fg[] = "#afc2d5";
static const char sel_bg[] = "#4F368F";
static const char sel_border[] = "#afc2d5";

static const char urg_fg[] = "#afc2d5";
static const char urg_bg[] = "#34358C";
static const char urg_border[] = "#34358C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
