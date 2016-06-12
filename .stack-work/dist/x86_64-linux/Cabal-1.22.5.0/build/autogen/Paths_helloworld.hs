module Paths_helloworld (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/theironsamurai/Code/helloworld/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/bin"
libdir     = "/home/theironsamurai/Code/helloworld/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/lib/x86_64-linux-ghc-7.10.3/helloworld-0.1.0.0-LcmJCjfKuj651oaVRHuNpn"
datadir    = "/home/theironsamurai/Code/helloworld/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/share/x86_64-linux-ghc-7.10.3/helloworld-0.1.0.0"
libexecdir = "/home/theironsamurai/Code/helloworld/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/libexec"
sysconfdir = "/home/theironsamurai/Code/helloworld/.stack-work/install/x86_64-linux/lts-6.2/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "helloworld_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "helloworld_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "helloworld_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "helloworld_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "helloworld_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
