waitWhen0 :: Int -> Socket -> IO ()
waitWhen0 0 s = threadWaitWrite s
waitWhen0 _ _ = return ()

sendAll :: Socket      -- ^ Connected socket
        -> ByteString  -- ^ Data to send
        -> IO ()
sendAll _ "" = return ()
sendAll s bs0 = loop bs0
  where
    loop bs = do
        sent <- send s bs
        waitWhen0 sent s
        when (sent /= length bs) $ loop $ drop sent bs