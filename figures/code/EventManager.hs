-- From module GHC.Event.Manager
-- | The event manager state.
data EventManager = EventManager
    { emBackend      :: !Backend
    , emFds          :: !(Array Int (MVar (IntTable [FdData])))
    , emState        :: !(IORef State)
    , emUniqueSource :: !UniqueSource
    , emControl      :: !Control
    , emLock         :: !(MVar ())
    }


registerFd :: EventManager
	         -> IOCallback
					 -> Fd
					 -> Event
					 -> Lifetime
					 -> IO FdKey


-- From module GHC.Event.Internal
-- | Event notification backend.
data Backend = forall a. Backend {
      _beState :: !a

    -- | Poll backend for new events.  The provided callback is called
    -- once per file descriptor with new events.
    , _bePoll :: a
              -> Maybe Timeout              
              -> (Fd -> Event -> IO ())
              -> IO Int

    -- | Register, modify, or unregister interest in the given events
    -- on the given file descriptor.
    , _beModifyFd :: a
                  -> Fd   
                  -> Event
                  -> Event
                  -> IO Bool

    }

-- From module Control.Concurrent
-- | Blocks until fd is ready to read/write
-- Implemented directly using registerFd
threadWaitRead :: Fd -> IO ()
threadWaitRead :: Fd -> IO ()
