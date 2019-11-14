const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1c0a1b", /* black   */
  [1] = "#CA2B41", /* red     */
  [2] = "#EC5744", /* green   */
  [3] = "#FE7445", /* yellow  */
  [4] = "#FE8351", /* blue    */
  [5] = "#BE7386", /* magenta */
  [6] = "#FCBCA3", /* cyan    */
  [7] = "#f6e4d9", /* white   */

  /* 8 bright colors */
  [8]  = "#ac9f97",  /* black   */
  [9]  = "#CA2B41",  /* red     */
  [10] = "#EC5744", /* green   */
  [11] = "#FE7445", /* yellow  */
  [12] = "#FE8351", /* blue    */
  [13] = "#BE7386", /* magenta */
  [14] = "#FCBCA3", /* cyan    */
  [15] = "#f6e4d9", /* white   */

  /* special colors */
  [256] = "#1c0a1b", /* background */
  [257] = "#f6e4d9", /* foreground */
  [258] = "#f6e4d9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
