const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1c030d", /* black   */
  [1] = "#DE6E4A", /* red     */
  [2] = "#D28452", /* green   */
  [3] = "#F1945E", /* yellow  */
  [4] = "#D77C8B", /* blue    */
  [5] = "#DEB59B", /* magenta */
  [6] = "#FBDDC8", /* cyan    */
  [7] = "#f5e9e0", /* white   */

  /* 8 bright colors */
  [8]  = "#aba39c",  /* black   */
  [9]  = "#DE6E4A",  /* red     */
  [10] = "#D28452", /* green   */
  [11] = "#F1945E", /* yellow  */
  [12] = "#D77C8B", /* blue    */
  [13] = "#DEB59B", /* magenta */
  [14] = "#FBDDC8", /* cyan    */
  [15] = "#f5e9e0", /* white   */

  /* special colors */
  [256] = "#1c030d", /* background */
  [257] = "#f5e9e0", /* foreground */
  [258] = "#f5e9e0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
