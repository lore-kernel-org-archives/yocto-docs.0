Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5FCC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:29:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.52012.1711373370865252306
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FmUVKuZC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61F52E000F;
	Mon, 25 Mar 2024 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0IatDTHI+qGaeBwppBFmZbv/WkBiEMKziUfbS1KmcXE=;
	b=FmUVKuZCiDTXEy2ll3564ctz8ZZoEqmLiD3w9+Wk4guinJ8E9odw2ayUwDmq4iQoGAGu8+
	rr+xsZV2geZZ9wcXmsLpCfB1CqaplzgUGlKAnG/beIOq4PDqSFEkyyTzkXk0OfT6kHf4d4
	MOl+FtYWNfwETpi0pvs3dOdeljMQN1/lKW8JJuoRQFQppwV/9ZBq5XMGAU9khJtlHA9Lp0
	6mORelnnfbZYPJPeFw2jmU6s4FZvef8DxsC4u17JxrAB93oit9C08DLqmsdsXGt4ed+K0N
	qf8ng5UCxy3TaQXQX3NDKXfSf557w0dcrba3rZ3z9NVVV4C161zVwW+GWEwc5Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 02/11] profile-manual: usage.rst: formatting fixes
Date: Mon, 25 Mar 2024 14:29:17 +0100
Message-Id: <20240325132926.3018186-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
References: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5010

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Plus a few text styling improvements, some reported by "make stylecheck"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 467 +++++++++++++------------
 1 file changed, 235 insertions(+), 232 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 6f0b0418e7..bd45dc2137 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -10,10 +10,10 @@ Basic Usage (with examples) for each of the Yocto Tracing Tools
 This chapter presents basic usage examples for each of the tracing
 tools.
 
-perf
+Perf
 ====
 
-The 'perf' tool is the profiling and tracing tool that comes bundled
+The perf tool is the profiling and tracing tool that comes bundled
 with the Linux kernel.
 
 Don't let the fact that it's part of the kernel fool you into thinking
@@ -61,7 +61,7 @@ Basic Perf Usage
 ----------------
 
 The perf tool is pretty much self-documenting. To remind yourself of the
-available commands, simply type 'perf', which will show you basic usage
+available commands, simply type ``perf``, which will show you basic usage
 along with the available perf subcommands::
 
    root@crownbay:~# perf
@@ -97,19 +97,19 @@ along with the available perf subcommands::
 Using perf to do Basic Profiling
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-As a simple test case, we'll profile the 'wget' of a fairly large file,
+As a simple test case, we'll profile the ``wget`` of a fairly large file,
 which is a minimally interesting case because it has both file and
 network I/O aspects, and at least in the case of standard Yocto images,
 it's implemented as part of BusyBox, so the methods we use to analyze it
 can be used in a very similar way to the whole host of supported BusyBox
-applets in Yocto. ::
+applets in Yocto::
 
    root@crownbay:~# rm linux-2.6.19.2.tar.bz2; \
                     wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2
 
 The quickest and easiest way to get some basic overall data about what's
-going on for a particular workload is to profile it using 'perf stat'.
-'perf stat' basically profiles using a few default counters and displays
+going on for a particular workload is to profile it using ``perf stat``.
+This command basically profiles using a few default counters and displays
 the summed counts at the end of the run::
 
    root@crownbay:~# perf stat wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2
@@ -135,9 +135,9 @@ Many times such a simple-minded test doesn't yield much of
 interest, but sometimes it does (see Real-world Yocto bug (slow
 loop-mounted write speed)).
 
-Also, note that 'perf stat' isn't restricted to a fixed set of counters
-- basically any event listed in the output of 'perf list' can be tallied
-by 'perf stat'. For example, suppose we wanted to see a summary of all
+Also, note that ``perf stat`` isn't restricted to a fixed set of counters
+--- basically any event listed in the output of ``perf list`` can be tallied
+by ``perf stat``. For example, suppose we wanted to see a summary of all
 the events related to kernel memory allocation/freeing along with cache
 hits and misses::
 
@@ -164,22 +164,22 @@ hits and misses::
 
         44.831023415 seconds time elapsed
 
-So 'perf stat' gives us a nice easy
+So ``perf stat`` gives us a nice easy
 way to get a quick overview of what might be happening for a set of
 events, but normally we'd need a little more detail in order to
 understand what's going on in a way that we can act on in a useful way.
 
-To dive down into a next level of detail, we can use 'perf record'/'perf
-report' which will collect profiling data and present it to use using an
+To dive down into a next level of detail, we can use ``perf record`` /
+``perf report`` which will collect profiling data and present it to use using an
 interactive text-based UI (or simply as text if we specify ``--stdio`` to
-'perf report').
+``perf report``).
 
-As our first attempt at profiling this workload, we'll simply run 'perf
-record', handing it the workload we want to profile (everything after
-'perf record' and any perf options we hand it --- here none, will be
+As our first attempt at profiling this workload, we'll simply run ``perf
+record``, handing it the workload we want to profile (everything after
+``perf record`` and any perf options we hand it --- here none, will be
 executed in a new shell). perf collects samples until the process exits
-and records them in a file named 'perf.data' in the current working
-directory. ::
+and records them in a file named ``perf.data`` in the current working
+directory::
 
    root@crownbay:~# perf record wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2
 
@@ -189,7 +189,7 @@ directory. ::
    [ perf record: Captured and wrote 0.176 MB perf.data (~7700 samples) ]
 
 To see the results in a
-'text-based UI' (tui), simply run 'perf report', which will read the
+"text-based UI" (tui), simply run ``perf report``, which will read the
 perf.data file in the current working directory and display the results
 in an interactive UI::
 
@@ -199,24 +199,24 @@ in an interactive UI::
    :align: center
    :width: 70%
 
-The above screenshot displays a 'flat' profile, one entry for each
-'bucket' corresponding to the functions that were profiled during the
+The above screenshot displays a "flat" profile, one entry for each
+"bucket" corresponding to the functions that were profiled during the
 profiling run, ordered from the most popular to the least (perf has
 options to sort in various orders and keys as well as display entries
 only above a certain threshold and so on --- see the perf documentation
 for details). Note that this includes both userspace functions (entries
-containing a [.]) and kernel functions accounted to the process (entries
-containing a [k]). (perf has command-line modifiers that can be used to
-restrict the profiling to kernel or userspace, among others).
+containing a ``[.]``) and kernel functions accounted to the process (entries
+containing a ``[k]``). perf has command-line modifiers that can be used to
+restrict the profiling to kernel or userspace, among others.
 
-Notice also that the above report shows an entry for 'busybox', which is
-the executable that implements 'wget' in Yocto, but that instead of a
+Notice also that the above report shows an entry for ``busybox``, which is
+the executable that implements ``wget`` in Yocto, but that instead of a
 useful function name in that entry, it displays a not-so-friendly hex
 value instead. The steps below will show how to fix that problem.
 
 Before we do that, however, let's try running a different profile, one
 which shows something a little more interesting. The only difference
-between the new profile and the previous one is that we'll add the -g
+between the new profile and the previous one is that we'll add the ``-g``
 option, which will record not just the address of a sampled function,
 but the entire callchain to the sampled function as well::
 
@@ -238,11 +238,11 @@ took the most time, but we can also see a summary of how those functions
 were called and learn something about how the program interacts with the
 kernel in the process.
 
-Notice that each entry in the above screenshot now contains a '+' on the
+Notice that each entry in the above screenshot now contains a ``+`` on the
 left-hand side. This means that we can expand the entry and drill down
-into the callchains that feed into that entry. Pressing 'enter' on any
-one of them will expand the callchain (you can also press 'E' to expand
-them all at the same time or 'C' to collapse them all).
+into the callchains that feed into that entry. Pressing ``Enter`` on any
+one of them will expand the callchain (you can also press ``E`` to expand
+them all at the same time or ``C`` to collapse them all).
 
 In the screenshot above, we've toggled the ``__copy_to_user_ll()`` entry
 and several subnodes all the way down. This lets us see which callchains
@@ -253,13 +253,13 @@ As a bit of background explanation for these callchains, think about
 what happens at a high level when you run wget to get a file out on the
 network. Basically what happens is that the data comes into the kernel
 via the network connection (socket) and is passed to the userspace
-program 'wget' (which is actually a part of BusyBox, but that's not
+program ``wget`` (which is actually a part of BusyBox, but that's not
 important for now), which takes the buffers the kernel passes to it and
 writes it to a disk file to save it.
 
 The part of this process that we're looking at in the above call stacks
 is the part where the kernel passes the data it has read from the socket
-down to wget i.e. a copy-to-user.
+down to wget i.e. a ``copy-to-user``.
 
 Notice also that here there's also a case where the hex value is
 displayed in the callstack, here in the expanded ``sys_clock_gettime()``
@@ -270,8 +270,8 @@ busybox.
    :align: center
    :width: 70%
 
-The above screenshot shows the other half of the journey for the data -
-from the wget program's userspace buffers to disk. To get the buffers to
+The above screenshot shows the other half of the journey for the data ---
+from the ``wget`` program's userspace buffers to disk. To get the buffers to
 disk, the wget program issues a ``write(2)``, which does a ``copy-from-user`` to
 the kernel, which then takes care via some circuitous path (probably
 also present somewhere in the profile data), to get it safely to disk.
@@ -281,7 +281,7 @@ of how to extract useful information out of it, let's get back to the
 task at hand and see if we can get some basic idea about where the time
 is spent in the program we're profiling, wget. Remember that wget is
 actually implemented as an applet in BusyBox, so while the process name
-is 'wget', the executable we're actually interested in is BusyBox. So
+is ``wget``, the executable we're actually interested in is BusyBox. So
 let's expand the first entry containing BusyBox:
 
 .. image:: figures/perf-wget-busybox-expanded-stripped.png
@@ -311,16 +311,15 @@ To generate the debug info for the packages in the image, we can add
    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"
 
 Additionally, in order to generate the type of debuginfo that perf
-understands, we also need to set
-:term:`PACKAGE_DEBUG_SPLIT_STYLE`
+understands, we also need to set :term:`PACKAGE_DEBUG_SPLIT_STYLE`
 in the ``local.conf`` file::
 
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
 
-Once we've done that, we can install the
-debuginfo for BusyBox. The debug packages once built can be found in
-``build/tmp/deploy/rpm/*`` on the host system. Find the busybox-dbg-...rpm
-file and copy it to the target. For example::
+Once we've done that, we can install the debuginfo for BusyBox. The
+debug packages once built can be found in ``build/tmp/deploy/rpm/*``
+on the host system. Find the ``busybox-dbg-...rpm`` file and copy it
+to the target. For example::
 
    [trz@empanada core2]$ scp /home/trz/yocto/crownbay-tracing-dbg/build/tmp/deploy/rpm/core2_32/busybox-dbg-1.20.2-r2.core2_32.rpm root@192.168.1.31:
    busybox-dbg-1.20.2-r2.core2_32.rpm                     100% 1826KB   1.8MB/s   00:01
@@ -336,7 +335,7 @@ their functions symbolically:
    :align: center
    :width: 70%
 
-If we expand one of the entries and press 'enter' on a leaf node, we're
+If we expand one of the entries and press ``Enter`` on a leaf node, we're
 presented with a menu of actions we can take to get more information
 related to that entry:
 
@@ -346,7 +345,7 @@ related to that entry:
 
 One of these actions allows us to show a view that displays a
 busybox-centric view of the profiled functions (in this case we've also
-expanded all the nodes using the 'E' key):
+expanded all the nodes using the ``E`` key):
 
 .. image:: figures/perf-wget-busybox-dso-zoom.png
    :align: center
@@ -355,8 +354,8 @@ expanded all the nodes using the 'E' key):
 Finally, we can see that now that the BusyBox debuginfo is installed,
 the previously unresolved symbol in the ``sys_clock_gettime()`` entry
 mentioned previously is now resolved, and shows that the
-sys_clock_gettime system call that was the source of 6.75% of the
-copy-to-user overhead was initiated by the ``handle_input()`` BusyBox
+``sys_clock_gettime`` system call that was the source of 6.75% of the
+``copy-to-user`` overhead was initiated by the ``handle_input()`` BusyBox
 function:
 
 .. image:: figures/perf-wget-g-copy-to-user-expanded-debuginfo.png
@@ -365,15 +364,15 @@ function:
 
 At the lowest level of detail, we can dive down to the assembly level
 and see which instructions caused the most overhead in a function.
-Pressing 'enter' on the 'udhcpc_main' function, we're again presented
+Pressing ``Enter`` on the ``udhcpc_main`` function, we're again presented
 with a menu:
 
 .. image:: figures/perf-wget-busybox-annotate-menu.png
    :align: center
    :width: 70%
 
-Selecting 'Annotate udhcpc_main', we get a detailed listing of
-percentages by instruction for the udhcpc_main function. From the
+Selecting ``Annotate udhcpc_main``, we get a detailed listing of
+percentages by instruction for the ``udhcpc_main`` function. From the
 display, we can see that over 50% of the time spent in this function is
 taken up by a couple tests and the move of a constant (1) to a register:
 
@@ -382,7 +381,7 @@ taken up by a couple tests and the move of a constant (1) to a register:
    :width: 70%
 
 As a segue into tracing, let's try another profile using a different
-counter, something other than the default 'cycles'.
+counter, something other than the default ``cycles``.
 
 The tracing and profiling infrastructure in Linux has become unified in
 a way that allows us to use the same tool with a completely different
@@ -392,7 +391,7 @@ traditional tools can also make use of the expanded possibilities now
 available to them, and in some cases have, as mentioned previously).
 
 We can get a list of the available events that can be used to profile a
-workload via 'perf list'::
+workload via ``perf list``::
 
    root@crownbay:~# perf list
 
@@ -528,13 +527,13 @@ workload via 'perf list'::
 .. admonition:: Tying it Together
 
    These are exactly the same set of events defined by the trace event
-   subsystem and exposed by ftrace/tracecmd/kernelshark as files in
-   /sys/kernel/debug/tracing/events, by SystemTap as
+   subsystem and exposed by ftrace / tracecmd / kernelshark as files in
+   ``/sys/kernel/debug/tracing/events``, by SystemTap as
    kernel.trace("tracepoint_name") and (partially) accessed by LTTng.
 
 Only a subset of these would be of interest to us when looking at this
 workload, so let's choose the most likely subsystems (identified by the
-string before the colon in the Tracepoint events) and do a 'perf stat'
+string before the colon in the Tracepoint events) and do a ``perf stat``
 run using only those wildcarded subsystems::
 
    root@crownbay:~# perf stat -e skb:* -e net:* -e napi:* -e sched:* -e workqueue:* -e irq:* -e syscalls:* wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2
@@ -607,8 +606,8 @@ and tell perf to do a profile using it as the sampling event::
 
 The screenshot above shows the results of running a profile using
 sched:sched_switch tracepoint, which shows the relative costs of various
-paths to sched_wakeup (note that sched_wakeup is the name of the
-tracepoint --- it's actually defined just inside ttwu_do_wakeup(), which
+paths to ``sched_wakeup`` (note that ``sched_wakeup`` is the name of the
+tracepoint --- it's actually defined just inside ``ttwu_do_wakeup()``, which
 accounts for the function name actually displayed in the profile:
 
 .. code-block:: c
@@ -631,10 +630,10 @@ receive paths that presumably end up waking up wget (busybox) when
 network data is ready.
 
 Note that because tracepoints are normally used for tracing, the default
-sampling period for tracepoints is 1 i.e. for tracepoints perf will
-sample on every event occurrence (this can be changed using the -c
+sampling period for tracepoints is ``1`` i.e. for tracepoints perf will
+sample on every event occurrence (this can be changed using the ``-c``
 option). This is in contrast to hardware counters such as for example
-the default 'cycles' hardware counter used for normal profiling, where
+the default ``cycles`` hardware counter used for normal profiling, where
 sampling periods are much higher (in the thousands) because profiling
 should have as low an overhead as possible and sampling on every cycle
 would be prohibitively expensive.
@@ -645,10 +644,10 @@ Using perf to do Basic Tracing
 Profiling is a great tool for solving many problems or for getting a
 high-level view of what's going on with a workload or across the system.
 It is however by definition an approximation, as suggested by the most
-prominent word associated with it, 'sampling'. On the one hand, it
+prominent word associated with it, ``sampling``. On the one hand, it
 allows a representative picture of what's going on in the system to be
 cheaply taken, but on the other hand, that cheapness limits its utility
-when that data suggests a need to 'dive down' more deeply to discover
+when that data suggests a need to "dive down" more deeply to discover
 what's really going on. In such cases, the only way to see what's really
 going on is to be able to look at (or summarize more intelligently) the
 individual steps that go into the higher-level behavior exposed by the
@@ -661,7 +660,7 @@ applicable to our workload::
     -e syscalls:sys_enter_read -e syscalls:sys_exit_read -e syscalls:sys_enter_write -e syscalls:sys_exit_write
     wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2
 
-We can look at the raw trace output using 'perf script' with no
+We can look at the raw trace output using ``perf script`` with no
 arguments::
 
    root@crownbay:~# perf script
@@ -692,7 +691,7 @@ arguments::
 This gives us a detailed timestamped sequence of events that occurred within the
 workload with respect to those events.
 
-In many ways, profiling can be viewed as a subset of tracing -
+In many ways, profiling can be viewed as a subset of tracing ---
 theoretically, if you have a set of trace events that's sufficient to
 capture all the important aspects of a workload, you can derive any of
 the results or views that a profiling run can.
@@ -717,7 +716,7 @@ problem at hand. For example, if we wanted to make use of a 'counter'
 that maps to the value of the time difference between when a process was
 scheduled to run on a processor and the time it actually ran, we
 wouldn't expect such a counter to exist on its own, but we could derive
-one called say 'wakeup_latency' and use it to extract a useful view of
+one called say ``wakeup_latency`` and use it to extract a useful view of
 that metric from trace data. Likewise, we really can't figure out from
 standard profiling tools how much data every process on the system reads
 and writes, along with how many of those reads and writes fail
@@ -726,7 +725,7 @@ right tools easily extract and present that information, but we'd need
 something other than pre-canned profiling tools to do that.
 
 Luckily, there is a general-purpose way to handle such needs, called
-'programming languages'. Making programming languages easily available
+"programming languages". Making programming languages easily available
 to apply to such problems given the specific format of data is called a
 'programming language binding' for that data and language. Perf supports
 two programming language bindings, one for Python and one for Perl.
@@ -744,15 +743,15 @@ two programming language bindings, one for Python and one for Perl.
    created an elaborate compiler-based machinery to translate its
    language into kernel modules written in C.
 
-Now that we have the trace data in perf.data, we can use 'perf script
--g' to generate a skeleton script with handlers for the read/write
-entry/exit events we recorded::
+Now that we have the trace data in ``perf.data``, we can use ``perf script
+-g`` to generate a skeleton script with handlers for the read / write
+entry / exit events we recorded::
 
    root@crownbay:~# perf script -g python
    generated Python script: perf-script.py
 
 The skeleton script simply creates a Python function for each event type in the
-perf.data file. The body of each function simply prints the event name along
+``perf.data`` file. The body of each function simply prints the event name along
 with its parameters. For example:
 
 .. code-block:: python
@@ -766,7 +765,7 @@ with its parameters. For example:
                   print "skbaddr=%u, len=%u, name=%s\n" % (skbaddr, len, name),
 
 We can run that script directly to print all of the events contained in the
-perf.data file::
+``perf.data`` file::
 
    root@crownbay:~# perf script -s perf-script.py
 
@@ -795,8 +794,8 @@ perf.data file::
    syscalls__sys_exit_read     1 11624.859944032     1262 wget                  nr=3, ret=1024
 
 That in itself isn't very useful; after all, we can accomplish pretty much the
-same thing by simply running 'perf script' without arguments in the same
-directory as the perf.data file.
+same thing by simply running ``perf script`` without arguments in the same
+directory as the ``perf.data`` file.
 
 We can however replace the print statements in the generated function
 bodies with whatever we want, and thereby make it infinitely more
@@ -817,8 +816,8 @@ event. For example:
 
 Each event handler function in the generated code
 is modified to do this. For convenience, we define a common function
-called inc_counts() that each handler calls; inc_counts() simply tallies
-a count for each event using the 'counts' hash, which is a specialized
+called ``inc_counts()`` that each handler calls; ``inc_counts()`` simply tallies
+a count for each event using the ``counts`` hash, which is a specialized
 hash function that does Perl-like autovivification, a capability that's
 extremely useful for kinds of multi-level aggregation commonly used in
 processing traces (see perf's documentation on the Python language
@@ -836,7 +835,7 @@ binding for details):
 
 Finally, at the end of the trace processing run, we want to print the
 result of all the per-event tallies. For that, we use the special
-'trace_end()' function:
+``trace_end()`` function:
 
 .. code-block:: python
 
@@ -865,7 +864,7 @@ The end result is a summary of all the events recorded in the trace::
    syscalls__sys_exit_write                       8990
 
 Note that this is
-pretty much exactly the same information we get from 'perf stat', which
+pretty much exactly the same information we get from ``perf stat``, which
 goes a little way to support the idea mentioned previously that given
 the right kind of trace data, higher-level profiling-type summaries can
 be derived from it.
@@ -878,29 +877,29 @@ System-Wide Tracing and Profiling
 
 The examples so far have focused on tracing a particular program or
 workload --- in other words, every profiling run has specified the program
-to profile in the command-line e.g. 'perf record wget ...'.
+to profile in the command-line e.g. ``perf record wget ...``.
 
 It's also possible, and more interesting in many cases, to run a
 system-wide profile or trace while running the workload in a separate
 shell.
 
-To do system-wide profiling or tracing, you typically use the -a flag to
-'perf record'.
+To do system-wide profiling or tracing, you typically use the ``-a`` flag to
+``perf record``.
 
 To demonstrate this, open up one window and start the profile using the
--a flag (press Ctrl-C to stop tracing)::
+``-a`` flag (press ``Ctrl-C`` to stop tracing)::
 
    root@crownbay:~# perf record -g -a
    ^C[ perf record: Woken up 6 times to write data ]
    [ perf record: Captured and wrote 1.400 MB perf.data (~61172 samples) ]
 
-In another window, run the wget test::
+In another window, run the ``wget`` test::
 
    root@crownbay:~# wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
    linux-2.6.19.2.tar.b 100% \|*******************************\| 41727k 0:00:00 ETA
 
-Here we see entries not only for our wget load, but for
+Here we see entries not only for our ``wget`` load, but for
 other processes running on the system as well:
 
 .. image:: figures/perf-systemwide.png
@@ -909,12 +908,12 @@ other processes running on the system as well:
 
 In the snapshot above, we can see callchains that originate in libc, and
 a callchain from Xorg that demonstrates that we're using a proprietary X
-driver in userspace (notice the presence of 'PVR' and some other
+driver in userspace (notice the presence of ``PVR`` and some other
 unresolvable symbols in the expanded Xorg callchain).
 
 Note also that we have both kernel and userspace entries in the above
 snapshot. We can also tell perf to focus on userspace but providing a
-modifier, in this case 'u', to the 'cycles' hardware counter when we
+modifier, in this case ``u``, to the ``cycles`` hardware counter when we
 record a profile::
 
    root@crownbay:~# perf record -g -a -e cycles:u
@@ -925,25 +924,25 @@ record a profile::
    :align: center
    :width: 70%
 
-Notice in the screenshot above, we see only userspace entries ([.])
+Notice in the screenshot above, we see only userspace entries (``[.]``)
 
-Finally, we can press 'enter' on a leaf node and select the 'Zoom into
-DSO' menu item to show only entries associated with a specific DSO. In
-the screenshot below, we've zoomed into the 'libc' DSO which shows all
-the entries associated with the libc-xxx.so DSO.
+Finally, we can press ``Enter`` on a leaf node and select the ``Zoom into
+DSO`` menu item to show only entries associated with a specific DSO. In
+the screenshot below, we've zoomed into the ``libc`` DSO which shows all
+the entries associated with the ``libc-xxx.so`` DSO.
 
 .. image:: figures/perf-systemwide-libc.png
    :align: center
    :width: 70%
 
-We can also use the system-wide -a switch to do system-wide tracing.
+We can also use the system-wide ``-a`` switch to do system-wide tracing.
 Here we'll trace a couple of scheduler events::
 
    root@crownbay:~# perf record -a -e sched:sched_switch -e sched:sched_wakeup
    ^C[ perf record: Woken up 38 times to write data ]
    [ perf record: Captured and wrote 9.780 MB perf.data (~427299 samples) ]
 
-We can look at the raw output using 'perf script' with no arguments::
+We can look at the raw output using ``perf script`` with no arguments::
 
    root@crownbay:~# perf script
 
@@ -962,10 +961,10 @@ Filtering
 ^^^^^^^^^
 
 Notice that there are a lot of events that don't really have anything to
-do with what we're interested in, namely events that schedule 'perf'
+do with what we're interested in, namely events that schedule ``perf``
 itself in and out or that wake perf up. We can get rid of those by using
-the '--filter' option --- for each event we specify using -e, we can add a
---filter after that to filter out trace events that contain fields with
+the ``--filter`` option --- for each event we specify using ``-e``, we can add a
+``--filter`` after that to filter out trace events that contain fields with
 specific values::
 
    root@crownbay:~# perf record -a -e sched:sched_switch --filter 'next_comm != perf && prev_comm != perf' -e sched:sched_wakeup --filter 'comm != perf'
@@ -991,16 +990,16 @@ specific values::
        kworker/0:3  1209 [000]  7932.326214: sched_switch: prev_comm=kworker/0:3 prev_pid=1209 prev_prio=120 prev_state=S ==> next_comm=swapper/0 next_pid=0 next_prio=120
 
 In this case, we've filtered out all events that have
-'perf' in their 'comm' or 'comm_prev' or 'comm_next' fields. Notice that
+``perf`` in their ``comm``, ``comm_prev`` or ``comm_next`` fields. Notice that
 there are still events recorded for perf, but notice that those events
-don't have values of 'perf' for the filtered fields. To completely
+don't have values of ``perf`` for the filtered fields. To completely
 filter out anything from perf will require a bit more work, but for the
 purpose of demonstrating how to use filters, it's close enough.
 
 .. admonition:: Tying it Together
 
    These are exactly the same set of event filters defined by the trace
-   event subsystem. See the ftrace/tracecmd/kernelshark section for more
+   event subsystem. See the ftrace / tracecmd / kernelshark section for more
    discussion about these event filters.
 
 .. admonition:: Tying it Together
@@ -1028,9 +1027,9 @@ Using Dynamic Tracepoints
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
 perf isn't restricted to the fixed set of static tracepoints listed by
-'perf list'. Users can also add their own 'dynamic' tracepoints anywhere
+``perf list``. Users can also add their own "dynamic" tracepoints anywhere
 in the kernel. For instance, suppose we want to define our own
-tracepoint on do_fork(). We can do that using the 'perf probe' perf
+tracepoint on ``do_fork()``. We can do that using the ``perf probe`` perf
 subcommand::
 
    root@crownbay:~# perf probe do_fork
@@ -1042,8 +1041,8 @@ subcommand::
      perf record -e probe:do_fork -aR sleep 1
 
 Adding a new tracepoint via
-'perf probe' results in an event with all the expected files and format
-in /sys/kernel/debug/tracing/events, just the same as for static
+``perf probe`` results in an event with all the expected files and format
+in ``/sys/kernel/debug/tracing/events``, just the same as for static
 tracepoints (as discussed in more detail in the trace events subsystem
 section::
 
@@ -1076,7 +1075,7 @@ existence::
     probe:do_fork (on do_fork)
     probe:schedule (on schedule)
 
-Let's record system-wide ('sleep 30' is a
+Let's record system-wide (``sleep 30`` is a
 trick for recording system-wide but basically do nothing and then wake
 up after 30 seconds)::
 
@@ -1084,7 +1083,7 @@ up after 30 seconds)::
    [ perf record: Woken up 1 times to write data ]
    [ perf record: Captured and wrote 0.087 MB perf.data (~3812 samples) ]
 
-Using 'perf script' we can see each do_fork event that fired::
+Using ``perf script`` we can see each do_fork event that fired::
 
    root@crownbay:~# perf script
 
@@ -1125,7 +1124,7 @@ Using 'perf script' we can see each do_fork event that fired::
     matchbox-deskto  1311 [001] 34237.114106: do_fork: (c1028460)
                gaku  1312 [000] 34237.202388: do_fork: (c1028460)
 
-And using 'perf report' on the same file, we can see the
+And using ``perf report`` on the same file, we can see the
 callgraphs from starting a few programs during those 30 seconds:
 
 .. image:: figures/perf-probe-do_fork-profile.png
@@ -1170,7 +1169,7 @@ section can be found here:
 -  The top-level `perf(1) manpage <https://linux.die.net/man/1/perf>`__.
 
 Normally, you should be able to invoke the man pages via perf itself
-e.g. 'perf help' or 'perf help record'.
+e.g. ``perf help`` or ``perf help record``.
 
 To have the perf manpages installed on your target, modify your
 configuration as follows::
@@ -1179,7 +1178,7 @@ configuration as follows::
    DISTRO_FEATURES:append = " api-documentation"
 
 The man pages in text form, along with some other files, such as a set
-of examples, can also be found in the 'perf' directory of the kernel tree::
+of examples, can also be found in the ``perf`` directory of the kernel tree::
 
    tools/perf/Documentation
 
@@ -1190,7 +1189,7 @@ Tutorial <https://perf.wiki.kernel.org/index.php/Tutorial>`__
 ftrace
 ======
 
-'ftrace' literally refers to the 'ftrace function tracer' but in reality
+"ftrace" literally refers to the "ftrace function tracer" but in reality
 this encompasses a number of related tracers along with the
 infrastructure that they all make use of.
 
@@ -1204,16 +1203,16 @@ ftrace, trace-cmd, and kernelshark run on the target system, and are
 ready to go out-of-the-box --- no additional setup is necessary. For the
 rest of this section we assume you've ssh'ed to the host and will be
 running ftrace on the target. kernelshark is a GUI application and if
-you use the '-X' option to ssh you can have the kernelshark GUI run on
+you use the ``-X`` option to ssh you can have the kernelshark GUI run on
 the target but display remotely on the host if you want.
 
 Basic ftrace usage
 ------------------
 
-'ftrace' essentially refers to everything included in the /tracing
+"ftrace" essentially refers to everything included in the ``/tracing``
 directory of the mounted debugfs filesystem (Yocto follows the standard
-convention and mounts it at /sys/kernel/debug). Here's a listing of all
-the files found in /sys/kernel/debug/tracing on a Yocto system::
+convention and mounts it at ``/sys/kernel/debug``). Here's a listing of all
+the files found in ``/sys/kernel/debug/tracing`` on a Yocto system::
 
    root@sugarbay:/sys/kernel/debug/tracing# ls
    README                      kprobe_events               trace
@@ -1229,7 +1228,7 @@ the files found in /sys/kernel/debug/tracing on a Yocto system::
    free_buffer                 set_graph_function
 
 The files listed above are used for various purposes
-- some relate directly to the tracers themselves, others are used to set
+--- some relate directly to the tracers themselves, others are used to set
 tracing options, and yet others actually contain the tracing output when
 a tracer is in effect. Some of the functions can be guessed from their
 names, others need explanation; in any case, we'll cover some of the
@@ -1238,30 +1237,30 @@ the ftrace documentation.
 
 We'll start by looking at some of the available built-in tracers.
 
-cat'ing the 'available_tracers' file lists the set of available tracers::
+cat'ing the ``available_tracers`` file lists the set of available tracers::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat available_tracers
    blk function_graph function nop
 
-The 'current_tracer' file contains the tracer currently in effect::
+The ``current_tracer`` file contains the tracer currently in effect::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat current_tracer
    nop
 
 The above listing of current_tracer shows that the
-'nop' tracer is in effect, which is just another way of saying that
+``nop`` tracer is in effect, which is just another way of saying that
 there's actually no tracer currently in effect.
 
-echo'ing one of the available_tracers into current_tracer makes the
+echo'ing one of the available_tracers into ``current_tracer`` makes the
 specified tracer the current tracer::
 
    root@sugarbay:/sys/kernel/debug/tracing# echo function > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# cat current_tracer
    function
 
-The above sets the current tracer to be the 'function tracer'. This tracer
+The above sets the current tracer to be the ``function`` tracer. This tracer
 traces every function call in the kernel and makes it available as the
-contents of the 'trace' file. Reading the 'trace' file lists the
+contents of the ``trace`` file. Reading the ``trace`` file lists the
 currently buffered function calls that have been traced by the function
 tracer::
 
@@ -1318,11 +1317,11 @@ great way to learn about how the kernel code works in a dynamic sense.
 .. admonition:: Tying it Together
 
    The ftrace function tracer is also available from within perf, as the
-   ftrace:function tracepoint.
+   ``ftrace:function`` tracepoint.
 
 It is a little more difficult to follow the call chains than it needs to
 be --- luckily there's a variant of the function tracer that displays the
-callchains explicitly, called the 'function_graph' tracer::
+callchains explicitly, called the ``function_graph`` tracer::
 
    root@sugarbay:/sys/kernel/debug/tracing# echo function_graph > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
@@ -1437,7 +1436,7 @@ callchains explicitly, called the 'function_graph' tracer::
    3) + 13.784 us   |  }
    3)               |  sys_ioctl() {
 
-As you can see, the function_graph display is much easier
+As you can see, the ``function_graph`` display is much easier
 to follow. Also note that in addition to the function calls and
 associated braces, other events such as scheduler events are displayed
 in context. In fact, you can freely include any tracepoint available in
@@ -1455,9 +1454,9 @@ The 'trace events' Subsystem
 ----------------------------
 
 One especially important directory contained within the
-/sys/kernel/debug/tracing directory is the 'events' subdirectory, which
+``/sys/kernel/debug/tracing`` directory is the ``events`` subdirectory, which
 contains representations of every tracepoint in the system. Listing out
-the contents of the 'events' subdirectory, we see mainly another set of
+the contents of the ``events`` subdirectory, we see mainly another set of
 subdirectories::
 
    root@sugarbay:/sys/kernel/debug/tracing# cd events
@@ -1505,9 +1504,9 @@ subdirectories::
    drwxr-xr-x   26 root     root             0 Nov 14 23:19 writeback
 
 Each one of these subdirectories
-corresponds to a 'subsystem' and contains yet again more subdirectories,
+corresponds to a "subsystem" and contains yet again more subdirectories,
 each one of those finally corresponding to a tracepoint. For example,
-here are the contents of the 'kmem' subsystem::
+here are the contents of the ``kmem`` subsystem::
 
    root@sugarbay:/sys/kernel/debug/tracing/events# cd kmem
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem# ls -al
@@ -1529,7 +1528,7 @@ here are the contents of the 'kmem' subsystem::
    drwxr-xr-x    2 root     root             0 Nov 14 23:19 mm_page_pcpu_drain
 
 Let's see what's inside the subdirectory for a
-specific tracepoint, in this case the one for kmalloc::
+specific tracepoint, in this case the one for ``kmalloc``::
 
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem# cd kmalloc
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# ls -al
@@ -1540,12 +1539,12 @@ specific tracepoint, in this case the one for kmalloc::
    -r--r--r--    1 root     root             0 Nov 14 23:19 format
    -r--r--r--    1 root     root             0 Nov 14 23:19 id
 
-The 'format' file for the
+The ``format`` file for the
 tracepoint describes the event in memory, which is used by the various
 tracing tools that now make use of these tracepoint to parse the event
-and make sense of it, along with a 'print fmt' field that allows tools
+and make sense of it, along with a ``print fmt`` field that allows tools
 like ftrace to display the event as text. Here's what the format of the
-kmalloc event looks like::
+``kmalloc`` event looks like::
 
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# cat format
    name: kmalloc
@@ -1580,11 +1579,11 @@ kmalloc event looks like::
    long)(( gfp_t)0x08u), "GFP_MOVABLE"}, {(unsigned long)(( gfp_t)0), "GFP_NOTRACK"}, {(unsigned long)(( gfp_t)0x400000u), "GFP_NO_KSWAPD"},
    {(unsigned long)(( gfp_t)0x800000u), "GFP_OTHER_NODE"} ) : "GFP_NOWAIT"
 
-The 'enable' file
+The ``enable`` file
 in the tracepoint directory is what allows the user (or tools such as
-trace-cmd) to actually turn the tracepoint on and off. When enabled, the
-corresponding tracepoint will start appearing in the ftrace 'trace' file
-described previously. For example, this turns on the kmalloc tracepoint::
+``trace-cmd``) to actually turn the tracepoint on and off. When enabled, the
+corresponding tracepoint will start appearing in the ftrace ``trace`` file
+described previously. For example, this turns on the ``kmalloc`` tracepoint::
 
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# echo 1 > enable
 
@@ -1596,7 +1595,7 @@ events in the output buffer::
    root@sugarbay:/sys/kernel/debug/tracing# echo nop > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# echo 1 > tracing_on
 
-Now, if we look at the 'trace' file, we see nothing
+Now, if we look at the ``trace`` file, we see nothing
 but the kmalloc events we just turned on::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
@@ -1643,17 +1642,17 @@ but the kmalloc events we just turned on::
             <idle>-0     [000] ..s3 18156.400660: kmalloc: call_site=ffffffff81619b36 ptr=ffff88006d554800 bytes_req=512 bytes_alloc=512 gfp_flags=GFP_ATOMIC
    matchbox-termin-1361  [001] ...1 18156.552800: kmalloc: call_site=ffffffff81614050 ptr=ffff88006db34800 bytes_req=576 bytes_alloc=1024 gfp_flags=GFP_KERNEL|GFP_REPEAT
 
-To again disable the kmalloc event, we need to send 0 to the enable file::
+To again disable the ``kmalloc`` event, we need to send ``0`` to the ``enable`` file::
 
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# echo 0 > enable
 
 You can enable any number of events or complete subsystems (by
-using the 'enable' file in the subsystem directory) and get an
+using the ``enable`` file in the subsystem directory) and get an
 arbitrarily fine-grained idea of what's going on in the system by
 enabling as many of the appropriate tracepoints as applicable.
 
 A number of the tools described in this HOWTO do just that, including
-trace-cmd and kernelshark in the next section.
+``trace-cmd`` and kernelshark in the next section.
 
 .. admonition:: Tying it Together
 
@@ -1661,27 +1660,27 @@ trace-cmd and kernelshark in the next section.
    ftrace, but by many of the other tools covered in this document and
    they form a central point of integration for the various tracers
    available in Linux. They form a central part of the instrumentation
-   for the following tools: perf, lttng, ftrace, blktrace and SystemTap
+   for the following tools: perf, LTTng, ftrace, blktrace and SystemTap
 
 .. admonition:: Tying it Together
 
    Eventually all the special-purpose tracers currently available in
-   /sys/kernel/debug/tracing will be removed and replaced with
-   equivalent tracers based on the 'trace events' subsystem.
+   ``/sys/kernel/debug/tracing`` will be removed and replaced with
+   equivalent tracers based on the "trace events" subsystem.
 
-trace-cmd/kernelshark
----------------------
+trace-cmd / kernelshark
+-----------------------
 
-trace-cmd is essentially an extensive command-line 'wrapper' interface
+trace-cmd is essentially an extensive command-line "wrapper" interface
 that hides the details of all the individual files in
-/sys/kernel/debug/tracing, allowing users to specify specific particular
-events within the /sys/kernel/debug/tracing/events/ subdirectory and to
+``/sys/kernel/debug/tracing``, allowing users to specify specific particular
+events within the ``/sys/kernel/debug/tracing/events/`` subdirectory and to
 collect traces and avoid having to deal with those details directly.
 
 As yet another layer on top of that, kernelshark provides a GUI that
 allows users to start and stop traces and specify sets of events using
 an intuitive interface, and view the output as both trace events and as
-a per-CPU graphical display. It directly uses 'trace-cmd' as the
+a per-CPU graphical display. It directly uses trace-cmd as the
 plumbing that accomplishes all that underneath the covers (and actually
 displays the trace-cmd command it uses, as we'll see).
 
@@ -1689,7 +1688,7 @@ To start a trace using kernelshark, first start kernelshark::
 
    root@sugarbay:~# kernelshark
 
-Then bring up the 'Capture' dialog by
+Then bring up the ``Capture`` dialog by
 choosing from the kernelshark menu::
 
    Capture | Record
@@ -1707,10 +1706,10 @@ gets them for kernelshark.
 
 In the above screenshot, we've decided to explore the graphics subsystem
 a bit and so have chosen to trace all the tracepoints contained within
-the 'i915' and 'drm' subsystems.
+the ``i915`` and ``drm`` subsystems.
 
-After doing that, we can start and stop the trace using the 'Run' and
-'Stop' button on the lower right corner of the dialog (the same button
+After doing that, we can start and stop the trace using the ``Run`` and
+``Stop`` button on the lower right corner of the dialog (the same button
 will turn into the 'Stop' button after the trace has started):
 
 .. image:: figures/kernelshark-output-display.png
@@ -1721,7 +1720,7 @@ Notice that the right-hand pane shows the exact trace-cmd command-line
 that's used to run the trace, along with the results of the trace-cmd
 run.
 
-Once the 'Stop' button is pressed, the graphical view magically fills up
+Once the ``Stop`` button is pressed, the graphical view magically fills up
 with a colorful per-cpu display of the trace data, along with the
 detailed event listing below that:
 
@@ -1729,8 +1728,8 @@ detailed event listing below that:
    :align: center
    :width: 70%
 
-Here's another example, this time a display resulting from tracing 'all
-events':
+Here's another example, this time a display resulting from tracing ``all
+events``:
 
 .. image:: figures/kernelshark-all.png
    :align: center
@@ -1779,12 +1778,12 @@ systemtap
 SystemTap is a system-wide script-based tracing and profiling tool.
 
 SystemTap scripts are C-like programs that are executed in the kernel to
-gather/print/aggregate data extracted from the context they end up being
+gather / print / aggregate data extracted from the context they end up being
 invoked under.
 
 For example, this probe from the `SystemTap
 tutorial <https://sourceware.org/systemtap/tutorial/>`__ simply prints a
-line every time any process on the system open()s a file. For each line,
+line every time any process on the system runs ``open()`` on a file. For each line,
 it prints the executable name of the program that opened the file, along
 with its PID, and the name of the file it opened (or tried to open),
 which it extracts from the open syscall's argstr.
@@ -1809,19 +1808,19 @@ file containing the above text is trace_open.stp::
    # stap trace_open.stp
 
 What systemtap does under the covers to run this probe is 1) parse and
-convert the probe to an equivalent 'C' form, 2) compile the 'C' form
+convert the probe to an equivalent "C" form, 2) compile the "C" form
 into a kernel module, 3) insert the module into the kernel, which arms
 it, and 4) collect the data generated by the probe and display it to the
 user.
 
-In order to accomplish steps 1 and 2, the 'stap' program needs access to
+In order to accomplish steps 1 and 2, the ``stap`` program needs access to
 the kernel build system that produced the kernel that the probed system
-is running. In the case of a typical embedded system (the 'target'), the
+is running. In the case of a typical embedded system (the "target"), the
 kernel build system unfortunately isn't typically part of the image
-running on the target. It is normally available on the 'host' system
+running on the target. It is normally available on the "host" system
 that produced the target image however; in such cases, steps 1 and 2 are
 executed on the host system, and steps 3 and 4 are executed on the
-target system, using only the systemtap 'runtime'.
+target system, using only the systemtap "runtime".
 
 The systemtap support in Yocto assumes that only steps 3 and 4 are run
 on the target; it is possible to do everything on the target, but this
@@ -1838,12 +1837,12 @@ systemtap Setup
 ---------------
 
 Those are a lot of steps and a lot of details, but fortunately Yocto
-includes a script called 'crosstap' that will take care of those
+includes a script called ``crosstap`` that will take care of those
 details, allowing you to simply execute a systemtap script on the remote
 target, with arguments if necessary.
 
 In order to do this from a remote host, however, you need to have access
-to the build for the image you booted. The 'crosstap' script provides
+to the build for the image you booted. The ``crosstap`` script provides
 details on how to do this if you run the script on the host without
 having done a build::
 
@@ -1852,29 +1851,35 @@ having done a build::
    Error: No target kernel build found.
    Did you forget to create a local build of your image?
 
-   'crosstap' requires a local sdk build of the target system
-   (or a build that includes 'tools-profile') in order to build
-   kernel modules that can probe the target system.
-
-   Practically speaking, that means you need to do the following:
-    - If you're running a pre-built image, download the release
-      and/or BSP tarballs used to build the image.
-    - If you're working from git sources, just clone the metadata
-      and BSP layers needed to build the image you'll be booting.
-    - Make sure you're properly set up to build a new image (see
-      the BSP README and/or the widely available basic documentation
-      that discusses how to build images).
-    - Build an -sdk version of the image e.g.:
-        $ bitbake core-image-sato-sdk
-    OR
-    - Build a non-sdk image but include the profiling tools:
-        [ edit local.conf and add 'tools-profile' to the end of
-          the EXTRA_IMAGE_FEATURES variable ]
-        $ bitbake core-image-sato
+'crosstap' requires a local sdk build of the target system
+(or a build that includes 'tools-profile') in order to build
+kernel modules that can probe the target system.
+
+Practically speaking, that means you need to do the following:
+
+-  If you're running a pre-built image, download the release
+   and/or BSP tarballs used to build the image.
+
+-  If you're working from git sources, just clone the metadata
+   and BSP layers needed to build the image you'll be booting.
+
+-  Make sure you're properly set up to build a new image (see
+   the BSP README and/or the widely available basic documentation
+   that discusses how to build images).
+
+-  Build an -sdk version of the image e.g.::
+
+      $ bitbake core-image-sato-sdk
+
+-  Or build a non-sdk image but include the profiling tools
+   (edit ``local.conf`` and add ``tools-profile`` to the end of
+   :term:``EXTRA_IMAGE_FEATURES`` variable)::
+
+      $ bitbake core-image-sato
 
    Once you've build the image on the host system, you're ready to
-   boot it (or the equivalent pre-built image) and use 'crosstap'
-   to probe it (you need to source the environment as usual first):
+   boot it (or the equivalent pre-built image) and use ``crosstap``
+   to probe it (you need to source the environment as usual first)::
 
       $ source oe-init-build-env
       $ cd ~/my/systemtap/scripts
@@ -1882,23 +1887,22 @@ having done a build::
 
 .. note::
 
-   SystemTap, which uses 'crosstap', assumes you can establish an ssh
+   SystemTap, which uses ``crosstap``, assumes you can establish an ssh
    connection to the remote target. Please refer to the crosstap wiki
-   page for details on verifying ssh connections at
-   . Also, the ability to ssh into the target system is not enabled by
-   default in \*-minimal images.
+   page for details on verifying ssh connections. Also, the ability to ssh
+   into the target system is not enabled by default in ``*-minimal`` images.
 
 So essentially what you need to
-do is build an SDK image or image with 'tools-profile' as detailed in
+do is build an SDK image or image with ``tools-profile`` as detailed in
 the ":ref:`profile-manual/intro:General Setup`" section of this
 manual, and boot the resulting target image.
 
 .. note::
 
    If you have a :term:`Build Directory` containing multiple machines, you need
-   to have the :term:`MACHINE` you're connecting to selected in local.conf, and
+   to have the :term:`MACHINE` you're connecting to selected in ``local.conf``, and
    the kernel in that machine's :term:`Build Directory` must match the kernel on
-   the booted system exactly, or you'll get the above 'crosstap' message
+   the booted system exactly, or you'll get the above ``crosstap`` message
    when you try to invoke a script.
 
 Running a Script on a Target
@@ -1922,8 +1926,8 @@ the target::
 
    You can also run generated QEMU images with a command like 'runqemu qemux86-64'
 
-Once you've done that, you can cd to whatever
-directory contains your scripts and use 'crosstap' to run the script::
+Once you've done that, you can ``cd`` to whatever
+directory contains your scripts and use ``crosstap`` to run the script::
 
    $ cd /path/to/my/systemap/script
    $ crosstap root@192.168.7.2 trace_open.stp
@@ -1937,9 +1941,8 @@ Try ssh'ing to the target and see what happens::
 
    $ ssh root@192.168.7.2
 
-A lot of the time, connection
-problems are due specifying a wrong IP address or having a 'host key
-verification error'.
+Connection problems are often due specifying a wrong IP address or having a ``host key
+verification error``.
 
 If everything worked as planned, you should see something like this
 (enter the password when prompted, or press enter if it's set up to use
@@ -1977,16 +1980,16 @@ outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 
 Sysprof is a GUI-based application that runs on the target system. For
 the rest of this document we assume you've ssh'ed to the host and will
-be running Sysprof on the target (you can use the '-X' option to ssh and
+be running Sysprof on the target (you can use the ``-X`` option to ssh and
 have the Sysprof GUI run on the target but display remotely on the host
 if you want).
 
 Basic Sysprof Usage
 -------------------
 
-To start profiling the system, you simply press the 'Start' button. To
+To start profiling the system, you simply press the ``Start`` button. To
 stop profiling and to start viewing the profile data in one easy step,
-press the 'Profile' button.
+press the ``Profile`` button.
 
 Once you've pressed the profile button, the three panes will fill up
 with profiling data:
@@ -2002,7 +2005,7 @@ perf's default callee-oriented callchain display.
 
 In the screenshot above, we're focusing on ``__copy_to_user_ll()`` and
 looking up the callchain we can see that one of the callers of
-``__copy_to_user_ll`` is sys_read() and the complete callpath between them.
+``__copy_to_user_ll`` is ``sys_read()`` and the complete callpath between them.
 Notice that this is essentially a portion of the same information we saw
 in the perf display shown in the perf section of this page.
 
@@ -2011,7 +2014,7 @@ in the perf display shown in the perf section of this page.
    :width: 70%
 
 Similarly, the above is a snapshot of the Sysprof display of a
-copy-from-user callchain.
+``copy-from-user`` callchain.
 
 Finally, looking at the third Sysprof pane in the lower left, we can see
 a list of all the callers of a particular function selected in the top
@@ -2027,10 +2030,10 @@ to the selected function, and so on.
 
 .. admonition:: Tying it Together
 
-   If you like sysprof's 'caller-oriented' display, you may be able to
-   approximate it in other tools as well. For example, 'perf report' has
-   the -g (--call-graph) option that you can experiment with; one of the
-   options is 'caller' for an inverted caller-based callgraph display.
+   If you like sysprof's ``caller-oriented`` display, you may be able to
+   approximate it in other tools as well. For example, ``perf report`` has
+   the ``-g`` (``--call-graph``) option that you can experiment with; one of the
+   options is ``caller`` for an inverted caller-based callgraph display.
 
 Sysprof Documentation
 ---------------------
@@ -2054,7 +2057,7 @@ Collecting and Viewing Traces
 -----------------------------
 
 Once you've applied the above commits and built and booted your image
-(you need to build the core-image-sato-sdk image or use one of the other
+(you need to build the ``core-image-sato-sdk`` image or use one of the other
 methods described in the ":ref:`profile-manual/intro:General Setup`" section), you're ready to start
 tracing.
 
@@ -2139,14 +2142,14 @@ You can now view the trace in text form on the target::
 
 You can now safely destroy the trace
 session (note that this doesn't delete the trace --- it's still there in
-~/lttng-traces)::
+``~/lttng-traces``)::
 
    root@crownbay:~# lttng destroy
    Session auto-20121015-232120 destroyed at /home/root
 
 Note that the trace is saved in a directory of the same name as returned by
-'lttng create', under the ~/lttng-traces directory (note that you can change this by
-supplying your own name to 'lttng create')::
+``lttng create``, under the ``~/lttng-traces`` directory (note that you can change this by
+supplying your own name to ``lttng create``)::
 
    root@crownbay:~# ls -al ~/lttng-traces
    drwxrwx---    3 root     root          1024 Oct 15 23:21 .
@@ -2157,12 +2160,12 @@ Collecting and viewing a userspace trace on the target (inside a shell)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 For LTTng userspace tracing, you need to have a properly instrumented
-userspace program. For this example, we'll use the 'hello' test program
-generated by the lttng-ust build.
+userspace program. For this example, we'll use the ``hello`` test program
+generated by the ``lttng-ust`` build.
 
-The 'hello' test program isn't installed on the root filesystem by the lttng-ust
-build, so we need to copy it over manually. First cd into the build
-directory that contains the hello executable::
+The ``hello`` test program isn't installed on the root filesystem by the ``lttng-ust``
+build, so we need to copy it over manually. First ``cd`` into the build
+directory that contains the ``hello`` executable::
 
    $ cd build/tmp/work/core2_32-poky-linux/lttng-ust/2.0.5-r0/git/tests/hello/.libs
 
@@ -2170,7 +2173,7 @@ Copy that over to the target machine::
 
    $ scp hello root@192.168.1.20:
 
-You now have the instrumented lttng 'hello world' test program on the
+You now have the instrumented LTTng "hello world" test program on the
 target, ready to test.
 
 First, from the host, ssh to the target::
@@ -2198,7 +2201,7 @@ Start the trace::
    root@crownbay:~# lttng start
    Tracing started for session auto-20190303-021943
 
-Run the instrumented hello world program::
+Run the instrumented "hello world" program::
 
    root@crownbay:~# ./hello
    Hello, World!
@@ -2222,7 +2225,7 @@ You can now view the trace in text form on the target::
    .
 
 You can now safely destroy the trace session (note that this doesn't delete the
-trace --- it's still there in ~/lttng-traces)::
+trace --- it's still there in ``~/lttng-traces``)::
 
    root@crownbay:~# lttng destroy
    Session auto-20190303-021943 destroyed at /home/root
@@ -2266,12 +2269,12 @@ will be running blkrace on the target.
 Basic blktrace Usage
 --------------------
 
-To record a trace, simply run the 'blktrace' command, giving it the name
+To record a trace, simply run the ``blktrace`` command, giving it the name
 of the block device you want to trace activity on::
 
    root@crownbay:~# blktrace /dev/sdc
 
-In another shell, execute a workload you want to trace. ::
+In another shell, execute a workload you want to trace::
 
    root@crownbay:/media/sdc# rm linux-2.6.19.2.tar.bz2; wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2; sync
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -2280,7 +2283,7 @@ In another shell, execute a workload you want to trace. ::
 Press Ctrl-C in the blktrace shell to stop the trace. It
 will display how many events were logged, along with the per-cpu file
 sizes (blktrace records traces in per-cpu kernel buffers and simply
-dumps them to userspace for blkparse to merge and sort later). ::
+dumps them to userspace for blkparse to merge and sort later)::
 
    ^C=== sdc ===
     CPU  0:                 7082 events,      332 KiB data
@@ -2296,7 +2299,7 @@ with the device name as the first part of the filename::
    -rw-r--r--    1 root     root        339938 Oct 27 22:40 sdc.blktrace.0
    -rw-r--r--    1 root     root         75753 Oct 27 22:40 sdc.blktrace.1
 
-To view the trace events, simply invoke 'blkparse' in the directory
+To view the trace events, simply invoke ``blkparse`` in the directory
 containing the trace files, giving it the device name that forms the
 first part of the filenames::
 
@@ -2395,7 +2398,7 @@ Live Mode
 ~~~~~~~~~
 
 blktrace and blkparse are designed from the ground up to be able to
-operate together in a 'pipe mode' where the stdout of blktrace can be
+operate together in a "pipe mode" where the stdout of blktrace can be
 fed directly into the stdin of blkparse::
 
    root@crownbay:~# blktrace /dev/sdc -o - | blkparse -i -
@@ -2441,13 +2444,13 @@ On the host system, you should see this::
 
    server: connection from 192.168.1.43
 
-In another shell, execute a workload you want to trace. ::
+In another shell, execute a workload you want to trace::
 
    root@crownbay:/media/sdc# rm linux-2.6.19.2.tar.bz2; wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2; sync
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
    linux-2.6.19.2.tar.b 100% \|*******************************\| 41727k 0:00:00 ETA
 
-When it's done, do a Ctrl-C on the target system to stop the
+When it's done, do a ``Ctrl-C`` on the target system to stop the
 trace::
 
    ^C=== sdc ===
@@ -2472,7 +2475,7 @@ save the target output inside a hostname-timestamp directory::
    drwxr-sr-x    4 root     root          1024 Oct 26 18:24 ..
    drwxr-xr-x    2 root     root          1024 Oct 28 02:40 192.168.1.43-2012-10-28-02:40:56
 
-cd into that directory to see the output files::
+``cd`` into that directory to see the output files::
 
    $ ls -l
    -rw-r--r--    1 root     root        369193 Oct 28 02:44 sdc.blktrace.0
@@ -2539,14 +2542,14 @@ It's also possible to trace block I/O using only
 can be useful for casual tracing if you don't want to bother dealing with the
 userspace tools.
 
-To enable tracing for a given device, use /sys/block/xxx/trace/enable,
-where xxx is the device name. This for example enables tracing for
-/dev/sdc::
+To enable tracing for a given device, use ``/sys/block/xxx/trace/enable``,
+where ``xxx`` is the device name. This for example enables tracing for
+``/dev/sdc``::
 
    root@crownbay:/sys/kernel/debug/tracing# echo 1 > /sys/block/sdc/trace/enable
 
 Once you've selected the device(s) you want
-to trace, selecting the 'blk' tracer will turn the blk tracer on::
+to trace, selecting the ``blk`` tracer will turn the blk tracer on::
 
    root@crownbay:/sys/kernel/debug/tracing# cat available_tracers
    blk function_graph function nop
@@ -2557,7 +2560,7 @@ Execute the workload you're interested in::
 
    root@crownbay:/sys/kernel/debug/tracing# cat /media/sdc/testfile.txt
 
-And look at the output (note here that we're using 'trace_pipe' instead of
+And look at the output (note here that we're using ``trace_pipe`` instead of
 trace to capture this trace --- this allows us to wait around on the pipe
 for data to appear)::
 
@@ -2594,8 +2597,8 @@ section can be found here:
 
 -  https://linux.die.net/man/8/btrace
 
-The above manpages, along with manpages for the other blktrace utilities
-(btt, blkiomon, etc) can be found in the /doc directory of the blktrace
+The above manpages, along with manuals for the other blktrace utilities
+(btt, blkiomon, etc) can be found in the ``/doc`` directory of the blktrace
 tools git repo::
 
    $ git clone git://git.kernel.dk/blktrace.git
-- 
2.34.1


