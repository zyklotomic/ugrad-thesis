// From liburing
int io_uring_queue_init(unsigned entries, struct io_uring *ring, unsigned flags);
struct io_uring_sqe *io_uring_get_sqe(struct io_uring *ring);
int io_uring_submit(struct io_uring *ring);
void io_uring_prep_read(struct io_uring_sqe *sqe,
                       int fd,
                       void *buf,
                       unsigned nbytes,
                       __u64 offset);

// Synchronous read(2) syscall
ssize_t read(int fd, void *buf, size_t count);