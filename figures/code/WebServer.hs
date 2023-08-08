main :: IO ()
main = do
  listenSock <- startListenSock
  forever $ do
    (sock, _) <- accept listenSock
    forkIO $ worker sock 

worker :: Socket -> IO ()
worker sock = do
  recvRequest ""
  sendAll sock reply
  close sock
