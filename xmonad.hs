import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Actions.Volume

import qualified Data.Map as M

myTerminal = "python ~/.bin/randurxvt.py"

myWorkspaces = ["Dev","Net","Chat"] ++ map show [4..8] ++ ["Bground"]

myBorderWidth = 1
normalColor   = "#FFFFFF"
focusedColor  = "#FF0000"

myManageHook = composeAll
  [ className =? "Chromium"       --> doShift "Net"
  , className =? "XChat"          --> doShift "Chat"
  , className =? "Skype"          --> doShift "Chat"
  , className =? "Pidgin"         --> doShift "Chat"
  , className =? "Transmissision" --> doShift "Bground"
  , className =? "Gimp"           --> doFloat
  ]

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled   = Tall nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

myKeys (XConfig {modMask = mod1Mask}) = M.fromList $
    -- Launch gmrun
    [ ((mod1Mask .|. shiftMask, xK_p     ), spawn "gmrun")
    -- Take screenshot of screen
    , ((0, xK_Print), spawn "scrot ~/screenshot.png")
    -- Change Volume
    , ((0, xK_F6), lowerVolume 50 >> return ())
    , ((0, xK_F7), raiseVolume 50 >> return ())
    ]

main = 
  xmonad =<< xmobar defaultConfig
    { manageHook         = myManageHook <+> manageHook defaultConfig
    , workspaces         = myWorkspaces
    , borderWidth        = myBorderWidth
    , normalBorderColor  = normalColor
    , focusedBorderColor = focusedColor
    , layoutHook         = myLayout
    , modMask            = mod1Mask
    , terminal           = myTerminal
    , keys               = myKeys <+> keys defaultConfig
    }