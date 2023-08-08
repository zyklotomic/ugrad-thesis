newMVar :: IO (MVar a) 
takeMVar :: MVar a -> IO a
putMVar :: MVar a -> a -> IO ()
