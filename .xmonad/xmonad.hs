import XMonad
import qualified XMonad.StackSet as W
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Data.Map    (fromList)
import Data.Monoid (mappend)

myWorkspaces = ["Dev","Net","Chat","Mail"] ++ map show [5..8] ++ ["Bground"]

myBorderWidth = 1
normalColor   = "#FFFFFF"
focusedColor  = "#FF0000"

myManageHook = composeAll
  [ className =? "Chromium"       --> doShift "Net"
  , className =? "XChat"          --> doShift "Chat"
  , className =? "Skype"          --> doShift "Chat"
  , className =? "Pidgin"         --> doShift "Chat"
  , className =? "Evolution"      --> doShift "Mail"
  , className =? "Transmissision" --> doShift "Bground"
  , className =? "Gimp"           --> doFloat
  , className =? "MPlayer"        --> unfloat
  , manageDocks
  ]
 where unfloat = ask >>= doF . W.sink

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled   = Tall nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/lambdanaut/.xmobarrc" --Start up Xmobar
  xmonad $ defaultConfig
    { manageHook = myManageHook <+> manageHook defaultConfig
    , workspaces = myWorkspaces
    , borderWidth = myBorderWidth
    , normalBorderColor = normalColor
    , focusedBorderColor = focusedColor
    , layoutHook = avoidStruts $ myLayout
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "green" "" . shorten 50
      }
    , modMask = mod1Mask
    } `additionalKeys`
    -- Launch a terminal
    [ ((mod1Mask .|. shiftMask, xK_Return), spawn $ "python ~/.bin/randurxvt.py")
    -- Launch gmrun
    , ((mod1Mask .|. shiftMask, xK_p     ), spawn "gmrun")
    -- take screenshot of screen
    , ((0, xK_Print), spawn "scrot ~/screenshot.png")
    
    -- , ((0, xK_F6), lowerVolume 50 >> return ())
    -- , ((0, xK_F7), raiseVolume 50 >> return ())
    ]
