--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.KeyRemap

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.UrgencyHook
import System.IO ( Handle, hFlush, hPutStrLn, IOMode(AppendMode), hClose, openFile )

import Dzen

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "urxvt"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Width of the window border in pixels.
--
myBorderWidth   = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
-- mod1Mask: alt
-- myModMask       = mod1Mask

-- mod4Mask: shift + [Win]
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["X", "s", "chrome", "v", "FM", "6", "7", "w", "9"]

-- Border colors for unfocused and focused windows, respectively.
--
--myNormalBorderColor  = "#dddddd"
myNormalBorderColor  = "#333333"
-- myFocusedBorderColor = "#ff0000"
-- myFocusedBorderColor = "#88a470"
myFocusedBorderColor = "#88a4e0"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--

modm = myModMask

-- include Default Config:
-- /usr/share/xmonad-0.10/man/xmonad.hs

keysDefault = keys defaultConfig
keysToAdd x =
    [

    -- XF86AudioMute
    -- XF86AudioLowerVolume
    -- XF86AudioRaiseVolume
    -- XF86Back
    -- XF86Forward
    -- Close focused window: Alt + F4 
    ((mod1Mask,		xK_F4),		kill)

    -- volume control
    , ((0           , xF86XK_AudioMute ), spawn "amixer -q set Master toggle")
    , ((0           , xF86XK_AudioLowerVolume ), spawn "amixer -q set Master 2dB- unmute")
    , ((0           , xF86XK_AudioRaiseVolume ), spawn "amixer -q set Master 2dB+ unmute")

    -- Lock screen: Fn + F2
    , ((0           , 0x1008FF2D ), spawn "xscreensaver-command --lock")  

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Open file browser
    , ((modm .|. shiftMask, xK_t     ), spawn "thunar")

    -- Move focus to the next window, {modm,alt} + Tab
    , ((mod1Mask,           xK_Tab   ), windows W.focusDown)
    --
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "killall dzen2 conky; xmonad --recompile; xmonad --restart")
    ]
 
keysToDel x =
    [
    -- ((modm .|. shiftMask), xK_c)
    (modm              , xK_q     )
    ]

-- to include new keys to existing keys  
-- newKeys x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x))
     
--myKeys x = foldr M.delete (newKeys x) (keysToDel x) -- to delete the unused keys  

keysStrip x = foldr M.delete		(keysDefault x)	(keysToDel x)
myKeys x    = foldr (uncurry M.insert)	(keysStrip x)	(keysToAdd x)

-- myKeys x = M.union (keysStrip x) (M.fromList (keysToAdd x))
     

--myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
--
    -- launch a terminal
--    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- lock screen
    -- , ((modm .|. shiftMask, xK_l     ), spawn "xscreensaver-command --lock")
    -- Fn + F2
--    , ((0           , 0x1008FF2D ), spawn "xscreensaver-command --lock")  

    -- launch dmenu
--    , ((modm,               xK_p     ), spawn "dmenu_run")

    -- -- launch gmrun
    -- , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
--    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
--    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
--    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
--    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
--    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
--    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
--    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
--    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
--    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
--    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
--    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
--    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
--    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
--    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Open file browser
--    , ((modm .|. shiftMask, xK_t     ), spawn "thunar")

    -- Increment the number of windows in the master area
--    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
--    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
--    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
--    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
--    ]
--    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
--    [((m .|. modm, k), windows $ f i)
--        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
--        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
--    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
--    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
--        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
--        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
-- myLayout = tiled ||| Mirror tiled ||| Full
myLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

-- Define layout for specific workspaces  
--  import XMonad.Layout.NoBorders  
-- nobordersLayout = noBorders $ Full  
     
-- Put all layouts together  
-- myLayout = onWorkspace "chrome" nobordersLayout $ defaultLayouts 

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
-- http://www.linuxandlife.com/2011/11/how-to-configure-xmonad-arch-linux.html
--
-- Use ``xprop'' to get the WM_CLASS of an application.
--
myManageHook = composeAll
    [ className =? "Smplayer"		--> doShift "v"
    , className =? "Gimp"		--> doShift "w"
    , className =? "URxvt"		--> doFloat
    , className =? "google-chrome"	--> doShift "chrome"
    , className =? "Thunar"		--> doShift "FM"
    , className =? "libreoffice-startcenter"	--> doShift "w"
    , className =? "libreoffice-writer"	--> doShift "w"
    , className =? "libreoffice-impress"	--> doShift "w"
    , resource  =? "desktop_window"	--> doIgnore
    , resource  =? "kdesktop"		--> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--myLogHook = return ()
myLogHook h = dynamicLogWithPP $ defaultPP
    -- display current workspace as darkgrey on light grey (opposite of default colors)
    { ppCurrent         = dzenColor "#303030" "#909090" . pad 

    -- display other workspaces which contain windows as a brighter grey
    , ppHidden          = dzenColor "#909090" "" . pad 

    -- display other workspaces with no windows as a normal grey
    , ppHiddenNoWindows = dzenColor "#606060" "" . pad 

    -- display the current layout as a brighter grey
    , ppLayout          = dzenColor "#909090" "#606060" . pad 

    -- if a window on a hidden workspace needs my attention, color it so
    , ppUrgent          = dzenColor "#ff0000" "" . pad . dzenStrip

    -- shorten if it goes over 500 characters
    , ppTitle           = shorten 500  

    -- no separator between workspaces
    , ppWsSep           = ""

    -- put a few spaces between each object
    , ppSep             = "  "

    , ppOutput          = hPutStrLn h -- ... must match the h here
    }


-- 
-- StatusBars
-- 
myLeftBar :: DzenConf
myLeftBar = defaultDzen
    -- use the default as a base and override width and
    -- colors
    { width   = Just $ Percent 50
    , fgColor = Just "#909090"
    , bgColor = Just "#303030"
    -- , font = Just "-*-monaco-medium-r-normal-*-12-*-*-*-*-*-*-*"
    -- , font = Just "WenQuanYi Micro Hei Mono-9"
    , font = Just "WenQuanYi Zen Hei-14"
    }

myRightBar :: DzenConf
myRightBar = myLeftBar
    -- use the left one as a base and override just the
    -- x position and width
    { xPosition = Just $ Percent 30
    , width     = Just $ Percent 70
    , alignment = Just RightAlign
    }
 
-----------------------------------------------------------------------
-- My KeyBindings (Remap)

--KeymapTable v = [((0, xK_z), (shiftMask, xK_5))] -- would bind 'a' to '%'
--buildKeyR = buildKeyRemapBindings :: [KeymapTable] -> [((KeyMask, KeySym), X ())]
--
--KeymapTable vv = v
--    ++
--    buildKeyR
--
--asd = setKeyRemap :: vv -> X ()
--    ++
--    buildKeyR
--    buildKeyRemapBindings :: [KeymapTable] -> [((KeyMask, KeySym), X ())]

--myStartupHook K = 
--    setDefaultKeyRemap :: KeymapTable -> [KeymapTable] -> X ()
------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = return ()

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
-- main = xmonad defaults

-- xmproc <- spawnPipe "/usr/bin/xmobar /home/linpc/.xmobarrc"
-- d <- spawnDzen defaultDzenXft { screen = Just 0 }
main = do 
d <- spawnDzen myLeftBar
--spawnToDzen "conky -c ~/data/xmonad-config/data/conky/main" myRightBar
spawnToDzen "conky -c ~/.conkyrc" myRightBar
xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        -- numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
 
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
 
      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        logHook            = myLogHook d,
        startupHook        = myStartupHook
--	startupHook        = spawn "conky -c ~/data/xmonad-config/data/conky/main"
    }

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
-- defaults = defaultConfig {
--       -- simple stuff
--         terminal           = myTerminal,
--         focusFollowsMouse  = myFocusFollowsMouse,
--         borderWidth        = myBorderWidth,
--         modMask            = myModMask,
--         workspaces         = myWorkspaces,
--         normalBorderColor  = myNormalBorderColor,
--         focusedBorderColor = myFocusedBorderColor,
-- 
--       -- key bindings
--         keys               = myKeys,
--         mouseBindings      = myMouseBindings,
-- 
--       -- hooks, layouts
--         layoutHook         = myLayout,
--         manageHook         = myManageHook,
--         handleEventHook    = myEventHook,
--         logHook            = myLogHook,
--         startupHook        = myStartupHook
--     }
