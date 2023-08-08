data URingManager = URingManager
    { uring :: !URing.URing
    , requests :: !(IORef (IntMap.IntMap PendingReq))
    , queueDepth :: !Int
    , tableLock :: !(MVar ())
    }