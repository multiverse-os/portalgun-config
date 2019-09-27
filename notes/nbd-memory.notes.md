nbdkit-captive — run nbdkit under another process and have it reliably cleaned up
Synopsis

 nbdkit PLUGIN [...] --run "CMD ARGS ..."

 nbdkit --exit-with-parent PLUGIN [...]

Description

You can run nbdkit under another process and have nbdkit reliably clean up.  There are two techniques depending on whether you want nbdkit to start the other process (“Captive Nbdkit”), or if you want the other process to start nbdkit (“Exit with Parent”).
Captive Nbdkit

You can run nbdkit as a “captive process”, using the --run option. This means that nbdkit runs as long as (for example) qemu(1) or guestfish(1) is running.  When those exit, nbdkit is killed.

Some examples should make this clear.

To run nbdkit captive under qemu:

 nbdkit file disk.img --run 'qemu -drive file=$nbd,if=virtio'

On the qemu command line, $nbd is substituted automatically with the right NBD path so it can connect to nbdkit.  When qemu exits, nbdkit is killed and cleaned up automatically.

Running nbdkit captive under guestfish:

 nbdkit file disk.img --run 'guestfish --format=raw -a $nbd -i'

When guestfish exits, nbdkit is killed.

The following shell variables are available in the --run argument:

$uri

    A URI that refers to the nbdkit port or socket in the preferred form documented by the NBD project.
$nbd

    An older URL that refers to the nbdkit port or socket in a manner specific to certain tools.

    Note there is some magic here, since qemu and guestfish URLs have a different format, so nbdkit tries to guess which you are running.  If the magic doesn't work, try using the variables below instead.
$port

    If ≠ "", the port number that nbdkit is listening on.
$unixsocket

    If ≠ "", the Unix domain socket that nbdkit is listening on.

--run implies --foreground.  It is not possible, and probably not desirable, to have nbdkit fork into the background when using --run.

Even when running captive, nbdkit still listens on the regular TCP/IP port, unless you specify the -p/-U options.  If you want a truly private captive nbdkit, then you should create a private random Unix socket, like this:

 nbdkit -U - plugin [args] --run '...'

Copying data in and out of plugins with captive nbdkit

Captive nbdkit + qemu-img(1) can be used to copy data into and out of nbdkit plugins.  For example nbdkit-example1-plugin(1) contains an embedded disk image.  To copy it out:

 nbdkit -U - example1 --run 'qemu-img convert $nbd disk.img'

If plugin requests have a high overhead (for example making HTTP requests to a remote server), adding nbdkit-readahead-filter(1) may help performance:

 nbdkit -U - --filter=readahead curl https://example.com/disk.img \
        --run 'qemu-img convert $nbd disk.img'

If the source suffers from temporary network failures nbdkit-retry-filter(1) may help.

To overwrite a file inside an uncompressed tar file (the file being overwritten must be the same size), use nbdkit-tar-plugin(1) like this:

 nbdkit -U - tar tar=data.tar file=disk.img \
   --run 'qemu-img convert -n disk.img $nbd'

Exit with Parent

The --exit-with-parent option is almost the opposite of “Captive Nbdkit” described in the previous section.

Running nbdkit with this option, for example from a script:

 nbdkit --exit-with-parent plugin ... &

means that nbdkit will exit automatically if the parent program exits for any reason.  This can be used to avoid complicated cleanups or orphaned nbdkit processes.

--exit-with-parent is incompatible with forking into the background (because when we fork into the background we lose track of the parent process).  Therefore -f / --foreground is implied.

This is currently implemented using a non-POSIX feature available in Linux ≥ 2.1.57 and FreeBSD ≥ 11.2, so it won't work on other operating systems (patches welcome to make it work).

If the parent application is multithreaded, then (in the Linux implementation) if the parent thread exits, that will cause nbdkit to exit.  Thus in multithreaded applications you usually want to run nbdkit --exit-with-parent only from the main thread (unless you actually want nbdkit to exit with the thread, but that may not work 
