const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c0816", /* black   */
  [1] = "#9E2A5E", /* red     */
  [2] = "#D03C6E", /* green   */
  [3] = "#9D596B", /* yellow  */
  [4] = "#378B77", /* blue    */
  [5] = "#346D8A", /* magenta */
  [6] = "#CD6A8C", /* cyan    */
  [7] = "#8fc5c6", /* white   */

  /* 8 bright colors */
  [8]  = "#64898a",  /* black   */
  [9]  = "#9E2A5E",  /* red     */
  [10] = "#D03C6E", /* green   */
  [11] = "#9D596B", /* yellow  */
  [12] = "#378B77", /* blue    */
  [13] = "#346D8A", /* magenta */
  [14] = "#CD6A8C", /* cyan    */
  [15] = "#8fc5c6", /* white   */

  /* special colors */
  [256] = "#0c0816", /* background */
  [257] = "#8fc5c6", /* foreground */
  [258] = "#8fc5c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
