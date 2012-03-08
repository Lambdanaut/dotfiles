import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
--import XMonad.Actions.Volume
import XMonad.Actions.SinkAll

import qualified Data.Map as M

myModMask = mod1Mask

myTerminal = "python ~/.bin/randurxvt.py"

myWorkspaces = ["Dev","Net","Chat","Files"] ++ map show [5..8] ++ ["Bground"]

myBorderWidth = 1
normalColor   = "#FFFFFF"
focusedColor  = "#FF0000"

myManageHook = composeAll
  [ className =? "Chromium"       --> doShift "Net"
  , className =? "XChat"          --> doShift "Chat"
  , className =? "Skype"          --> doShift "Chat"
  , className =? "Pidgin"         --> doShift "Chat"
  , className =? "Thunar"         --> doShift "Files"
  , className =? "Transmissision" --> doShift "Bground"
  , className =? "Gimp"           --> doFloat
  ]

myLayout = tiled ||| Mirror tiled  ||| Full
  where
    tiled   = Tall nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

myKeys (XConfig {modMask = myModMask}) = M.fromList $
    -- Launch gmrun
    [ ((myModMask .|. shiftMask, xK_p     ), spawn "gmrun")
    -- Take screenshot of screen
    , ((0, xK_Print), spawn "scrot ~/screenshot.png")
    -- Mute volume
    , ((0, xK_F6), spawn "amixer set Master mute")
    , ((0, xK_F7), spawn "amixer set Master unmute")
    -- Unfloat all windows on current workspace
    , ((myModMask .|. shiftMask, xK_e), sinkAll)
    ]


main = 
  xmonad =<< xmobar defaultConfig
    { manageHook         = myManageHook <+> manageHook defaultConfig
    , workspaces         = myWorkspaces
    , borderWidth        = myBorderWidth
    , normalBorderColor  = normalColor
    , focusedBorderColor = focusedColor
    , layoutHook         = myLayout
    , modMask            = myModMask
    , terminal           = myTerminal
    , keys               = myKeys <+> keys defaultConfig
    }
