

-chardev null,id=id

    A void device. This device will not emit any data, and will drop any data it receives. The null backend does not take any options.
-chardev socket,id=id[,TCP options or unix options][,server][,nowait][,telnet][,websocket][,reconnect=seconds][,tls-creds=id][,tls-authz=id]

    Create a two-way stream socket, which can be either a TCP or a unix socket. A unix socket will be created if path is specified. Behaviour is undefined if TCP options are specified for a unix socket.

    server specifies that the socket shall be a listening socket.

    nowait specifies that QEMU should not block waiting for a client to connect to a listening socket.

    telnet specifies that traffic on the socket should interpret telnet escape sequences.

    websocket specifies that the socket uses WebSocket protocol for communication.

    reconnect sets the timeout for reconnecting on non-server sockets when the remote end goes away.  qemu will delay this many seconds and then attempt to reconnect.  Zero disables reconnecting, and is the default.

    tls-creds requests enablement of the TLS protocol for encryption, and specifies the id of the TLS credentials to use for the handshake. The credentials must be previously created with the -object tls-creds argument.

    tls-auth provides the ID of the QAuthZ authorization object against which the client's x509 distinguished name will be validated. This object is only resolved at time of use, so can be deleted and recreated on the fly while the chardev server is active. If missing, it will default to denying access.

    TCP and unix socket options are given below:

    TCP options: port=port[,host=host][,to=to][,ipv4][,ipv6][,nodelay]

        host for a listening socket specifies the local address to be bound. For a connecting socket species the remote host to connect to. host is optional for listening sockets. If not specified it defaults to 0.0.0.0.

        port for a listening socket specifies the local port to be bound. For a connecting socket specifies the port on the remote host to connect to. port can be given as either a port number or a service name. port is required.

        to is only relevant to listening sockets. If it is specified, and port cannot be bound, QEMU will attempt to bind to subsequent ports up to and including to until it succeeds. to must be specified as a port number.

        ipv4 and ipv6 specify that either IPv4 or IPv6 must be used. If neither is specified the socket may use either protocol.

        nodelay disables the Nagle algorithm.
    unix options: path=path

        path specifies the local path of the unix socket. path is required.

-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr][,localport=localport][,ipv4][,ipv6]

    Sends all traffic from the guest to a remote host over UDP.

    host specifies the remote host to connect to. If not specified it defaults to localhost.

    port specifies the port on the remote host to connect to. port is required.

    localaddr specifies the local address to bind to. If not specified it defaults to 0.0.0.0.

    localport specifies the local port to bind to. If not specified any available local port will be used.

    ipv4 and ipv6 specify that either IPv4 or IPv6 must be used. If neither is specified the device may use either protocol.
-chardev msmouse,id=id

    Forward QEMU's emulated msmouse events to the guest. msmouse does not take any options.
-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]

    Connect to a QEMU text console. vc may optionally be given a specific size.

    width and height specify the width and height respectively of the console, in pixels.

    cols and rows specify that the console be sized to fit a text console with the given dimensions.
-chardev ringbuf,id=id[,size=size]

    Create a ring buffer with fixed size size. size must be a power of two and defaults to 64K.
-chardev file,id=id,path=path

    Log all traffic received from the guest to a file.

    path specifies the path of the file to be opened. This file will be created if it does not already exist, and overwritten if it does. path is required.
-chardev pipe,id=id,path=path

    Create a two-way connection to the guest. The behaviour differs slightly between Windows hosts and other hosts:

    On Windows, a single duplex pipe will be created at \\.pipe\path.

    On other hosts, 2 pipes will be created called path.in and path.out. Data written to path.in will be received by the guest. Data written by the guest can be read from path.out. QEMU will not create these fifos, and requires them to be present.

    path forms part of the pipe path as described above. path is required.
-chardev console,id=id

    Send traffic from the guest to QEMU's standard output. console does not take any options.

    console is only available on Windows hosts.
-chardev serial,id=id,path=path

    Send traffic from the guest to a serial device on the host.

    On Unix hosts serial will actually accept any tty device, not only serial lines.

    path specifies the name of the serial device to open.
-chardev pty,id=id

    Create a new pseudo-terminal on the host and connect to it. pty does not take any options.

    pty is not available on Windows hosts.
-chardev stdio,id=id[,signal=on|off]

    Connect to standard input and standard output of the QEMU process.

    signal controls if signals are enabled on the terminal, that includes exiting QEMU with the key sequence Control-c. This option is enabled by default, use signal=off to disable it.
-chardev braille,id=id

    Connect to a local BrlAPI server. braille does not take any options.
-chardev tty,id=id,path=path

    tty is only available on Linux, Sun, FreeBSD, NetBSD, OpenBSD and DragonFlyBSD hosts.  It is an alias for serial.

    path specifies the path to the tty. path is required.
-chardev parallel,id=id,path=path
-chardev parport,id=id,path=path

    parallel is only available on Linux, FreeBSD and DragonFlyBSD hosts.

    Connect to a local parallel port.

    path specifies the path to the parallel port device. path is required.
-chardev spicevmc,id=id,debug=debug,name=name

    spicevmc is only available when spice support is built in.

    debug debug level for spicevmc

    name name of spice channel to connect to

    Connect to a spice virtual machine channel, such as vdiport.
-chardev spiceport,id=id,debug=debug,name=name

    spiceport is only available when spice support is built in.

    debug debug level for spicevmc

    name name of spice port to connect to

    Connect to a spice port, allowing a Spice client to handle the traffic identified by a name (preferably a fqdn).



-D logfile

    Output log in logfile instead of to stderr
-dfilter range1[,...]

    Filter debug output to that relevant to a range of target addresses. The filter spec can be either start+size, start-size or start..end where start end and size are the addresses and sizes required. For example:

            -dfilter 0x8000..0x8fff,0xffffffc000080000+0x200,0xffffffc000060000-0x1000

    Will dump output for any code in the 0x1000 sized block starting at 0x8000 and the 0x200 sized block starting at 0xffffffc000080000 and another 0x1000 sized block starting at 0xffffffc00005f000.
-seed number

    Force the guest to use a deterministic pseudo-random number generator, seeded with number.  This does not affect crypto routines within the host.
-L  path

    Set the directory for the BIOS, VGA BIOS and keymaps.

    To list all the data directories, use -L help.
-bios file

    Set the filename for the BIOS.
-enable-kvm

    Enable KVM full virtualization support. This option is only available if KVM support is enabled when compiling.
-xen-domid id

    Specify xen guest domain id (XEN only).
-xen-attach

    Attach to existing xen domain. libxl will use this when starting QEMU (XEN only). Restrict set of available xen operations to specified domain id (XEN only).
-no-reboot

    Exit instead of rebooting.
-no-shutdown

    Don't exit QEMU on guest shutdown, but instead only stop the emulation. This allows for instance switching to monitor to commit changes to the disk image.
-loadvm file

    Start right away with a saved state (loadvm in monitor)
-daemonize

    Daemonize the QEMU process after initialization.  QEMU will not detach from standard IO until it is ready to receive connections on any of its devices. This option is a useful way for external programs to launch QEMU without having to cope with initialization race conditions.
-option-rom file

    Load the contents of file as an option ROM. This option is useful to load things like EtherBoot.
-rtc [base=utc|localtime|datetime][,clock=host|rt|vm][,driftfix=none|slew]

    Specify base as utc or localtime to let the RTC start at the current UTC or local time, respectively. localtime is required for correct date in MS-DOS or Windows. To start at a specific point in time, provide datetime in the format 2006-06-17T16:01:21 or 2006-06-17. The default base is UTC.

    By default the RTC is driven by the host system time. This allows using of the RTC as accurate reference clock inside the guest, specifically if the host time is smoothly following an accurate external reference clock, e.g. via NTP. If you want to isolate the guest time from the host, you can set clock to rt instead, which provides a host monotonic clock if host support it. To even prevent the RTC from progressing during suspension, you can set clock to vm (virtual clock). clock=vm is recommended especially in icount mode in order to preserve determinism; however, note that in icount mode the speed of the virtual clock is variable and can in general differ from the host clock.

    Enable driftfix (i386 targets only) if you experience time drift problems, specifically with Windows' ACPI HAL. This option will try to figure out how many timer interrupts were not processed by the Windows guest and will re-inject them.
-icount [shift=N|auto][,rr=record|replay,rrfile=filename,rrsnapshot=snapshot]

    Enable virtual instruction counter.  The virtual cpu will execute one instruction every 2^N ns of virtual time.  If auto is specified then the virtual cpu speed will be automatically adjusted to keep virtual time within a few seconds of real time.

    When the virtual cpu is sleeping, the virtual time will advance at default speed unless sleep=on|off is specified. With sleep=on|off, the virtual time will jump to the next timer deadline instantly whenever the virtual cpu goes to sleep mode and will not advance if no timer is enabled. This behavior give deterministic execution times from the guest point of view.

    Note that while this option can give deterministic behavior, it does not provide cycle accurate emulation.  Modern CPUs contain superscalar out of order cores with complex cache hierarchies.  The number of instructions executed often has little or no correlation with actual performance.

    align=on will activate the delay algorithm which will try to synchronise the host clock and the virtual clock. The goal is to have a guest running at the real frequency imposed by the shift option. Whenever the guest clock is behind the host clock and if align=on is specified then we print a message to the user to inform about the delay. Currently this option does not work when shift is auto. Note: The sync algorithm will work for those shift values for which the guest clock runs ahead of the host clock. Typically this happens when the shift value is high (how high depends on the host machine).

    When rr option is specified deterministic record/replay is enabled. Replay log is written into filename file in record mode and read from this file in replay mode.

    Option rrsnapshot is used to create new vm snapshot named snapshot at the start of execution recording. In replay mode this option is used to load the initial VM state.
-watchdog model

    Create a virtual hardware watchdog device.  Once enabled (by a guest action), the watchdog must be periodically polled by an agent inside the guest or else the guest will be restarted. Choose a model for which your guest has drivers.

    The model is the model of hardware watchdog to emulate. Use -watchdog help to list available hardware models. Only one watchdog can be enabled for a guest.

    The following models may be available:

    ib700

        iBASE 700 is a very simple ISA watchdog with a single timer.
    i6300esb

        Intel 6300ESB I/O controller hub is a much more featureful PCI-based dual-timer watchdog.
    diag288

        A virtual watchdog for s390x backed by the diagnose 288 hypercall (currently KVM only).

-watchdog-action action

    The action controls what QEMU will do when the watchdog timer expires. The default is reset (forcefully reset the guest). Other possible actions are: shutdown (attempt to gracefully shutdown the guest), poweroff (forcefully poweroff the guest), inject-nmi (inject a NMI into the guest), pause (pause the guest), debug (print a debug message and continue), or none (do nothing).

    Note that the shutdown action requires that the guest responds to ACPI signals, which it may not be able to do in the sort of situations where the watchdog would have expired, and thus -watchdog-action shutdown is not recommended for production use.

    Examples:

    -watchdog i6300esb -watchdog-action pause

    -watchdog ib700
-echr numeric_ascii_value

    Change the escape character used for switching to the monitor when using monitor and serial sharing.  The default is 0x01 when using the -nographic option.  0x01 is equal to pressing Control-a.  You can select a different character from the ascii control keys where 1 through 26 map to Control-a through Control-z.  For instance you could use the either of the following to change the escape character to Control-t.

    -echr 0x14

    -echr 20
-show-cursor

    Show cursor.
-tb-size n

    Set TB size.
-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]
-incoming rdma:host:port[,ipv4][,ipv6]

    Prepare for incoming migration, listen on a given tcp port.
-incoming unix:socketpath

    Prepare for incoming migration, listen on a given unix socket.
-incoming fd:fd

    Accept incoming migration from a given filedescriptor.
-incoming exec:cmdline

    Accept incoming migration as an output from specified external command.
-incoming defer

    Wait for the URI to be specified via migrate_incoming.  The monitor can be used to change settings (such as migration parameters) prior to issuing the migrate_incoming to allow the migration to begin.
-only-migratable

    Only allow migratable devices. Devices will not be allowed to enter an unmigratable state.
-nodefaults

    Don't create default devices. Normally, QEMU sets the default devices like serial port, parallel port, virtual console, monitor device, VGA adapter, floppy and CD-ROM drive and others. The -nodefaults option will disable all those default devices.
-chroot dir

    Immediately before starting guest execution, chroot to the specified directory.  Especially useful in combination with -runas.
-runas user

    Immediately before starting guest execution, drop root privileges, switching to the specified user.
-prom-env variable=value

    Set OpenBIOS nvram variable to given value (PPC, SPARC only).
-semihosting

    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]

    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II only).

    target=native|gdb|auto

        Defines where the semihosting calls will be addressed, to QEMU (native) or to GDB (gdb). The default is auto, which means gdb during debug sessions and native otherwise.
    chardev=str1

        Send the output to a chardev backend output for native or auto output when not in gdb
    arg=str1,arg=str2,...

        Allows the user to pass input arguments, and can be used multiple times to build up a list. The old-style -kernel/-append method of passing a command line is still supported for backward compatibility. If both the --semihosting-config arg and the -kernel/-append are specified, the former is passed to semihosting as it always takes precedence.

-old-param

    Old param mode (ARM only).
-sandbox arg[,obsolete=string][,elevateprivileges=string][,spawn=string][,resourcecontrol=string]

    Enable Seccomp mode 2 system call filter. 'on' will enable syscall filtering and 'off' will disable it.  The default is 'off'.

    obsolete=string

        Enable Obsolete system calls
    elevateprivileges=string

        Disable set*uid|gid system calls
    spawn=string

        Disable *fork and execve
    resourcecontrol=string

        Disable process affinity and schedular priority

-readconfig file

    Read device configuration from file. This approach is useful when you want to spawn QEMU process with many command line options but you don't want to exceed the command line character limit.
-writeconfig file

    Write device configuration to file. The file can be either filename to save command line and device configuration into file or dash -) character to print the output to stdout. This can be later used as input file for -readconfig option.
-no-user-config

    The -no-user-config option makes QEMU not load any of the user-provided config files on sysconfdir.
-trace [[enable=]pattern][,events=file][,file=file]

    Specify tracing options.

    [enable=]pattern

        Immediately enable events matching pattern (either event name or a globbing pattern).  This option is only available if QEMU has been compiled with the simple, log or ftrace tracing backend.  To specify multiple events or patterns, specify the -trace option multiple times.

        Use -trace help to print a list of names of trace points.
    events=file

        Immediately enable events listed in file. The file must contain one event name (as listed in the trace-events-all file) per line; globbing patterns are accepted too.  This option is only available if QEMU has been compiled with the simple, log or ftrace tracing backend.
    file=file

        Log output traces to file. This option is only available if QEMU has been compiled with the simple tracing backend.

-enable-fips

    Enable FIPS 140-2 compliance mode.
-msg timestamp[=on|off]

    prepend a timestamp to each log message.(default:on)
-dump-vmstate file

    Dump json-encoded vmstate information for current machine type to file in file
-enable-sync-profile

    Enable synchronization profiling.

Generic object creation

-object typename[,prop1=value1,...]

    Create a new object of type typename setting properties in the order they are specified.  Note that the 'id' property must be set.  These objects are placed in the '/objects' path.

    -object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align

        Creates a memory file backend object, which can be used to back the guest RAM with huge pages.

        The id parameter is a unique ID that will be used to reference this memory region when configuring the -numa argument.

        The size option provides the size of the memory region, and accepts common suffixes, eg 500M.

        The mem-path provides the path to either a shared memory or huge page filesystem mount.

        The share boolean option determines whether the memory region is marked as private to QEMU, or shared. The latter allows a co-operating external process to access the QEMU memory region.

        The share is also required for pvrdma devices due to limitations in the RDMA API provided by Linux.

        Setting share=on might affect the ability to configure NUMA bindings for the memory backend under some circumstances, see Documentation/vm/numa_memory_policy.txt on the Linux kernel source tree for additional details.

        Setting the discard-data boolean option to on indicates that file contents can be destroyed when QEMU exits, to avoid unnecessarily flushing data to the backing file.  Note that discard-data is only an optimization, and QEMU might not discard file contents if it aborts unexpectedly or is terminated using SIGKILL.

        The merge boolean option enables memory merge, also known as MADV_MERGEABLE, so that Kernel Samepage Merging will consider the pages for memory deduplication.

        Setting the dump boolean option to off excludes the memory from core dumps. This feature is also known as MADV_DONTDUMP.

        The prealloc boolean option enables memory preallocation.

        The host-nodes option binds the memory range to a list of NUMA host nodes.

        The policy option sets the NUMA policy to one of the following values:

        default

            default host policy
        preferred

            prefer the given host node list for allocation
        bind

            restrict memory allocation to the given host node list
        interleave

            interleave memory allocations across the given host node list

        The align option specifies the base address alignment when QEMU mmap(2) mem-path, and accepts common suffixes, eg 2M. Some backend store specified by mem-path requires an alignment different than the default one used by QEMU, eg the device DAX /dev/dax0.0 requires 2M alignment rather than 4K. In such cases, users can specify the required alignment via this option.

        The pmem option specifies whether the backing file specified by mem-path is in host persistent memory that can be accessed using the SNIA NVM programming model (e.g. Intel NVDIMM). If pmem is set to 'on', QEMU will take necessary operations to guarantee the persistence of its own writes to mem-path (e.g. in vNVDIMM label emulation and live migration). Also, we will map the backend-file with MAP_SYNC flag, which ensures the file metadata is in sync for mem-path in case of host crash or a power failure. MAP_SYNC requires support from both the host kernel (since Linux kernel 4.15) and the filesystem of mem-path mounted with DAX option.
    -object memory-backend-ram,id=id,merge=on|off,dump=on|off,share=on|off,prealloc=on|off,size=size,host-nodes=host-nodes,policy=default|preferred|bind|interleave

        Creates a memory backend object, which can be used to back the guest RAM. Memory backend objects offer more control than the -m option that is traditionally used to define guest RAM. Please refer to memory-backend-file for a description of the options.
    -object memory-backend-memfd,id=id,merge=on|off,dump=on|off,share=on|off,prealloc=on|off,size=size,host-nodes=host-nodes,policy=default|preferred|bind|interleave,seal=on|off,hugetlb=on|off,hugetlbsize=size

        Creates an anonymous memory file backend object, which allows QEMU to share the memory with an external process (e.g. when using vhost-user). The memory is allocated with memfd and optional sealing. (Linux only)

        The seal option creates a sealed-file, that will block further resizing the memory ('on' by default).

        The hugetlb option specify the file to be created resides in the hugetlbfs filesystem (since Linux 4.14).  Used in conjunction with the hugetlb option, the hugetlbsize option specify the hugetlb page size on systems that support multiple hugetlb page sizes (it must be a power of 2 value supported by the system).

        In some versions of Linux, the hugetlb option is incompatible with the seal option (requires at least Linux 4.16).

        Please refer to memory-backend-file for a description of the other options.

        The share boolean option is on by default with memfd.
    -object rng-random,id=id,filename=/dev/random

        Creates a random number generator backend which obtains entropy from a device on the host. The id parameter is a unique ID that will be used to reference this entropy backend from the virtio-rng device. The filename parameter specifies which file to obtain entropy from and if omitted defaults to /dev/urandom.
    -object rng-egd,id=id,chardev=chardevid

        Creates a random number generator backend which obtains entropy from an external daemon running on the host. The id parameter is a unique ID that will be used to reference this entropy backend from the virtio-rng device. The chardev parameter is the unique ID of a character device backend that provides the connection to the RNG daemon.
    -object tls-creds-anon,id=id,endpoint=endpoint,dir=/path/to/cred/dir,verify-peer=on|off

        Creates a TLS anonymous credentials object, which can be used to provide TLS support on network backends. The id parameter is a unique ID which network backends will use to access the credentials. The endpoint is either server or client depending on whether the QEMU network backend that uses the credentials will be acting as a client or as a server. If verify-peer is enabled (the default) then once the handshake is completed, the peer credentials will be verified, though this is a no-op for anonymous credentials.

        The dir parameter tells QEMU where to find the credential files. For server endpoints, this directory may contain a file dh-params.pem providing diffie-hellman parameters to use for the TLS server. If the file is missing, QEMU will generate a set of DH parameters at startup. This is a computationally expensive operation that consumes random pool entropy, so it is recommended that a persistent set of parameters be generated upfront and saved.
    -object tls-creds-psk,id=id,endpoint=endpoint,dir=/path/to/keys/dir[,username=username]

        Creates a TLS Pre-Shared Keys (PSK) credentials object, which can be used to provide TLS support on network backends. The id parameter is a unique ID which network backends will use to access the credentials. The endpoint is either server or client depending on whether the QEMU network backend that uses the credentials will be acting as a client or as a server. For clients only, username is the username which will be sent to the server.  If omitted it defaults to “qemu”.

        The dir parameter tells QEMU where to find the keys file. It is called "dir/keys.psk“ and contains ”username:key" pairs.  This file can most easily be created using the GnuTLS psktool program.

        For server endpoints, dir may also contain a file dh-params.pem providing diffie-hellman parameters to use for the TLS server. If the file is missing, QEMU will generate a set of DH parameters at startup. This is a computationally expensive operation that consumes random pool entropy, so it is recommended that a persistent set of parameters be generated up front and saved.
    -object tls-creds-x509,id=id,endpoint=endpoint,dir=/path/to/cred/dir,priority=priority,verify-peer=on|off,passwordid=id

        Creates a TLS anonymous credentials object, which can be used to provide TLS support on network backends. The id parameter is a unique ID which network backends will use to access the credentials. The endpoint is either server or client depending on whether the QEMU network backend that uses the credentials will be acting as a client or as a server. If verify-peer is enabled (the default) then once the handshake is completed, the peer credentials will be verified. With x509 certificates, this implies that the clients must be provided with valid client certificates too.

        The dir parameter tells QEMU where to find the credential files. For server endpoints, this directory may contain a file dh-params.pem providing diffie-hellman parameters to use for the TLS server. If the file is missing, QEMU will generate a set of DH parameters at startup. This is a computationally expensive operation that consumes random pool entropy, so it is recommended that a persistent set of parameters be generated upfront and saved.

        For x509 certificate credentials the directory will contain further files providing the x509 certificates. The certificates must be stored in PEM format, in filenames ca-cert.pem, ca-crl.pem (optional), server-cert.pem (only servers), server-key.pem (only servers), client-cert.pem (only clients), and client-key.pem (only clients).

        For the server-key.pem and client-key.pem files which contain sensitive private keys, it is possible to use an encrypted version by providing the passwordid parameter. This provides the ID of a previously created secret object containing the password for decryption.

        The priority parameter allows to override the global default priority used by gnutls. This can be useful if the system administrator needs to use a weaker set of crypto priorities for QEMU without potentially forcing the weakness onto all applications. Or conversely if one wants wants a stronger default for QEMU than for all other applications, they can do this through this parameter. Its format is a gnutls priority string as described at <https://gnutls.org/manual/html_node/Priority-Strings.html>.
    -object filter-buffer,id=id,netdev=netdevid,interval=t[,queue=all|rx|tx][,status=on|off]

        Interval t can't be 0, this filter batches the packet delivery: all packets arriving in a given interval on netdev netdevid are delayed until the end of the interval. Interval is in microseconds. status is optional that indicate whether the netfilter is on (enabled) or off (disabled), the default status for netfilter will be 'on'.

        queue all|rx|tx is an option that can be applied to any netfilter.

        all: the filter is attached both to the receive and the transmit queue of the netdev (default).

        rx: the filter is attached to the receive queue of the netdev, where it will receive packets sent to the netdev.

        tx: the filter is attached to the transmit queue of the netdev, where it will receive packets sent by the netdev.
    -object filter-mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support]

        filter-mirror on netdev netdevid,mirror net packet to chardevchardevid, if it has the vnet_hdr_support flag, filter-mirror will mirror packet with vnet_hdr_len.
    -object filter-redirector,id=id,netdev=netdevid,indev=chardevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support]

        filter-redirector on netdev netdevid,redirect filter's net packet to chardev chardevid,and redirect indev's packet to filter.if it has the vnet_hdr_support flag, filter-redirector will redirect packet with vnet_hdr_len. Create a filter-redirector we need to differ outdev id from indev id, id can not be the same. we can just use indev or outdev, but at least one of indev or outdev need to be specified.
    -object filter-rewriter,id=id,netdev=netdevid,queue=all|rx|tx,[vnet_hdr_support]

        Filter-rewriter is a part of COLO project.It will rewrite tcp packet to secondary from primary to keep secondary tcp connection,and rewrite tcp packet to primary from secondary make tcp packet can be handled by client.if it has the vnet_hdr_support flag, we can parse packet with vnet header.

        usage: colo secondary: -object filter-redirector,id=f1,netdev=hn0,queue=tx,indev=red0 -object filter-redirector,id=f2,netdev=hn0,queue=rx,outdev=red1 -object filter-rewriter,id=rew0,netdev=hn0,queue=all
    -object filter-dump,id=id,netdev=dev[,file=filename][,maxlen=len]

        Dump the network traffic on netdev dev to the file specified by filename. At most len bytes (64k by default) per packet are stored. The file format is libpcap, so it can be analyzed with tools such as tcpdump or Wireshark.
    -object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,vnet_hdr_support][,notify_dev=id]

        Colo-compare gets packet from primary_inchardevid and secondary_inchardevid, than compare primary packet with secondary packet. If the packets are same, we will output primary packet to outdevchardevid, else we will notify colo-frame do checkpoint and send primary packet to outdevchardevid. In order to improve efficiency, we need to put the task of comparison in another thread. If it has the vnet_hdr_support flag, colo compare will send/recv packet with vnet_hdr_len. If you want to use Xen COLO, will need the notify_dev to notify Xen colo-frame to do checkpoint.

        we must use it with the help of filter-mirror and filter-redirector.

                KVM COLO
                
                primary:
                -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
                -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
                -chardev socket,id=mirror0,host=3.3.3.3,port=9003,server,nowait
                -chardev socket,id=compare1,host=3.3.3.3,port=9004,server,nowait
                -chardev socket,id=compare0,host=3.3.3.3,port=9001,server,nowait
                -chardev socket,id=compare0-0,host=3.3.3.3,port=9001
                -chardev socket,id=compare_out,host=3.3.3.3,port=9005,server,nowait
                -chardev socket,id=compare_out0,host=3.3.3.3,port=9005
                -object iothread,id=iothread1
                -object filter-mirror,id=m0,netdev=hn0,queue=tx,outdev=mirror0
                -object filter-redirector,netdev=hn0,id=redire0,queue=rx,indev=compare_out
                -object filter-redirector,netdev=hn0,id=redire1,queue=rx,outdev=compare0
                -object colo-compare,id=comp0,primary_in=compare0-0,secondary_in=compare1,outdev=compare_out0,iothread=iothread1
                
                secondary:
                -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,down script=/etc/qemu-ifdown
                -device e1000,netdev=hn0,mac=52:a4:00:12:78:66
                -chardev socket,id=red0,host=3.3.3.3,port=9003
                -chardev socket,id=red1,host=3.3.3.3,port=9004
                -object filter-redirector,id=f1,netdev=hn0,queue=tx,indev=red0
                -object filter-redirector,id=f2,netdev=hn0,queue=rx,outdev=red1
                
                
                Xen COLO
                
                primary:
                -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
                -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
                -chardev socket,id=mirror0,host=3.3.3.3,port=9003,server,nowait
                -chardev socket,id=compare1,host=3.3.3.3,port=9004,server,nowait
                -chardev socket,id=compare0,host=3.3.3.3,port=9001,server,nowait
                -chardev socket,id=compare0-0,host=3.3.3.3,port=9001
                -chardev socket,id=compare_out,host=3.3.3.3,port=9005,server,nowait
                -chardev socket,id=compare_out0,host=3.3.3.3,port=9005
                -chardev socket,id=notify_way,host=3.3.3.3,port=9009,server,nowait
                -object filter-mirror,id=m0,netdev=hn0,queue=tx,outdev=mirror0
                -object filter-redirector,netdev=hn0,id=redire0,queue=rx,indev=compare_out
                -object filter-redirector,netdev=hn0,id=redire1,queue=rx,outdev=compare0
                -object iothread,id=iothread1
                -object colo-compare,id=comp0,primary_in=compare0-0,secondary_in=compare1,outdev=compare_out0,notify_dev=nofity_way,iothread=iothread1
                
                secondary:
                -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,down script=/etc/qemu-ifdown
                -device e1000,netdev=hn0,mac=52:a4:00:12:78:66
                -chardev socket,id=red0,host=3.3.3.3,port=9003
                -chardev socket,id=red1,host=3.3.3.3,port=9004
                -object filter-redirector,id=f1,netdev=hn0,queue=tx,indev=red0
                -object filter-redirector,id=f2,netdev=hn0,queue=rx,outdev=red1

        If you want to know the detail of above command line, you can read the colo-compare git log.
    -object cryptodev-backend-builtin,id=id[,queues=queues]

        Creates a cryptodev backend which executes crypto opreation from the QEMU cipher APIS. The id parameter is a unique ID that will be used to reference this cryptodev backend from the virtio-crypto device. The queues parameter is optional, which specify the queue number of cryptodev backend, the default of queues is 1.

                # qemu-system-x86_64 \
                [...] \
                -object cryptodev-backend-builtin,id=cryptodev0 \
                -device virtio-crypto-pci,id=crypto0,cryptodev=cryptodev0 \
                [...]

    -object cryptodev-vhost-user,id=id,chardev=chardevid[,queues=queues]

        Creates a vhost-user cryptodev backend, backed by a chardev chardevid. The id parameter is a unique ID that will be used to reference this cryptodev backend from the virtio-crypto device. The chardev should be a unix domain socket backed one. The vhost-user uses a specifically defined protocol to pass vhost ioctl replacement messages to an application on the other end of the socket. The queues parameter is optional, which specify the queue number of cryptodev backend for multiqueue vhost-user, the default of queues is 1.

                # qemu-system-x86_64 \
                [...] \
                -chardev socket,id=chardev0,path=/path/to/socket \
                -object cryptodev-vhost-user,id=cryptodev0,chardev=chardev0 \
                -device virtio-crypto-pci,id=crypto0,cryptodev=cryptodev0 \
                [...]

    -object secret,id=id,data=string,format=raw|base64[,keyid=secretid,iv=string]
    -object secret,id=id,file=filename,format=raw|base64[,keyid=secretid,iv=string]

        Defines a secret to store a password, encryption key, or some other sensitive data. The sensitive data can either be passed directly via the data parameter, or indirectly via the file parameter. Using the data parameter is insecure unless the sensitive data is encrypted.

        The sensitive data can be provided in raw format (the default), or base64. When encoded as JSON, the raw format only supports valid UTF-8 characters, so base64 is recommended for sending binary data. QEMU will convert from which ever format is provided to the format it needs internally. eg, an RBD password can be provided in raw format, even though it will be base64 encoded when passed onto the RBD sever.

        For added protection, it is possible to encrypt the data associated with a secret using the AES-256-CBC cipher. Use of encryption is indicated by providing the keyid and iv parameters. The keyid parameter provides the ID of a previously defined secret that contains the AES-256 decryption key. This key should be 32-bytes long and be base64 encoded. The iv parameter provides the random initialization vector used for encryption of this particular secret and should be a base64 encrypted string of the 16-byte IV.

        The simplest (insecure) usage is to provide the secret inline

                # $QEMU -object secret,id=sec0,data=letmein,format=raw

        The simplest secure usage is to provide the secret via a file

        # printf “letmein” > mypasswd.txt # $QEMU -object secret,id=sec0,file=mypasswd.txt,format=raw

        For greater security, AES-256-CBC should be used. To illustrate usage, consider the openssl command line tool which can encrypt the data. Note that when encrypting, the plaintext must be padded to the cipher block size (32 bytes) using the standard PKCS#5/6 compatible padding algorithm.

        First a master key needs to be created in base64 encoding:

                # openssl rand -base64 32 > key.b64
                # KEY=$(base64 -d key.b64 | hexdump  -v -e '/1 "%02X"')

        Each secret to be encrypted needs to have a random initialization vector generated. These do not need to be kept secret

                # openssl rand -base64 16 > iv.b64
                # IV=$(base64 -d iv.b64 | hexdump  -v -e '/1 "%02X"')

        The secret to be defined can now be encrypted, in this case we're telling openssl to base64 encode the result, but it could be left as raw bytes if desired.

                # SECRET=$(printf "letmein" |
                openssl enc -aes-256-cbc -a -K $KEY -iv $IV)

        When launching QEMU, create a master secret pointing to key.b64 and specify that to be used to decrypt the user password. Pass the contents of iv.b64 to the second secret

                # $QEMU \
                -object secret,id=secmaster0,format=base64,file=key.b64 \
                -object secret,id=sec0,keyid=secmaster0,format=base64,\
                data=$SECRET,iv=$(<iv.b64)

    -object sev-guest,id=id,cbitpos=cbitpos,reduced-phys-bits=val,[sev-device=string,policy=policy,handle=handle,dh-cert-file=file,session-file=file]

        Create a Secure Encrypted Virtualization (SEV) guest object, which can be used to provide the guest memory encryption support on AMD processors.

        When memory encryption is enabled, one of the physical address bit (aka the C-bit) is utilized to mark if a memory page is protected. The cbitpos is used to provide the C-bit position. The C-bit position is Host family dependent hence user must provide this value. On EPYC, the value should be 47.

        When memory encryption is enabled, we loose certain bits in physical address space. The reduced-phys-bits is used to provide the number of bits we loose in physical address space. Similar to C-bit, the value is Host family dependent. On EPYC, the value should be 5.

        The sev-device provides the device file to use for communicating with the SEV firmware running inside AMD Secure Processor. The default device is '/dev/sev'. If hardware supports memory encryption then /dev/sev devices are created by CCP driver.

        The policy provides the guest policy to be enforced by the SEV firmware and restrict what configuration and operational commands can be performed on this guest by the hypervisor. The policy should be provided by the guest owner and is bound to the guest and cannot be changed throughout the lifetime of the guest. The default is 0.

        If guest policy allows sharing the key with another SEV guest then handle can be use to provide handle of the guest from which to share the key.

        The dh-cert-file and session-file provides the guest owner's Public Diffie-Hillman key defined in SEV spec. The PDH and session parameters are used for establishing a cryptographic session with the guest owner to negotiate keys used for attestation. The file must be encoded in base64.

        e.g to launch a SEV guest

                # $QEMU \
                ......
                -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=5 \
                -machine ...,memory-encryption=sev0
                .....

    -object authz-simple,id=id,identity=string

        Create an authorization object that will control access to network services.

        The identity parameter is identifies the user and its format depends on the network service that authorization object is associated with. For authorizing based on TLS x509 certificates, the identity must be the x509 distinguished name. Note that care must be taken to escape any commas in the distinguished name.

        An example authorization object to validate a x509 distinguished name would look like:

                # $QEMU \
                ...
                -object 'authz-simple,id=auth0,identity=CN=laptop.example.com,,O=Example Org,,L=London,,ST=London,,C=GB' \
                ...

        Note the use of quotes due to the x509 distinguished name containing whitespace, and escaping of ','.
    -object authz-listfile,id=id,filename=path,refresh=yes|no

        Create an authorization object that will control access to network services.

        The filename parameter is the fully qualified path to a file containing the access control list rules in JSON format.

        An example set of rules that match against SASL usernames might look like:

                {
                "rules": [
                { "match": "fred", "policy": "allow", "format": "exact" },
                { "match": "bob", "policy": "allow", "format": "exact" },
                { "match": "danb", "policy": "deny", "format": "glob" },
                { "match": "dan*", "policy": "allow", "format": "exact" },
                ],
                "policy": "deny"
                }

        When checking access the object will iterate over all the rules and the first rule to match will have its policy value returned as the result. If no rules match, then the default policy value is returned.

        The rules can either be an exact string match, or they can use the simple UNIX glob pattern matching to allow wildcards to be used.

        If refresh is set to true the file will be monitored and automatically reloaded whenever its content changes.

        As with the authz-simple object, the format of the identity strings being matched depends on the network service, but is usually a TLS x509 distinguished name, or a SASL username.

        An example authorization object to validate a SASL username would look like:

                # $QEMU \
                ...
                -object authz-simple,id=auth0,filename=/etc/qemu/vnc-sasl.acl,refresh=yes
                ...

    -object authz-pam,id=id,service=string

        Create an authorization object that will control access to network services.

        The service parameter provides the name of a PAM service to use for authorization. It requires that a file /etc/pam.d/service exist to provide the configuration for the account subsystem.

        An example authorization object to validate a TLS x509 distinguished name would look like:

                # $QEMU \
                ...
                -object authz-pam,id=auth0,service=qemu-vnc
                ...

        There would then be a corresponding config file for PAM at /etc/pam.d/qemu-vnc that contains:

                account requisite  pam_listfile.so item=user sense=allow \
                file=/etc/qemu/vnc.allow

        Finally the /etc/qemu/vnc.allow file would contain the list of x509 distingished names that are permitted access

                CN=laptop.example.com,O=Example Home,L=London,ST=London,C=GB

During the graphical emulation, you can use special key combinations to change modes. The default key mappings are shown below, but if you use -alt-grab then the modifier is Ctrl-Alt-Shift (instead of Ctrl-Alt) and if you use -ctrl-grab then the modifier is the right Ctrl key (instead of Ctrl-Alt):

Ctrl-Alt-f

    Toggle full screen
Ctrl-Alt-+

    Enlarge the screen
Ctrl-Alt—

    Shrink the screen
Ctrl-Alt-u

    Restore the screen's un-scaled dimensions
Ctrl-Alt-n

    Switch to virtual console 'n'. Standard console mappings are:

        Target system display
        Monitor
        Serial port

Ctrl-Alt

    Toggle mouse and keyboard grab.

In the virtual consoles, you can use Ctrl-Up, Ctrl-Down, Ctrl-PageUp and Ctrl-PageDown to move in the back log.

During emulation, if you are using a character backend multiplexer (which is the default if you are using -nographic) then several commands are available via an escape sequence. These key sequences all start with an escape character, which is Ctrl-a by default, but can be changed with -echr. The list below assumes you're using the default.

Ctrl-a h

    Print this help
Ctrl-a x

    Exit emulator
Ctrl-a s

    Save disk data back to file (if -snapshot)
Ctrl-a t

    Toggle console timestamps
Ctrl-a b

    Send break (magic sysrq in Linux)
Ctrl-a c

    Rotate between the frontends connected to the multiplexer (usually this switches between the monitor and the console)
Ctrl-a Ctrl-a

    Send the escape character to the frontend

The following options are specific to the PowerPC emulation:

-g WxH[xDEPTH]

    Set the initial VGA graphic mode. The default is 800x600x32.
-prom-env string

    Set OpenBIOS variables in NVRAM, for example:

            qemu-system-ppc -prom-env 'auto-boot?=false' \
             -prom-env 'boot-device=hd:2,\yaboot' \
             -prom-env 'boot-args=conf=hd:2,\yaboot.conf'

    These variables are not used by Open Hack'Ware.

The following options are specific to the Sparc32 emulation:

-g WxHx[xDEPTH]

    Set the initial graphics mode. For TCX, the default is 1024x768x8 with the option of 1024x768x24. For cgthree, the default is 1024x768x8 with the option of 1152x900x8 for people who wish to use OBP.
-prom-env string

    Set OpenBIOS variables in NVRAM, for example:

            qemu-system-sparc -prom-env 'auto-boot?=false' \
             -prom-env 'boot-device=sd(0,2,0):d' -prom-env 'boot-args=linux single'

-M [SS-4|SS-5|SS-10|SS-20|SS-600MP|LX|Voyager|SPARCClassic] [|SPARCbook]

    Set the emulated machine type. Default is SS-5.

The following options are specific to the Sparc64 emulation:

-prom-env string

    Set OpenBIOS variables in NVRAM, for example:

            qemu-system-sparc64 -prom-env 'auto-boot?=false'

-M [sun4u|sun4v|niagara]

    Set the emulated machine type. The default is sun4u.

The following options are specific to the ARM emulation:

-semihosting

    Enable semihosting syscall emulation.

    On ARM this implements the “Angel” interface.

    Note that this allows guest direct access to the host filesystem, so should only be used with trusted guest OS.

The following options are specific to the ColdFire emulation:

-semihosting

    Enable semihosting syscall emulation.

    On M68K this implements the “ColdFire GDB” interface used by libgloss.

    Note that this allows guest direct access to the host filesystem, so should only be used with trusted guest OS.

The following options are specific to the Xtensa emulation:

-semihosting

    Enable semihosting syscall emulation.

    Xtensa semihosting provides basic file IO calls, such as open/read/write/seek/select. Tensilica baremetal libc for ISS and linux platform “sim” use this interface.

    Note that this allows guest direct access to the host filesystem, so should only be used with trusted guest OS.

Notes

In addition to using normal file images for the emulated storage devices, QEMU can also use networked resources such as iSCSI devices. These are specified using a special URL syntax.

iSCSI

    iSCSI support allows QEMU to access iSCSI resources directly and use as images for the guest storage. Both disk and cdrom images are supported.

    Syntax for specifying iSCSI LUNs is “iscsi://<target-ip>[:<port>]/<target-iqn>/<lun>”

    By default qemu will use the iSCSI initiator-name 'iqn.2008-11.org.linux-kvm[:<name>]' but this can also be set from the command line or a configuration file.

    Since version Qemu 2.4 it is possible to specify a iSCSI request timeout to detect stalled requests and force a reestablishment of the session. The timeout is specified in seconds. The default is 0 which means no timeout. Libiscsi 1.15.0 or greater is required for this feature.

    Example (without authentication):

            qemu-system-i386 -iscsi initiator-name=iqn.2001-04.com.example:my-initiator \
                             -cdrom iscsi://192.0.2.1/iqn.2001-04.com.example/2 \
                             -drive file=iscsi://192.0.2.1/iqn.2001-04.com.example/1

    Example (CHAP username/password via URL):

            qemu-system-i386 -drive file=iscsi://user%password@192.0.2.1/iqn.2001-04.com.example/1

    Example (CHAP username/password via environment variables):

            LIBISCSI_CHAP_USERNAME="user" \
            LIBISCSI_CHAP_PASSWORD="password" \
            qemu-system-i386 -drive file=iscsi://192.0.2.1/iqn.2001-04.com.example/1

NBD

    QEMU supports NBD (Network Block Devices) both using TCP protocol as well as Unix Domain Sockets.

    Syntax for specifying a NBD device using TCP “nbd:<server-ip>:<port>[:exportname=<export>]”

    Syntax for specifying a NBD device using Unix Domain Sockets “nbd:unix:<domain-socket>[:exportname=<export>]”

    Example for TCP

            qemu-system-i386 --drive file=nbd:192.0.2.1:30000

    Example for Unix Domain Sockets

            qemu-system-i386 --drive file=nbd:unix:/tmp/nbd-socket

SSH

    QEMU supports SSH (Secure Shell) access to remote disks.

    Examples:

            qemu-system-i386 -drive file=ssh://user@host/path/to/disk.img
            qemu-system-i386 -drive file.driver=ssh,file.user=user,file.host=host,file.port=22,file.path=/path/to/disk.img

    Currently authentication must be done using ssh-agent.  Other authentication methods may be supported in future.
Sheepdog

    Sheepdog is a distributed storage system for QEMU. QEMU supports using either local sheepdog devices or remote networked devices.

    Syntax for specifying a sheepdog device

            sheepdog[+tcp|+unix]://[host:port]/vdiname[?socket=path][#snapid|#tag]

    Example

            qemu-system-i386 --drive file=sheepdog://192.0.2.1:30000/MyVirtualMachine

    See also <https://sheepdog.github.io/sheepdog/>.
GlusterFS

    GlusterFS is a user space distributed file system. QEMU supports the use of GlusterFS volumes for hosting VM disk images using TCP, Unix Domain Sockets and RDMA transport protocols.

    Syntax for specifying a VM disk image on GlusterFS volume is

            URI:
            gluster[+type]://[host[:port]]/volume/path[?socket=...][,debug=N][,logfile=...]
            
            JSON:
            'json:{"driver":"qcow2","file":{"driver":"gluster","volume":"testvol","path":"a.img","debug":N,"logfile":"...",
                                             "server":[{"type":"tcp","host":"...","port":"..."},
                                                       {"type":"unix","socket":"..."}]}}'

    Example

            URI:
            qemu-system-x86_64 --drive file=gluster://192.0.2.1/testvol/a.img,
                                           file.debug=9,file.logfile=/var/log/qemu-gluster.log
            
            JSON:
            qemu-system-x86_64 'json:{"driver":"qcow2",
                                      "file":{"driver":"gluster",
                                               "volume":"testvol","path":"a.img",
                                               "debug":9,"logfile":"/var/log/qemu-gluster.log",
                                               "server":[{"type":"tcp","host":"1.2.3.4","port":24007},
                                                         {"type":"unix","socket":"/var/run/glusterd.socket"}]}}'
            qemu-system-x86_64 -drive driver=qcow2,file.driver=gluster,file.volume=testvol,file.path=/path/a.img,
                                                  file.debug=9,file.logfile=/var/log/qemu-gluster.log,
                                                  file.server.0.type=tcp,file.server.0.host=1.2.3.4,file.server.0.port=24007,
                                                  file.server.1.type=unix,file.server.1.socket=/var/run/glusterd.socket

    See also <http://www.gluster.org>.
HTTP/HTTPS/FTP/FTPS

    QEMU supports read-only access to files accessed over http(s) and ftp(s).

    Syntax using a single filename:

            <protocol>://[<username>[:<password>]@]<host>/<path>

    where:

    protocol

        'http', 'https', 'ftp', or 'ftps'.
    username

        Optional username for authentication to the remote server.
    password

        Optional password for authentication to the remote server.
    host

        Address of the remote server.
    path

        Path on the remote server, including any query string.

    The following options are also supported:

    url

        The full URL when passing options to the driver explicitly.
    readahead

        The amount of data to read ahead with each range request to the remote server. This value may optionally have the suffix 'T', 'G', 'M', 'K', 'k' or 'b'. If it does not have a suffix, it will be assumed to be in bytes. The value must be a multiple of 512 bytes. It defaults to 256k.
    sslverify

        Whether to verify the remote server's certificate when connecting over SSL. It can have the value 'on' or 'off'. It defaults to 'on'.
    cookie

        Send this cookie (it can also be a list of cookies separated by ';') with each outgoing request.  Only supported when using protocols such as HTTP which support cookies, otherwise ignored.
    timeout

        Set the timeout in seconds of the CURL connection. This timeout is the time that CURL waits for a response from the remote server to get the size of the image to be downloaded. If not set, the default timeout of 5 seconds is used.

    Note that when passing options to qemu explicitly, driver is the value of <protocol>.

    Example: boot from a remote Fedora 20 live ISO image

            qemu-system-x86_64 --drive media=cdrom,file=http://dl.fedoraproject.org/pub/fedora/linux/releases/20/Live/x86_64/Fedora-Live-Desktop-x86_64-20-1.iso,readonly
            
            qemu-system-x86_64 --drive media=cdrom,file.driver=http,file.url=http://dl.fedoraproject.org/pub/fedora/linux/releases/20/Live/x86_64/Fedora-Live-Desktop-x86_64-20-1.iso,readonly

    Example: boot from a remote Fedora 20 cloud image using a local overlay for writes, copy-on-read, and a readahead of 64k

            qemu-img create -f qcow2 -o backing_file='json:{"file.driver":"http",, "file.url":"https://dl.fedoraproject.org/pub/fedora/linux/releases/20/Images/x86_64/Fedora-x86_64-20-20131211.1-sda.qcow2",, "file.readahead":"64k"}' /tmp/Fedora-x86_64-20-20131211.1-sda.qcow2
            
            qemu-system-x86_64 -drive file=/tmp/Fedora-x86_64-20-20131211.1-sda.qcow2,copy-on-read=on

    Example: boot from an image stored on a VMware vSphere server with a self-signed certificate using a local overlay for writes, a readahead of 64k and a timeout of 10 seconds.

            qemu-img create -f qcow2 -o backing_file='json:{"file.driver":"https",, "file.url":"https://user:password@vsphere.example.com/folder/test/test-flat.vmdk?dcPath=Datacenter&dsName=datastore1",, "file.sslverify":"off",, "file.readahead":"64k",, "file.timeout":10}' /tmp/test.qcow2
            
            qemu-system-x86_64 -drive file=/tmp/test.qcow2


