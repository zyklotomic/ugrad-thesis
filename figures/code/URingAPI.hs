-- From io_uring Haskell library
newtype SqeBuilder a = SqeBuilder { pokeSqe :: Ptr Sqe -> IO a }

-- From URingManager library 
type URingRes = Int32

supportsIOURing :: Bool

submitBlocking :: (UserData -> SqeBuilder ()) -> IO URingRes
