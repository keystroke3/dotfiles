const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#120819", /* black   */
  [1] = "#34358C", /* red     */
  [2] = "#4F368F", /* green   */
  [3] = "#334E9D", /* yellow  */
  [4] = "#5E55A3", /* blue    */
  [5] = "#9766AA", /* magenta */
  [6] = "#C165A6", /* cyan    */
  [7] = "#afc2d5", /* white   */

  /* 8 bright colors */
  [8]  = "#7a8795",  /* black   */
  [9]  = "#34358C",  /* red     */
  [10] = "#4F368F", /* green   */
  [11] = "#334E9D", /* yellow  */
  [12] = "#5E55A3", /* blue    */
  [13] = "#9766AA", /* magenta */
  [14] = "#C165A6", /* cyan    */
  [15] = "#afc2d5", /* white   */

  /* special colors */
  [256] = "#120819", /* background */
  [257] = "#afc2d5", /* foreground */
  [258] = "#afc2d5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
