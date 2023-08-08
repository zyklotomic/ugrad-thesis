sendBuf :: Socket     -- Bound/Connected Socket
        -> Ptr Word8  -- Pointer to the data to send
        -> Int        -- Length of the buffer
        -> IO Int     -- Number of Bytes sent
sendBuf s str len = fromIntegral <$> do
#if defined(mingw32_HOST_OS)
-- ... abridged for conciseness
#else
    withFdSocket s $ \fd ->
        if UM.supportsIOURing
            then U.throwSocketErrorIfCqeResNegative "Network.Socket.sendBuf uring"
                    (fromIntegral <$> (UM.submitBlocking (U.send fd str clen flags)))
            else throwSocketErrorWaitWrite s "Network.Socket.sendBuf"
                    (c_send fd str clen flags)
	where
		flags = 0
		clen = fromIntegral len
#endif