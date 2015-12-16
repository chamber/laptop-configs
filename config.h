/* See LICENSE file for copyright and license details. */
#define MONKEY          Mod4Mask
/* appearance */
static const char font[]            = "-*-ohsnap.icons-medium-r-*-*-11-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#000000";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#000000";
static const char selbgcolor[]      = "#000000";
static const char selfgcolor[]      = "#eeeeee";
static const char occbordercolor[]  = "#8EB0AA";
static const char occbgcolor[]      = "#5E5474";
static const char occfgcolor[]      = "#bbbbbb";
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const Bool showsystray       = True;           /* false means no systray */
static const unsigned int gappx     = 5;        /* gap pixel of windows */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = {"Term","Media","File","WWW","Mail"};

static const Rule rules[] = {
         /* class      instance    title       tags mask     isfloating   monitor     */
         { "urxvt",     NULL,       NULL,       0,            True,        -1 },
         { "chromium",  NULL,       NULL,       1 << 3,       False,       -1 },
         { "Pcmanfm",   NULL,       NULL,       1 << 2,       False,       -1 },
         { "MPlayer",   NULL,       NULL,       1 << 1,       True,        -1 },
         { "vlc",       NULL,       NULL,       1 << 1,       True,        -1 },
         { "Calibre",   NULL,       NULL,       1 << 1,       False,       -1 },
	 {  NULL,       NULL,      "mutt",      1 << 4,       True,        -1 },
	 {  NULL,       NULL,      "ncmpcpp",   1 << 1,       True,        -1 },
 };


/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol   arrange function */
	{ "ü",      bstack },
	{ "þ",      tile },    /* first entry is default */
	{ "ý",      NULL },    /* no layout function means floating behavior */
	{ "ÿ",      monocle },
	{ "û",      bstackhoriz },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", "Hermit-7", "-b", "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "urxvt", NULL };
static const char *filecmd[] = { "pcmanfm", NULL };
static const char *mailcmd[] = { "urxvt", "-title", "mutt", "-e", "mutt", NULL };
static const char *musiccmd[] = { "urxvt", "-title", "ncmpcpp", "-e", "ncmpcpp", NULL };
static const char *webcmd[] = { "chromium", NULL };
static const char *prts[] = { "scrot", NULL };
static const char *play[] = { "ncmpcpp", "toggle" };
static const char *stop[] = { "ncmpcpp", "stop" };
static const char *prev[] = { "ncmpcpp", "prev" };
static const char *next[] = { "ncmpcpp", "next" };
static const char *mute[] = { "amixer", "-q", "set", "PCM", "toggle", NULL };
static const char *volu[] = { "amixer", "-q", "set", "PCM", "5%+", "unmute", NULL };
static const char *vold[] = { "amixer", "-q", "set", "PCM", "5%-", "unmute", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_m,      spawn,          {.v = mailcmd } },
	{ MODKEY|ShiftMask,             XK_n,      spawn,          {.v = musiccmd } },
	{ MODKEY|ShiftMask,             XK_f,      spawn,          {.v = filecmd } },
	{ MODKEY,                       XK_w,      spawn,          {.v = webcmd } },	
        { MONKEY,                       XK_F5,     spawn,          {.v = play } },
        { MONKEY,                       XK_F6,     spawn,          {.v = stop } },
        { MONKEY,                       XK_F7,     spawn,          {.v = prev } },
        { MONKEY,                       XK_F8,     spawn,          {.v = next } },
        { MONKEY,                       XK_F10,    spawn,          {.v = mute } },
        { MONKEY,                       XK_F11,    spawn,          {.v = vold } },
        { MONKEY,                       XK_F12,    spawn,          {.v = volu } },
        { MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_b,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ShiftMask,             XK_h,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

