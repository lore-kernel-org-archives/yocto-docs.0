Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E62CD1282
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.51975.1711373269857985877
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X8TU2kfq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D044960007;
	Mon, 25 Mar 2024 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vhJGYpW4LLCI/hgEPqJJOA6HiofMOBDmcFFnWHCNoI=;
	b=X8TU2kfqw3zuJ5cyWc8r/oYkgxaDXGA9dIIco5pwU8BbEVj9ucupzAybBXFlMUAyuDKfGw
	9t++INXvGxrGUfB1UZZIXwJ8Dz1eV4rRJ6Mao8n21Z3HS0TjTpIS9PoRWKDM+Z61vS+Op0
	EseGcnLJQkUg6XgioE2tlO0C8swVr+XBvvtpp7vesezeid5i4r93OYRYo4QsmMQsLqAzYb
	Vf2mEyHMY4EBbvu7h1PSHla3+qRNJ0QKTOPwF+vlsc1MAneNys4VMfzUC9tFtrdPNbtRRR
	YgodpG4Du7XAY1D9PGGMN/ufAW0kNMua+TP3ylBTo43VIDS6U1+4QVNc1R5Alw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 7/9] profile-manual: usage.rst: further style improvements
Date: Mon, 25 Mar 2024 14:27:35 +0100
Message-Id: <20240325132737.3018073-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
References: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5005

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to errors reported by "make stylecheck"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst        | 335 +++++++++---------
 .../config/vocabularies/OpenSource/accept.txt |  20 +-
 .../config/vocabularies/Yocto/accept.txt      |   5 +-
 3 files changed, 187 insertions(+), 173 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 28dcb969a0..542bd918b9 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -10,7 +10,7 @@ Basic Usage (with examples) for each of the Yocto Tracing Tools
 This chapter presents basic usage examples for each of the tracing
 tools.
 
-Perf
+perf
 ====
 
 The perf tool is the profiling and tracing tool that comes bundled
@@ -26,12 +26,12 @@ of what's going on.
 
 In many ways, perf aims to be a superset of all the tracing and
 profiling tools available in Linux today, including all the other tools
-covered in this HOWTO. The past couple of years have seen perf subsume a
+covered in this How-to. The past couple of years have seen perf subsume a
 lot of the functionality of those other tools and, at the same time,
 those other tools have removed large portions of their previous
 functionality and replaced it with calls to the equivalent functionality
 now implemented by the perf subsystem. Extrapolation suggests that at
-some point those other tools will simply become completely redundant and
+some point those other tools will become completely redundant and
 go away; until then, we'll cover those other tools in these pages and in
 many cases show how the same things can be accomplished in perf and the
 other tools when it seems useful to do so.
@@ -41,7 +41,7 @@ want to apply the tool; full documentation can be found either within
 the tool itself or in the manual pages at
 `perf(1) <https://linux.die.net/man/1/perf>`__.
 
-Perf Setup
+perf Setup
 ----------
 
 For this section, we'll assume you've already performed the basic setup
@@ -54,14 +54,14 @@ image built with the following in your ``local.conf`` file::
 
 perf runs on the target system for the most part. You can archive
 profile data and copy it to the host for analysis, but for the rest of
-this document we assume you've ssh'ed to the host and will be running
-the perf commands on the target.
+this document we assume you're connected to the host through SSH and will be
+running the perf commands on the target.
 
-Basic Perf Usage
+Basic perf Usage
 ----------------
 
 The perf tool is pretty much self-documenting. To remind yourself of the
-available commands, simply type ``perf``, which will show you basic usage
+available commands, just type ``perf``, which will show you basic usage
 along with the available perf subcommands::
 
    root@crownbay:~# perf
@@ -101,7 +101,7 @@ As a simple test case, we'll profile the ``wget`` of a fairly large file,
 which is a minimally interesting case because it has both file and
 network I/O aspects, and at least in the case of standard Yocto images,
 it's implemented as part of BusyBox, so the methods we use to analyze it
-can be used in a very similar way to the whole host of supported BusyBox
+can be used in a similar way to the whole host of supported BusyBox
 applets in Yocto::
 
    root@crownbay:~# rm linux-2.6.19.2.tar.bz2; \
@@ -164,17 +164,17 @@ hits and misses::
 
         44.831023415 seconds time elapsed
 
-So ``perf stat`` gives us a nice easy
+As you can see, ``perf stat`` gives us a nice easy
 way to get a quick overview of what might be happening for a set of
 events, but normally we'd need a little more detail in order to
 understand what's going on in a way that we can act on in a useful way.
 
 To dive down into a next level of detail, we can use ``perf record`` /
 ``perf report`` which will collect profiling data and present it to use using an
-interactive text-based UI (or simply as text if we specify ``--stdio`` to
+interactive text-based UI (or just as text if we specify ``--stdio`` to
 ``perf report``).
 
-As our first attempt at profiling this workload, we'll simply run ``perf
+As our first attempt at profiling this workload, we'll just run ``perf
 record``, handing it the workload we want to profile (everything after
 ``perf record`` and any perf options we hand it --- here none, will be
 executed in a new shell). perf collects samples until the process exits
@@ -189,7 +189,7 @@ directory::
    [ perf record: Captured and wrote 0.176 MB perf.data (~7700 samples) ]
 
 To see the results in a
-"text-based UI" (tui), simply run ``perf report``, which will read the
+"text-based UI" (tui), just run ``perf report``, which will read the
 perf.data file in the current working directory and display the results
 in an interactive UI::
 
@@ -203,10 +203,10 @@ The above screenshot displays a "flat" profile, one entry for each
 profiling run, ordered from the most popular to the least (perf has
 options to sort in various orders and keys as well as display entries
 only above a certain threshold and so on --- see the perf documentation
-for details). Note that this includes both userspace functions (entries
+for details). Note that this includes both user space functions (entries
 containing a ``[.]``) and kernel functions accounted to the process (entries
 containing a ``[k]``). perf has command-line modifiers that can be used to
-restrict the profiling to kernel or userspace, among others.
+restrict the profiling to kernel or user space, among others.
 
 Notice also that the above report shows an entry for ``busybox``, which is
 the executable that implements ``wget`` in Yocto, but that instead of a
@@ -217,7 +217,7 @@ Before we do that, however, let's try running a different profile, one
 which shows something a little more interesting. The only difference
 between the new profile and the previous one is that we'll add the ``-g``
 option, which will record not just the address of a sampled function,
-but the entire callchain to the sampled function as well::
+but the entire call chain to the sampled function as well::
 
    root@crownbay:~# perf record -g wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -231,26 +231,26 @@ but the entire callchain to the sampled function as well::
 .. image:: figures/perf-wget-g-copy-to-user-expanded-stripped.png
    :align: center
 
-Using the callgraph view, we can actually see not only which functions
+Using the call graph view, we can actually see not only which functions
 took the most time, but we can also see a summary of how those functions
 were called and learn something about how the program interacts with the
 kernel in the process.
 
 Notice that each entry in the above screenshot now contains a ``+`` on the
-left-hand side. This means that we can expand the entry and drill down
-into the callchains that feed into that entry. Pressing ``Enter`` on any
-one of them will expand the callchain (you can also press ``E`` to expand
+left side. This means that we can expand the entry and drill down
+into the call chains that feed into that entry. Pressing ``Enter`` on any
+one of them will expand the call chain (you can also press ``E`` to expand
 them all at the same time or ``C`` to collapse them all).
 
 In the screenshot above, we've toggled the ``__copy_to_user_ll()`` entry
-and several subnodes all the way down. This lets us see which callchains
+and several subnodes all the way down. This lets us see which call chains
 contributed to the profiled ``__copy_to_user_ll()`` function which
 contributed 1.77% to the total profile.
 
-As a bit of background explanation for these callchains, think about
-what happens at a high level when you run wget to get a file out on the
+As a bit of background explanation for these call chains, think about
+what happens at a high level when you run ``wget`` to get a file out on the
 network. Basically what happens is that the data comes into the kernel
-via the network connection (socket) and is passed to the userspace
+via the network connection (socket) and is passed to the user space
 program ``wget`` (which is actually a part of BusyBox, but that's not
 important for now), which takes the buffers the kernel passes to it and
 writes it to a disk file to save it.
@@ -260,15 +260,15 @@ is the part where the kernel passes the data it has read from the socket
 down to wget i.e. a ``copy-to-user``.
 
 Notice also that here there's also a case where the hex value is
-displayed in the callstack, here in the expanded ``sys_clock_gettime()``
-function. Later we'll see it resolve to a userspace function call in
-busybox.
+displayed in the call stack, here in the expanded ``sys_clock_gettime()``
+function. Later we'll see it resolve to a user space function call in
+BusyBox.
 
 .. image:: figures/perf-wget-g-copy-from-user-expanded-stripped.png
    :align: center
 
 The above screenshot shows the other half of the journey for the data ---
-from the ``wget`` program's userspace buffers to disk. To get the buffers to
+from the ``wget`` program's user space buffers to disk. To get the buffers to
 disk, the wget program issues a ``write(2)``, which does a ``copy-from-user`` to
 the kernel, which then takes care via some circuitous path (probably
 also present somewhere in the profile data), to get it safely to disk.
@@ -278,8 +278,8 @@ of how to extract useful information out of it, let's get back to the
 task at hand and see if we can get some basic idea about where the time
 is spent in the program we're profiling, wget. Remember that wget is
 actually implemented as an applet in BusyBox, so while the process name
-is ``wget``, the executable we're actually interested in is BusyBox. So
-let's expand the first entry containing BusyBox:
+is ``wget``, the executable we're actually interested in is ``busybox``.
+Therefore, let's expand the first entry containing BusyBox:
 
 .. image:: figures/perf-wget-busybox-expanded-stripped.png
    :align: center
@@ -289,7 +289,7 @@ hex value instead of a symbol as with most of the kernel entries.
 Expanding the BusyBox entry doesn't make it any better.
 
 The problem is that perf can't find the symbol information for the
-busybox binary, which is actually stripped out by the Yocto build
+``busybox`` binary, which is actually stripped out by the Yocto build
 system.
 
 One way around that is to put the following in your ``local.conf`` file
@@ -299,20 +299,20 @@ when you build the image::
 
 However, we already have an image with the binaries stripped, so
 what can we do to get perf to resolve the symbols? Basically we need to
-install the debuginfo for the BusyBox package.
+install the debugging information for the BusyBox package.
 
 To generate the debug info for the packages in the image, we can add
 ``dbg-pkgs`` to :term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::
 
    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"
 
-Additionally, in order to generate the type of debuginfo that perf
+Additionally, in order to generate the type of debugging information that perf
 understands, we also need to set :term:`PACKAGE_DEBUG_SPLIT_STYLE`
 in the ``local.conf`` file::
 
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
 
-Once we've done that, we can install the debuginfo for BusyBox. The
+Once we've done that, we can install the debugging information for BusyBox. The
 debug packages once built can be found in ``build/tmp/deploy/rpm/*``
 on the host system. Find the ``busybox-dbg-...rpm`` file and copy it
 to the target. For example::
@@ -320,11 +320,11 @@ to the target. For example::
    [trz@empanada core2]$ scp /home/trz/yocto/crownbay-tracing-dbg/build/tmp/deploy/rpm/core2_32/busybox-dbg-1.20.2-r2.core2_32.rpm root@192.168.1.31:
    busybox-dbg-1.20.2-r2.core2_32.rpm                     100% 1826KB   1.8MB/s   00:01
 
-Now install the debug rpm on the target::
+Now install the debug RPM on the target::
 
    root@crownbay:~# rpm -i busybox-dbg-1.20.2-r2.core2_32.rpm
 
-Now that the debuginfo is installed, we see that the BusyBox entries now display
+Now that the debugging information is installed, we see that the BusyBox entries now display
 their functions symbolically:
 
 .. image:: figures/perf-wget-busybox-debuginfo.png
@@ -344,7 +344,7 @@ expanded all the nodes using the ``E`` key):
 .. image:: figures/perf-wget-busybox-dso-zoom.png
    :align: center
 
-Finally, we can see that now that the BusyBox debuginfo is installed,
+Finally, we can see that now that the BusyBox debugging information is installed,
 the previously unresolved symbol in the ``sys_clock_gettime()`` entry
 mentioned previously is now resolved, and shows that the
 ``sys_clock_gettime`` system call that was the source of 6.75% of the
@@ -376,8 +376,8 @@ counter, something other than the default ``cycles``.
 The tracing and profiling infrastructure in Linux has become unified in
 a way that allows us to use the same tool with a completely different
 set of counters, not just the standard hardware counters that
-traditional tools have had to restrict themselves to (of course the
-traditional tools can also make use of the expanded possibilities now
+traditional tools have had to restrict themselves to (the
+traditional tools can now actually make use of the expanded possibilities now
 available to them, and in some cases have, as mentioned previously).
 
 We can get a list of the available events that can be used to profile a
@@ -517,14 +517,14 @@ workload via ``perf list``::
 .. admonition:: Tying it Together
 
    These are exactly the same set of events defined by the trace event
-   subsystem and exposed by ftrace / tracecmd / kernelshark as files in
+   subsystem and exposed by ftrace / trace-cmd / KernelShark as files in
    ``/sys/kernel/debug/tracing/events``, by SystemTap as
    kernel.trace("tracepoint_name") and (partially) accessed by LTTng.
 
 Only a subset of these would be of interest to us when looking at this
 workload, so let's choose the most likely subsystems (identified by the
-string before the colon in the Tracepoint events) and do a ``perf stat``
-run using only those wildcarded subsystems::
+string before the colon in the ``Tracepoint`` events) and do a ``perf stat``
+run using only those subsystem wildcards::
 
    root@crownbay:~# perf stat -e skb:* -e net:* -e napi:* -e sched:* -e workqueue:* -e irq:* -e syscalls:* wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2
    Performance counter stats for 'wget &YOCTO_DL_URL;/mirror/sources/linux-2.6.19.2.tar.bz2':
@@ -614,8 +614,8 @@ accounts for the function name actually displayed in the profile:
      }
 
 A couple of the more interesting
-callchains are expanded and displayed above, basically some network
-receive paths that presumably end up waking up wget (busybox) when
+call chains are expanded and displayed above, basically some network
+receive paths that presumably end up waking up wget (BusyBox) when
 network data is ready.
 
 Note that because tracepoints are normally used for tracing, the default
@@ -635,7 +635,7 @@ high-level view of what's going on with a workload or across the system.
 It is however by definition an approximation, as suggested by the most
 prominent word associated with it, ``sampling``. On the one hand, it
 allows a representative picture of what's going on in the system to be
-cheaply taken, but on the other hand, that cheapness limits its utility
+cheaply taken, but alternatively, that cheapness limits its utility
 when that data suggests a need to "dive down" more deeply to discover
 what's really going on. In such cases, the only way to see what's really
 going on is to be able to look at (or summarize more intelligently) the
@@ -700,7 +700,7 @@ an infinite variety of ways.
 Another way to look at it is that there are only so many ways that the
 'primitive' counters can be used on their own to generate interesting
 output; to get anything more complicated than simple counts requires
-some amount of additional logic, which is typically very specific to the
+some amount of additional logic, which is typically specific to the
 problem at hand. For example, if we wanted to make use of a 'counter'
 that maps to the value of the time difference between when a process was
 scheduled to run on a processor and the time it actually ran, we
@@ -711,12 +711,12 @@ standard profiling tools how much data every process on the system reads
 and writes, along with how many of those reads and writes fail
 completely. If we have sufficient trace data, however, we could with the
 right tools easily extract and present that information, but we'd need
-something other than pre-canned profiling tools to do that.
+something other than ready-made profiling tools to do that.
 
 Luckily, there is a general-purpose way to handle such needs, called
 "programming languages". Making programming languages easily available
 to apply to such problems given the specific format of data is called a
-'programming language binding' for that data and language. Perf supports
+'programming language binding' for that data and language. perf supports
 two programming language bindings, one for Python and one for Perl.
 
 .. admonition:: Tying it Together
@@ -726,7 +726,7 @@ two programming language bindings, one for Python and one for Perl.
    DProbes dpcc compiler, an ANSI C compiler which targeted a low-level
    assembly language running on an in-kernel interpreter on the target
    system. This is exactly analogous to what Sun's DTrace did, except
-   that DTrace invented its own language for the purpose. Systemtap,
+   that DTrace invented its own language for the purpose. SystemTap,
    heavily inspired by DTrace, also created its own one-off language,
    but rather than running the product on an in-kernel interpreter,
    created an elaborate compiler-based machinery to translate its
@@ -739,8 +739,8 @@ entry / exit events we recorded::
    root@crownbay:~# perf script -g python
    generated Python script: perf-script.py
 
-The skeleton script simply creates a Python function for each event type in the
-``perf.data`` file. The body of each function simply prints the event name along
+The skeleton script just creates a Python function for each event type in the
+``perf.data`` file. The body of each function just prints the event name along
 with its parameters. For example:
 
 .. code-block:: python
@@ -783,7 +783,7 @@ We can run that script directly to print all of the events contained in the
    syscalls__sys_exit_read     1 11624.859944032     1262 wget                  nr=3, ret=1024
 
 That in itself isn't very useful; after all, we can accomplish pretty much the
-same thing by simply running ``perf script`` without arguments in the same
+same thing by just running ``perf script`` without arguments in the same
 directory as the ``perf.data`` file.
 
 We can however replace the print statements in the generated function
@@ -805,7 +805,7 @@ event. For example:
 
 Each event handler function in the generated code
 is modified to do this. For convenience, we define a common function
-called ``inc_counts()`` that each handler calls; ``inc_counts()`` simply tallies
+called ``inc_counts()`` that each handler calls; ``inc_counts()`` just tallies
 a count for each event using the ``counts`` hash, which is a specialized
 hash function that does Perl-like autovivification, a capability that's
 extremely useful for kinds of multi-level aggregation commonly used in
@@ -865,7 +865,7 @@ System-Wide Tracing and Profiling
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The examples so far have focused on tracing a particular program or
-workload --- in other words, every profiling run has specified the program
+workload --- that is, every profiling run has specified the program
 to profile in the command-line e.g. ``perf record wget ...``.
 
 It's also possible, and more interesting in many cases, to run a
@@ -894,13 +894,13 @@ other processes running on the system as well:
 .. image:: figures/perf-systemwide.png
    :align: center
 
-In the snapshot above, we can see callchains that originate in libc, and
-a callchain from Xorg that demonstrates that we're using a proprietary X
-driver in userspace (notice the presence of ``PVR`` and some other
-unresolvable symbols in the expanded Xorg callchain).
+In the snapshot above, we can see call chains that originate in ``libc``, and
+a call chain from ``Xorg`` that demonstrates that we're using a proprietary X
+driver in user space (notice the presence of ``PVR`` and some other
+unresolvable symbols in the expanded ``Xorg`` call chain).
 
-Note also that we have both kernel and userspace entries in the above
-snapshot. We can also tell perf to focus on userspace but providing a
+Note also that we have both kernel and user space entries in the above
+snapshot. We can also tell perf to focus on user space but providing a
 modifier, in this case ``u``, to the ``cycles`` hardware counter when we
 record a profile::
 
@@ -911,7 +911,7 @@ record a profile::
 .. image:: figures/perf-report-cycles-u.png
    :align: center
 
-Notice in the screenshot above, we see only userspace entries (``[.]``)
+Notice in the screenshot above, we see only user space entries (``[.]``)
 
 Finally, we can press ``Enter`` on a leaf node and select the ``Zoom into
 DSO`` menu item to show only entries associated with a specific DSO. In
@@ -946,7 +946,7 @@ We can look at the raw output using ``perf script`` with no arguments::
 Filtering
 ^^^^^^^^^
 
-Notice that there are a lot of events that don't really have anything to
+Notice that there are many events that don't really have anything to
 do with what we're interested in, namely events that schedule ``perf``
 itself in and out or that wake perf up. We can get rid of those by using
 the ``--filter`` option --- for each event we specify using ``-e``, we can add a
@@ -985,7 +985,7 @@ purpose of demonstrating how to use filters, it's close enough.
 .. admonition:: Tying it Together
 
    These are exactly the same set of event filters defined by the trace
-   event subsystem. See the ftrace / tracecmd / kernelshark section for more
+   event subsystem. See the ftrace / trace-cmd / KernelShark section for more
    discussion about these event filters.
 
 .. admonition:: Tying it Together
@@ -995,14 +995,14 @@ purpose of demonstrating how to use filters, it's close enough.
    indispensable part of the perf design as it relates to tracing.
    kernel-based event filters provide a mechanism to precisely throttle
    the event stream that appears in user space, where it makes sense to
-   provide bindings to real programming languages for postprocessing the
+   provide bindings to real programming languages for post-processing the
    event stream. This architecture allows for the intelligent and
    flexible partitioning of processing between the kernel and user
    space. Contrast this with other tools such as SystemTap, which does
    all of its processing in the kernel and as such requires a special
    project-defined language in order to accommodate that design, or
-   LTTng, where everything is sent to userspace and as such requires a
-   super-efficient kernel-to-userspace transport mechanism in order to
+   LTTng, where everything is sent to user space and as such requires a
+   super-efficient kernel-to-user space transport mechanism in order to
    function properly. While perf certainly can benefit from for instance
    advances in the design of the transport, it doesn't fundamentally
    depend on them. Basically, if you find that your perf tracing
@@ -1014,7 +1014,7 @@ Using Dynamic Tracepoints
 
 perf isn't restricted to the fixed set of static tracepoints listed by
 ``perf list``. Users can also add their own "dynamic" tracepoints anywhere
-in the kernel. For instance, suppose we want to define our own
+in the kernel. For example, suppose we want to define our own
 tracepoint on ``do_fork()``. We can do that using the ``perf probe`` perf
 subcommand::
 
@@ -1069,7 +1069,7 @@ up after 30 seconds)::
    [ perf record: Woken up 1 times to write data ]
    [ perf record: Captured and wrote 0.087 MB perf.data (~3812 samples) ]
 
-Using ``perf script`` we can see each do_fork event that fired::
+Using ``perf script`` we can see each ``do_fork`` event that fired::
 
    root@crownbay:~# perf script
 
@@ -1111,7 +1111,7 @@ Using ``perf script`` we can see each do_fork event that fired::
                gaku  1312 [000] 34237.202388: do_fork: (c1028460)
 
 And using ``perf report`` on the same file, we can see the
-callgraphs from starting a few programs during those 30 seconds:
+call graphs from starting a few programs during those 30 seconds:
 
 .. image:: figures/perf-probe-do_fork-profile.png
    :align: center
@@ -1125,11 +1125,11 @@ callgraphs from starting a few programs during those 30 seconds:
 
 .. admonition:: Tying it Together
 
-   Dynamic tracepoints are implemented under the covers by kprobes and
-   uprobes. kprobes and uprobes are also used by and in fact are the
+   Dynamic tracepoints are implemented under the covers by Kprobes and
+   Uprobes. Kprobes and Uprobes are also used by and in fact are the
    main focus of SystemTap.
 
-Perf Documentation
+perf Documentation
 ------------------
 
 Online versions of the manual pages for the commands discussed in this
@@ -1153,7 +1153,7 @@ section can be found here:
 
 -  The top-level `perf(1) manual page <https://linux.die.net/man/1/perf>`__.
 
-Normally, you should be able to invoke the manual pages via perf itself
+Normally, you should be able to open the manual pages via perf itself
 e.g. ``perf help`` or ``perf help record``.
 
 To have the perf manual pages installed on your target, modify your
@@ -1168,14 +1168,14 @@ of examples, can also be found in the ``perf`` directory of the kernel tree::
    tools/perf/Documentation
 
 There's also a nice perf tutorial on the perf
-wiki that goes into more detail than we do here in certain areas: `Perf
+wiki that goes into more detail than we do here in certain areas: `perf
 Tutorial <https://perf.wiki.kernel.org/index.php/Tutorial>`__
 
 ftrace
 ======
 
 "ftrace" literally refers to the "ftrace function tracer" but in reality
-this encompasses a number of related tracers along with the
+this encompasses several related tracers along with the
 infrastructure that they all make use of.
 
 ftrace Setup
@@ -1184,11 +1184,11 @@ ftrace Setup
 For this section, we'll assume you've already performed the basic setup
 outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 
-ftrace, trace-cmd, and kernelshark run on the target system, and are
+ftrace, trace-cmd, and KernelShark run on the target system, and are
 ready to go out-of-the-box --- no additional setup is necessary. For the
-rest of this section we assume you've ssh'ed to the host and will be
-running ftrace on the target. kernelshark is a GUI application and if
-you use the ``-X`` option to ssh you can have the kernelshark GUI run on
+rest of this section we assume you're connected to the host through SSH and
+will be running ftrace on the target. KernelShark is a GUI application and if
+you use the ``-X`` option to ``ssh`` you can have the KernelShark GUI run on
 the target but display remotely on the host if you want.
 
 Basic ftrace usage
@@ -1196,8 +1196,8 @@ Basic ftrace usage
 
 "ftrace" essentially refers to everything included in the ``/tracing``
 directory of the mounted debugfs filesystem (Yocto follows the standard
-convention and mounts it at ``/sys/kernel/debug``). Here's a listing of all
-the files found in ``/sys/kernel/debug/tracing`` on a Yocto system::
+convention and mounts it at ``/sys/kernel/debug``). All the files found in
+``/sys/kernel/debug/tracing`` on a Yocto system are::
 
    root@sugarbay:/sys/kernel/debug/tracing# ls
    README                      kprobe_events               trace
@@ -1222,7 +1222,7 @@ the ftrace documentation.
 
 We'll start by looking at some of the available built-in tracers.
 
-cat'ing the ``available_tracers`` file lists the set of available tracers::
+The ``available_tracers`` file lists the set of available tracers::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat available_tracers
    blk function_graph function nop
@@ -1232,11 +1232,11 @@ The ``current_tracer`` file contains the tracer currently in effect::
    root@sugarbay:/sys/kernel/debug/tracing# cat current_tracer
    nop
 
-The above listing of current_tracer shows that the
+The above listing of ``current_tracer`` shows that the
 ``nop`` tracer is in effect, which is just another way of saying that
 there's actually no tracer currently in effect.
 
-echo'ing one of the available_tracers into ``current_tracer`` makes the
+Writing one of the available tracers into ``current_tracer`` makes the
 specified tracer the current tracer::
 
    root@sugarbay:/sys/kernel/debug/tracing# echo function > current_tracer
@@ -1292,7 +1292,7 @@ tracer::
             .
 
 Each line in the trace above shows what was happening in the kernel on a given
-cpu, to the level of detail of function calls. Each entry shows the function
+CPU, to the level of detail of function calls. Each entry shows the function
 called, followed by its caller (after the arrow).
 
 The function tracer gives you an extremely detailed idea of what the
@@ -1306,7 +1306,7 @@ great way to learn about how the kernel code works in a dynamic sense.
 
 It is a little more difficult to follow the call chains than it needs to
 be --- luckily there's a variant of the function tracer that displays the
-callchains explicitly, called the ``function_graph`` tracer::
+call chains explicitly, called the ``function_graph`` tracer::
 
    root@sugarbay:/sys/kernel/debug/tracing# echo function_graph > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
@@ -1425,7 +1425,7 @@ As you can see, the ``function_graph`` display is much easier
 to follow. Also note that in addition to the function calls and
 associated braces, other events such as scheduler events are displayed
 in context. In fact, you can freely include any tracepoint available in
-the trace events subsystem described in the next section by simply
+the trace events subsystem described in the next section by just
 enabling those events, and they'll appear in context in the function
 graph display. Quite a powerful tool for understanding kernel dynamics.
 
@@ -1528,7 +1528,7 @@ The ``format`` file for the
 tracepoint describes the event in memory, which is used by the various
 tracing tools that now make use of these tracepoint to parse the event
 and make sense of it, along with a ``print fmt`` field that allows tools
-like ftrace to display the event as text. Here's what the format of the
+like ftrace to display the event as text. The format of the
 ``kmalloc`` event looks like::
 
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# cat format
@@ -1581,7 +1581,7 @@ events in the output buffer::
    root@sugarbay:/sys/kernel/debug/tracing# echo 1 > tracing_on
 
 Now, if we look at the ``trace`` file, we see nothing
-but the kmalloc events we just turned on::
+but the ``kmalloc`` events we just turned on::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
    # tracer: nop
@@ -1636,8 +1636,8 @@ using the ``enable`` file in the subsystem directory) and get an
 arbitrarily fine-grained idea of what's going on in the system by
 enabling as many of the appropriate tracepoints as applicable.
 
-A number of the tools described in this HOWTO do just that, including
-``trace-cmd`` and kernelshark in the next section.
+Several tools described in this How-to do just that, including
+``trace-cmd`` and KernelShark in the next section.
 
 .. admonition:: Tying it Together
 
@@ -1653,7 +1653,7 @@ A number of the tools described in this HOWTO do just that, including
    ``/sys/kernel/debug/tracing`` will be removed and replaced with
    equivalent tracers based on the "trace events" subsystem.
 
-trace-cmd / kernelshark
+trace-cmd / KernelShark
 -----------------------
 
 trace-cmd is essentially an extensive command-line "wrapper" interface
@@ -1662,31 +1662,30 @@ that hides the details of all the individual files in
 events within the ``/sys/kernel/debug/tracing/events/`` subdirectory and to
 collect traces and avoid having to deal with those details directly.
 
-As yet another layer on top of that, kernelshark provides a GUI that
+As yet another layer on top of that, KernelShark provides a GUI that
 allows users to start and stop traces and specify sets of events using
 an intuitive interface, and view the output as both trace events and as
 a per-CPU graphical display. It directly uses trace-cmd as the
 plumbing that accomplishes all that underneath the covers (and actually
 displays the trace-cmd command it uses, as we'll see).
 
-To start a trace using kernelshark, first start kernelshark::
+To start a trace using KernelShark, first start this tool::
 
    root@sugarbay:~# kernelshark
 
-Then bring up the ``Capture`` dialog by
-choosing from the kernelshark menu::
+Then open up the ``Capture`` dialog by choosing from the KernelShark menu::
 
    Capture | Record
 
 That will display the following dialog, which allows you to choose one or more
-events (or even one or more complete subsystems) to trace:
+events (or even entire subsystems) to trace:
 
 .. image:: figures/kernelshark-choose-events.png
    :align: center
 
 Note that these are exactly the same sets of events described in the
 previous trace events subsystem section, and in fact is where trace-cmd
-gets them for kernelshark.
+gets them for KernelShark.
 
 In the above screenshot, we've decided to explore the graphics subsystem
 a bit and so have chosen to trace all the tracepoints contained within
@@ -1699,12 +1698,12 @@ will turn into the 'Stop' button after the trace has started):
 .. image:: figures/kernelshark-output-display.png
    :align: center
 
-Notice that the right-hand pane shows the exact trace-cmd command-line
+Notice that the right pane shows the exact trace-cmd command-line
 that's used to run the trace, along with the results of the trace-cmd
 run.
 
 Once the ``Stop`` button is pressed, the graphical view magically fills up
-with a colorful per-cpu display of the trace data, along with the
+with a colorful per-CPU display of the trace data, along with the
 detailed event listing below that:
 
 .. image:: figures/kernelshark-i915-display.png
@@ -1717,7 +1716,7 @@ events``:
    :align: center
 
 The tool is pretty self-explanatory, but for more detailed information
-on navigating through the data, see the `kernelshark
+on navigating through the data, see the `KernelShark
 website <https://kernelshark.org/Documentation.html>`__.
 
 ftrace Documentation
@@ -1733,41 +1732,41 @@ Documentation directory::
 
    Documentation/trace/events.txt
 
-There is a nice series of articles on using ftrace and trace-cmd at LWN:
+A nice series of articles on using ftrace and trace-cmd are available at LWN:
 
--  `Debugging the kernel using Ftrace - part
+-  `Debugging the kernel using ftrace - part
    1 <https://lwn.net/Articles/365835/>`__
 
--  `Debugging the kernel using Ftrace - part
+-  `Debugging the kernel using ftrace - part
    2 <https://lwn.net/Articles/366796/>`__
 
--  `Secrets of the Ftrace function
+-  `Secrets of the ftrace function
    tracer <https://lwn.net/Articles/370423/>`__
 
 -  `trace-cmd: A front-end for
-   Ftrace <https://lwn.net/Articles/410200/>`__
+   ftrace <https://lwn.net/Articles/410200/>`__
 
 See also `KernelShark's documentation <https://kernelshark.org/Documentation.html>`__
 for further usage details.
 
-An amusing yet useful README (a tracing mini-HOWTO) can be found in
+An amusing yet useful README (a tracing mini-How-to) can be found in
 ``/sys/kernel/debug/tracing/README``.
 
-systemtap
+SystemTap
 =========
 
 SystemTap is a system-wide script-based tracing and profiling tool.
 
 SystemTap scripts are C-like programs that are executed in the kernel to
 gather / print / aggregate data extracted from the context they end up being
-invoked under.
+called under.
 
 For example, this probe from the `SystemTap
-tutorial <https://sourceware.org/systemtap/tutorial/>`__ simply prints a
+tutorial <https://sourceware.org/systemtap/tutorial/>`__ just prints a
 line every time any process on the system runs ``open()`` on a file. For each line,
 it prints the executable name of the program that opened the file, along
-with its PID, and the name of the file it opened (or tried to open),
-which it extracts from the open syscall's argstr.
+with its PID, and the name of the file it opened (or tried to open), which it
+extracts from the argument string (``argstr``) of the ``open`` system call.
 
 .. code-block:: none
 
@@ -1782,13 +1781,13 @@ which it extracts from the open syscall's argstr.
    }
 
 Normally, to execute this
-probe, you'd simply install systemtap on the system you want to probe,
+probe, you'd just install SystemTap on the system you want to probe,
 and directly run the probe on that system e.g. assuming the name of the
-file containing the above text is trace_open.stp::
+file containing the above text is ``trace_open.stp``::
 
    # stap trace_open.stp
 
-What systemtap does under the covers to run this probe is 1) parse and
+What SystemTap does under the covers to run this probe is 1) parse and
 convert the probe to an equivalent "C" form, 2) compile the "C" form
 into a kernel module, 3) insert the module into the kernel, which arms
 it, and 4) collect the data generated by the probe and display it to the
@@ -1801,25 +1800,25 @@ kernel build system unfortunately isn't typically part of the image
 running on the target. It is normally available on the "host" system
 that produced the target image however; in such cases, steps 1 and 2 are
 executed on the host system, and steps 3 and 4 are executed on the
-target system, using only the systemtap "runtime".
+target system, using only the SystemTap "runtime".
 
-The systemtap support in Yocto assumes that only steps 3 and 4 are run
+The SystemTap support in Yocto assumes that only steps 3 and 4 are run
 on the target; it is possible to do everything on the target, but this
 section assumes only the typical embedded use-case.
 
-So basically what you need to do in order to run a systemtap script on
+Therefore, what you need to do in order to run a SystemTap script on
 the target is to 1) on the host system, compile the probe into a kernel
 module that makes sense to the target, 2) copy the module onto the
 target system and 3) insert the module into the target kernel, which
 arms it, and 4) collect the data generated by the probe and display it
 to the user.
 
-systemtap Setup
+SystemTap Setup
 ---------------
 
-Those are a lot of steps and a lot of details, but fortunately Yocto
+Those are many steps and details, but fortunately Yocto
 includes a script called ``crosstap`` that will take care of those
-details, allowing you to simply execute a systemtap script on the remote
+details, allowing you to just execute a SystemTap script on the remote
 target, with arguments if necessary.
 
 In order to do this from a remote host, however, you need to have access
@@ -1832,7 +1831,7 @@ having done a build::
    Error: No target kernel build found.
    Did you forget to create a local build of your image?
 
-'crosstap' requires a local sdk build of the target system
+'crosstap' requires a local SDK build of the target system
 (or a build that includes 'tools-profile') in order to build
 kernel modules that can probe the target system.
 
@@ -1848,11 +1847,11 @@ Practically speaking, that means you need to do the following:
    the BSP README and/or the widely available basic documentation
    that discusses how to build images).
 
--  Build an -sdk version of the image e.g.::
+-  Build an ``-sdk`` version of the image e.g.::
 
       $ bitbake core-image-sato-sdk
 
--  Or build a non-sdk image but include the profiling tools
+-  Or build a non-SDK image but include the profiling tools
    (edit ``local.conf`` and add ``tools-profile`` to the end of
    :term:``EXTRA_IMAGE_FEATURES`` variable)::
 
@@ -1868,15 +1867,14 @@ Practically speaking, that means you need to do the following:
 
 .. note::
 
-   SystemTap, which uses ``crosstap``, assumes you can establish an ssh
+   SystemTap, which uses ``crosstap``, assumes you can establish an SSH
    connection to the remote target. Please refer to the crosstap wiki
-   page for details on verifying ssh connections. Also, the ability to ssh
+   page for details on verifying SSH connections. Also, the ability to SSH
    into the target system is not enabled by default in ``*-minimal`` images.
 
-So essentially what you need to
-do is build an SDK image or image with ``tools-profile`` as detailed in
-the ":ref:`profile-manual/intro:General Setup`" section of this
-manual, and boot the resulting target image.
+Therefore, what you need to do is build an SDK image or image with
+``tools-profile`` as detailed in the ":ref:`profile-manual/intro:General Setup`"
+section of this manual, and boot the resulting target image.
 
 .. note::
 
@@ -1884,12 +1882,12 @@ manual, and boot the resulting target image.
    to have the :term:`MACHINE` you're connecting to selected in ``local.conf``, and
    the kernel in that machine's :term:`Build Directory` must match the kernel on
    the booted system exactly, or you'll get the above ``crosstap`` message
-   when you try to invoke a script.
+   when you try to call a script.
 
 Running a Script on a Target
 ----------------------------
 
-Once you've done that, you should be able to run a systemtap script on
+Once you've done that, you should be able to run a SystemTap script on
 the target::
 
    $ cd /path/to/yocto
@@ -1918,7 +1916,7 @@ If you get an error connecting to the target e.g.::
    $ crosstap root@192.168.7.2 trace_open.stp
    error establishing ssh connection on remote 'root@192.168.7.2'
 
-Try ssh'ing to the target and see what happens::
+Try connecting to the target through SSH and see what happens::
 
    $ ssh root@192.168.7.2
 
@@ -1936,7 +1934,7 @@ no password):
    matchbox-termin(1036) open ("/tmp/vte3FS2LW", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE, 0600)
    matchbox-termin(1036) open ("/tmp/vteJMC7LW", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE, 0600)
 
-systemtap Documentation
+SystemTap Documentation
 -----------------------
 
 The SystemTap language reference can be found here: `SystemTap Language
@@ -1949,7 +1947,7 @@ page <https://sourceware.org/systemtap/documentation.html>`__
 Sysprof
 =======
 
-Sysprof is a very easy to use system-wide profiler that consists of a
+Sysprof is an easy to use system-wide profiler that consists of a
 single window with three panes and a few buttons which allow you to
 start, stop, and view the profile from one place.
 
@@ -1959,16 +1957,16 @@ Sysprof Setup
 For this section, we'll assume you've already performed the basic setup
 outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 
-Sysprof is a GUI-based application that runs on the target system. For
-the rest of this document we assume you've ssh'ed to the host and will
-be running Sysprof on the target (you can use the ``-X`` option to ssh and
+Sysprof is a GUI-based application that runs on the target system. For the rest
+of this document we assume you're connected to the host through SSH and will be
+running Sysprof on the target (you can use the ``-X`` option to ``ssh`` and
 have the Sysprof GUI run on the target but display remotely on the host
 if you want).
 
 Basic Sysprof Usage
 -------------------
 
-To start profiling the system, you simply press the ``Start`` button. To
+To start profiling the system, you just press the ``Start`` button. To
 stop profiling and to start viewing the profile data in one easy step,
 press the ``Profile`` button.
 
@@ -1981,11 +1979,11 @@ with profiling data:
 The left pane shows a list of functions and processes. Selecting one of
 those expands that function in the right pane, showing all its callees.
 Note that this caller-oriented display is essentially the inverse of
-perf's default callee-oriented callchain display.
+perf's default callee-oriented call chain display.
 
 In the screenshot above, we're focusing on ``__copy_to_user_ll()`` and
-looking up the callchain we can see that one of the callers of
-``__copy_to_user_ll`` is ``sys_read()`` and the complete callpath between them.
+looking up the call chain we can see that one of the callers of
+``__copy_to_user_ll`` is ``sys_read()`` and the complete call path between them.
 Notice that this is essentially a portion of the same information we saw
 in the perf display shown in the perf section of this page.
 
@@ -1993,7 +1991,7 @@ in the perf display shown in the perf section of this page.
    :align: center
 
 Similarly, the above is a snapshot of the Sysprof display of a
-``copy-from-user`` callchain.
+``copy-from-user`` call chain.
 
 Finally, looking at the third Sysprof pane in the lower left, we can see
 a list of all the callers of a particular function selected in the top
@@ -2008,18 +2006,17 @@ to the selected function, and so on.
 
 .. admonition:: Tying it Together
 
-   If you like sysprof's ``caller-oriented`` display, you may be able to
+   If you like Sysprof's ``caller-oriented`` display, you may be able to
    approximate it in other tools as well. For example, ``perf report`` has
    the ``-g`` (``--call-graph``) option that you can experiment with; one of the
-   options is ``caller`` for an inverted caller-based callgraph display.
+   options is ``caller`` for an inverted caller-based call graph display.
 
 Sysprof Documentation
 ---------------------
 
 There doesn't seem to be any documentation for Sysprof, but maybe that's
-because it's pretty self-explanatory. The Sysprof website, however, is
-here: `Sysprof, System-wide Performance Profiler for
-Linux <http://sysprof.com/>`__
+because it's pretty self-explanatory. The Sysprof website, however, is here:
+`Sysprof, System-wide Performance Profiler for Linux <http://sysprof.com/>`__
 
 LTTng (Linux Trace Toolkit, next generation)
 ============================================
@@ -2029,7 +2026,7 @@ LTTng Setup
 
 For this section, we'll assume you've already performed the basic setup
 outlined in the ":ref:`profile-manual/intro:General Setup`" section.
-LTTng is run on the target system by ssh'ing to it.
+LTTng is run on the target system by connecting to it through SSH.
 
 Collecting and Viewing Traces
 -----------------------------
@@ -2042,7 +2039,7 @@ tracing.
 Collecting and viewing a trace on the target (inside a shell)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-First, from the host, ssh to the target::
+First, from the host, connect to the target through SSH::
 
    $ ssh -l root 192.168.1.47
    The authenticity of host '192.168.1.47 (192.168.1.47)' can't be established.
@@ -2134,11 +2131,11 @@ supplying your own name to ``lttng create``)::
    drwxr-xr-x    5 root     root          1024 Oct 15 23:57 ..
    drwxrwx---    3 root     root          1024 Oct 15 23:21 auto-20121015-232120
 
-Collecting and viewing a userspace trace on the target (inside a shell)
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Collecting and viewing a user space trace on the target (inside a shell)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-For LTTng userspace tracing, you need to have a properly instrumented
-userspace program. For this example, we'll use the ``hello`` test program
+For LTTng user space tracing, you need to have a properly instrumented
+user space program. For this example, we'll use the ``hello`` test program
 generated by the ``lttng-ust`` build.
 
 The ``hello`` test program isn't installed on the root filesystem by the ``lttng-ust``
@@ -2154,7 +2151,7 @@ Copy that over to the target machine::
 You now have the instrumented LTTng "hello world" test program on the
 target, ready to test.
 
-First, from the host, ssh to the target::
+First, from the host, connect to the target through SSH::
 
    $ ssh -l root 192.168.1.47
    The authenticity of host '192.168.1.47 (192.168.1.47)' can't be established.
@@ -2169,7 +2166,7 @@ Once on the target, use these steps to create a trace::
    Session auto-20190303-021943 created.
    Traces will be written in /home/root/lttng-traces/auto-20190303-021943
 
-Enable the events you want to trace (in this case all userspace events)::
+Enable the events you want to trace (in this case all user space events)::
 
    root@crownbay:~# lttng enable-event --userspace --all
    All UST events are enabled in channel channel0
@@ -2241,13 +2238,13 @@ the entire blktrace and blkparse pipeline on the target, or you can run
 blktrace in 'listen' mode on the target and have blktrace and blkparse
 collect and analyze the data on the host (see the
 ":ref:`profile-manual/usage:Using blktrace Remotely`" section
-below). For the rest of this section we assume you've ssh'ed to the host and
-will be running blkrace on the target.
+below). For the rest of this section we assume you've to the host through SSH
+and will be running blktrace on the target.
 
 Basic blktrace Usage
 --------------------
 
-To record a trace, simply run the ``blktrace`` command, giving it the name
+To record a trace, just run the ``blktrace`` command, giving it the name
 of the block device you want to trace activity on::
 
    root@crownbay:~# blktrace /dev/sdc
@@ -2258,10 +2255,10 @@ In another shell, execute a workload you want to trace::
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
    linux-2.6.19.2.tar.b 100% \|*******************************\| 41727k 0:00:00 ETA
 
-Press Ctrl-C in the blktrace shell to stop the trace. It
+Press ``Ctrl-C`` in the blktrace shell to stop the trace. It
 will display how many events were logged, along with the per-cpu file
-sizes (blktrace records traces in per-cpu kernel buffers and simply
-dumps them to userspace for blkparse to merge and sort later)::
+sizes (blktrace records traces in per-cpu kernel buffers and just
+dumps them to user space for blkparse to merge and sort later)::
 
    ^C=== sdc ===
     CPU  0:                 7082 events,      332 KiB data
@@ -2277,7 +2274,7 @@ with the device name as the first part of the filename::
    -rw-r--r--    1 root     root        339938 Oct 27 22:40 sdc.blktrace.0
    -rw-r--r--    1 root     root         75753 Oct 27 22:40 sdc.blktrace.1
 
-To view the trace events, simply invoke ``blkparse`` in the directory
+To view the trace events, just call ``blkparse`` in the directory
 containing the trace files, giving it the device name that forms the
 first part of the filenames::
 
@@ -2376,8 +2373,8 @@ Live Mode
 ~~~~~~~~~
 
 blktrace and blkparse are designed from the ground up to be able to
-operate together in a "pipe mode" where the stdout of blktrace can be
-fed directly into the stdin of blkparse::
+operate together in a "pipe mode" where the standard output of blktrace can be
+fed directly into the standard input of blkparse::
 
    root@crownbay:~# blktrace /dev/sdc -o - | blkparse -i -
 
@@ -2446,7 +2443,7 @@ just ended::
     Total:                 11800 events (dropped 0),      554 KiB data
 
 The blktrace instance on the host will
-save the target output inside a hostname-timestamp directory::
+save the target output inside a ``<hostname>-<timestamp>`` directory::
 
    $ ls -al
    drwxr-xr-x   10 root     root          1024 Oct 28 02:40 .
@@ -2518,7 +2515,7 @@ Tracing Block I/O via 'ftrace'
 It's also possible to trace block I/O using only
 :ref:`profile-manual/usage:The 'trace events' Subsystem`, which
 can be useful for casual tracing if you don't want to bother dealing with the
-userspace tools.
+user space tools.
 
 To enable tracing for a given device, use ``/sys/block/xxx/trace/enable``,
 where ``xxx`` is the device name. This for example enables tracing for
@@ -2576,7 +2573,7 @@ section can be found here:
 -  https://linux.die.net/man/8/btrace
 
 The above manual pages, along with manuals for the other blktrace utilities
-(btt, blkiomon, etc) can be found in the ``/doc`` directory of the blktrace
-tools git repo::
+(``btt``, ``blkiomon``, etc) can be found in the ``/doc`` directory of the blktrace
+tools git repository::
 
    $ git clone git://git.kernel.dk/blktrace.git
diff --git a/documentation/styles/config/vocabularies/OpenSource/accept.txt b/documentation/styles/config/vocabularies/OpenSource/accept.txt
index 98e76ae1f5..e378fbf79b 100644
--- a/documentation/styles/config/vocabularies/OpenSource/accept.txt
+++ b/documentation/styles/config/vocabularies/OpenSource/accept.txt
@@ -1,4 +1,20 @@
+autovivification
+blkparse
+blktrace
+callee
+debugfs
 ftrace
-toolchain
-systemd
+KernelShark
+Kprobe
 LTTng
+perf
+profiler
+subcommand
+subnode
+superset
+Sysprof
+systemd
+toolchain
+tracepoint
+Uprobe
+wget
diff --git a/documentation/styles/config/vocabularies/Yocto/accept.txt b/documentation/styles/config/vocabularies/Yocto/accept.txt
index b725414014..ca622ba412 100644
--- a/documentation/styles/config/vocabularies/Yocto/accept.txt
+++ b/documentation/styles/config/vocabularies/Yocto/accept.txt
@@ -1,4 +1,5 @@
-Yocto
-BSP
 BitBake
+BSP
+crosstap
 OpenEmbedded
+Yocto
-- 
2.34.1


