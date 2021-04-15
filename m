Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.9492.1618502957029279706
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 09:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id ED4DB24000A;
	Thu, 15 Apr 2021 16:09:13 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: simplify colon usage
Date: Thu, 15 Apr 2021 18:09:01 +0200
Message-Id: <20210415160901.120752-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- This replaces instances of ": ::" by "::", which
  generates identical HTML output

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst |   2 +-
 documentation/bsp-guide/bsp.rst              |  56 +++---
 documentation/profile-manual/intro.rst       |  10 +-
 documentation/profile-manual/usage.rst       | 184 +++++++++----------
 documentation/ref-manual/faq.rst             |   8 +-
 documentation/ref-manual/images.rst          |   2 +-
 documentation/ref-manual/migration-1.3.rst   |   4 +-
 documentation/ref-manual/migration-1.6.rst   |   2 +-
 documentation/ref-manual/migration-1.8.rst   |   6 +-
 documentation/ref-manual/migration-2.2.rst   |   2 +-
 documentation/ref-manual/migration-2.5.rst   |   2 +-
 documentation/ref-manual/migration-3.1.rst   |   4 +-
 documentation/ref-manual/migration-3.2.rst   |   6 +-
 documentation/ref-manual/qa-checks.rst       |  10 +-
 documentation/ref-manual/variables.rst       |  12 +-
 15 files changed, 155 insertions(+), 155 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 974ae5ebca..6a12b19ca0 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -238,7 +238,7 @@ an entire Linux distribution, including the toolchain, from source.
 
       You can significantly speed up your build and guard against fetcher
       failures by using mirrors. To use mirrors, add these lines to your
-      local.conf file in the Build directory: ::
+      local.conf file in the Build directory::
 
          SSTATE_MIRRORS = "\
          file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 89f1564422..0b0b52d904 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -26,7 +26,7 @@ A BSP consists of a file structure inside a base directory.
 Collectively, you can think of the base directory, its file structure,
 and the contents as a BSP layer. Although not a strict requirement, BSP
 layers in the Yocto Project use the following well-established naming
-convention: ::
+convention::
 
    meta-bsp_root_name
 
@@ -58,7 +58,7 @@ Each repository is a BSP layer supported by the Yocto Project (e.g.
 ``meta-raspberrypi`` and ``meta-intel``). Each of these layers is a
 repository unto itself and clicking on the layer name displays two URLs
 from which you can clone the layer's repository to your local system.
-Here is an example that clones the Raspberry Pi BSP layer: ::
+Here is an example that clones the Raspberry Pi BSP layer::
 
    $ git clone git://git.yoctoproject.org/meta-raspberrypi
 
@@ -84,7 +84,7 @@ established after you run the OpenEmbedded build environment setup
 script (i.e. :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``).
 Adding the root directory allows the :term:`OpenEmbedded Build System`
 to recognize the BSP
-layer and from it build an image. Here is an example: ::
+layer and from it build an image. Here is an example::
 
    BBLAYERS ?= " \
       /usr/local/src/yocto/meta \
@@ -113,7 +113,7 @@ this type of layer is OpenEmbedded's
 `meta-openembedded <https://github.com/openembedded/meta-openembedded>`__
 layer. The ``meta-openembedded`` layer contains many ``meta-*`` layers.
 In cases like this, you need to include the names of the actual layers
-you want to work with, such as: ::
+you want to work with, such as::
 
    BBLAYERS ?= " \
      /usr/local/src/yocto/meta \
@@ -193,7 +193,7 @@ section.
 
    #. *Check Out the Proper Branch:* The branch you check out for
       ``meta-intel`` must match the same branch you are using for the
-      Yocto Project release (e.g. ``&DISTRO_NAME_NO_CAP;``): ::
+      Yocto Project release (e.g. ``&DISTRO_NAME_NO_CAP;``)::
 
          $ cd meta-intel
          $ git checkout -b &DISTRO_NAME_NO_CAP; remotes/origin/&DISTRO_NAME_NO_CAP;
@@ -216,7 +216,7 @@ section.
    The process is identical to the process used for the ``meta-intel``
    layer except for the layer's name. For example, if you determine that
    your hardware most closely matches the ``meta-raspberrypi``, clone
-   that layer: ::
+   that layer::
 
       $ git clone git://git.yoctoproject.org/meta-raspberrypi
       Cloning into 'meta-raspberrypi'...
@@ -451,7 +451,7 @@ The following sections describe each part of the proposed BSP format.
 License Files
 -------------
 
-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::
 
    meta-bsp_root_name/bsp_license_file
 
@@ -469,7 +469,7 @@ section in the Yocto Project Development Tasks Manual.
 README File
 -----------
 
-You can find this file in the BSP Layer at: ::
+You can find this file in the BSP Layer at::
 
    meta-bsp_root_name/README
 
@@ -484,7 +484,7 @@ name of the BSP maintainer with his or her contact information.
 README.sources File
 -------------------
 
-You can find this file in the BSP Layer at: ::
+You can find this file in the BSP Layer at::
 
    meta-bsp_root_name/README.sources
 
@@ -503,7 +503,7 @@ used to generate the images that ship with the BSP.
 Pre-built User Binaries
 -----------------------
 
-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::
 
    meta-bsp_root_name/binary/bootable_images
 
@@ -526,7 +526,7 @@ information on the Metadata.
 Layer Configuration File
 ------------------------
 
-You can find this file in the BSP Layer at: ::
+You can find this file in the BSP Layer at::
 
    meta-bsp_root_name/conf/layer.conf
 
@@ -550,7 +550,7 @@ template). ::
    LAYERDEPENDS_bsp = "intel"
 
 To illustrate the string substitutions, here are the corresponding
-statements from the Raspberry Pi ``conf/layer.conf`` file: ::
+statements from the Raspberry Pi ``conf/layer.conf`` file::
 
    # We have a conf and classes directory, append to BBPATH
    BBPATH .= ":${LAYERDIR}"
@@ -576,7 +576,7 @@ recognize the BSP.
 Hardware Configuration Options
 ------------------------------
 
-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::
 
    meta-bsp_root_name/conf/machine/*.conf
 
@@ -607,14 +607,14 @@ For example, many ``tune-*`` files (e.g. ``tune-arm1136jf-s.inc``,
 
 To use an include file, you simply include them in the machine
 configuration file. For example, the Raspberry Pi BSP
-``raspberrypi3.conf`` contains the following statement: ::
+``raspberrypi3.conf`` contains the following statement::
 
    include conf/machine/include/rpi-base.inc
 
 Miscellaneous BSP-Specific Recipe Files
 ---------------------------------------
 
-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::
 
    meta-bsp_root_name/recipes-bsp/*
 
@@ -624,7 +624,7 @@ Raspberry Pi BSP, there is the ``formfactor_0.0.bbappend`` file, which
 is an append file used to augment the recipe that starts the build.
 Furthermore, there are machine-specific settings used during the build
 that are defined by the ``machconfig`` file further down in the
-directory. Here is the ``machconfig`` file for the Raspberry Pi BSP: ::
+directory. Here is the ``machconfig`` file for the Raspberry Pi BSP::
 
    HAVE_TOUCHSCREEN=0
    HAVE_KEYBOARD=1
@@ -644,7 +644,7 @@ directory. Here is the ``machconfig`` file for the Raspberry Pi BSP: ::
 Display Support Files
 ---------------------
 
-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::
 
    meta-bsp_root_name/recipes-graphics/*
 
@@ -655,7 +655,7 @@ to support a display are kept here.
 Linux Kernel Configuration
 --------------------------
 
-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::
 
    meta-bsp_root_name/recipes-kernel/linux/linux*.bbappend
    meta-bsp_root_name/recipes-kernel/linux/*.bb
@@ -678,7 +678,7 @@ Suppose you are using the ``linux-yocto_4.4.bb`` recipe to build the
 kernel. In other words, you have selected the kernel in your
 ``"bsp_root_name".conf`` file by adding
 :term:`PREFERRED_PROVIDER` and :term:`PREFERRED_VERSION`
-statements as follows: ::
+statements as follows::
 
    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ?= "4.4%"
@@ -698,7 +698,7 @@ in the Yocto Project Linux Kernel Development Manual.
 
 An alternate scenario is when you create your own kernel recipe for the
 BSP. A good example of this is the Raspberry Pi BSP. If you examine the
-``recipes-kernel/linux`` directory you see the following: ::
+``recipes-kernel/linux`` directory you see the following::
 
    linux-raspberrypi-dev.bb
    linux-raspberrypi.inc
@@ -1042,7 +1042,7 @@ BSP-specific configuration file named ``interfaces`` to the
 also supports several other machines:
 
 #. Edit the ``init-ifupdown_1.0.bbappend`` file so that it contains the
-   following: ::
+   following::
 
       FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
@@ -1050,14 +1050,14 @@ also supports several other machines:
    directory.
 
 #. Create and place the new ``interfaces`` configuration file in the
-   BSP's layer here: ::
+   BSP's layer here::
 
       meta-xyz/recipes-core/init-ifupdown/files/xyz-machine-one/interfaces
 
    .. note::
 
       If the ``meta-xyz`` layer did not support multiple machines, you would place
-      the interfaces configuration file in the layer here: ::
+      the interfaces configuration file in the layer here::
 
          meta-xyz/recipes-core/init-ifupdown/files/interfaces
 
@@ -1210,7 +1210,7 @@ BSP Layer Configuration Example
 -------------------------------
 
 The layer's ``conf`` directory contains the ``layer.conf`` configuration
-file. In this example, the ``conf/layer.conf`` is the following: ::
+file. In this example, the ``conf/layer.conf`` is the following::
 
    # We have a conf and classes directory, add to BBPATH
    BBPATH .= ":${LAYERDIR}"
@@ -1242,7 +1242,7 @@ configuration file is what makes a layer a BSP layer as compared to a
 general or kernel layer.
 
 One or more machine configuration files exist in the
-``bsp_layer/conf/machine/`` directory of the layer: ::
+``bsp_layer/conf/machine/`` directory of the layer::
 
    bsp_layer/conf/machine/machine1\.conf
    bsp_layer/conf/machine/machine2\.conf
@@ -1252,7 +1252,7 @@ One or more machine configuration files exist in the
 For example, the machine configuration file for the `BeagleBone and
 BeagleBone Black development boards <https://beagleboard.org/bone>`__ is
 located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
-``beaglebone-yocto.conf``: ::
+``beaglebone-yocto.conf``::
 
    #@TYPE: Machine
    #@NAME: Beaglebone-yocto machine
@@ -1447,7 +1447,7 @@ BSP Kernel Recipe Example
 -------------------------
 
 The kernel recipe used to build the kernel image for the BeagleBone
-device was established in the machine configuration: ::
+device was established in the machine configuration::
 
    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ?= "5.0%"
@@ -1458,7 +1458,7 @@ metadata used to build the kernel. In this case, a kernel append file
 kernel recipe (i.e. ``linux-yocto_5.0.bb``), which is located in
 :yocto_git:`/poky/tree/meta/recipes-kernel/linux`.
 
-Following is the contents of the append file: ::
+Following is the contents of the append file::
 
    KBRANCH_genericx86 = "v5.0/standard/base"
    KBRANCH_genericx86-64 = "v5.0/standard/base"
diff --git a/documentation/profile-manual/intro.rst b/documentation/profile-manual/intro.rst
index 4e1008b05e..9c8fa3dbfa 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -39,12 +39,12 @@ an 'sdk' image e.g. ::
    $ bitbake core-image-sato-sdk
 
 or alternatively by adding 'tools-profile' to the EXTRA_IMAGE_FEATURES line in
-your local.conf: ::
+your local.conf::
 
    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile"
 
 If you use the 'tools-profile' method, you don't need to build an sdk image -
-the tracing and profiling tools will be included in non-sdk images as well e.g.: ::
+the tracing and profiling tools will be included in non-sdk images as well e.g.::
 
    $ bitbake core-image-sato
 
@@ -55,7 +55,7 @@ the tracing and profiling tools will be included in non-sdk images as well e.g.:
 
    You can prevent that by setting the
    :term:`INHIBIT_PACKAGE_STRIP`
-   variable to "1" in your ``local.conf`` when you build the image: ::
+   variable to "1" in your ``local.conf`` when you build the image::
 
       INHIBIT_PACKAGE_STRIP = "1"
 
@@ -65,11 +65,11 @@ If you've already built a stripped image, you can generate debug
 packages (xxx-dbg) which you can manually install as needed.
 
 To generate debug info for packages, you can add dbg-pkgs to
-EXTRA_IMAGE_FEATURES in local.conf. For example: ::
+EXTRA_IMAGE_FEATURES in local.conf. For example::
 
    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"
 
 Additionally, in order to generate the right type of debuginfo, we also need to
-set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file: ::
+set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file::
 
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index c42f5b64b2..825290c3f8 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -48,7 +48,7 @@ For this section, we'll assume you've already performed the basic setup
 outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 
 In particular, you'll get the most mileage out of perf if you profile an
-image built with the following in your ``local.conf`` file: ::
+image built with the following in your ``local.conf`` file::
 
    INHIBIT_PACKAGE_STRIP = "1"
 
@@ -62,7 +62,7 @@ Basic Perf Usage
 
 The perf tool is pretty much self-documenting. To remind yourself of the
 available commands, simply type 'perf', which will show you basic usage
-along with the available perf subcommands: ::
+along with the available perf subcommands::
 
    root@crownbay:~# perf
 
@@ -110,7 +110,7 @@ applets in Yocto. ::
 The quickest and easiest way to get some basic overall data about what's
 going on for a particular workload is to profile it using 'perf stat'.
 'perf stat' basically profiles using a few default counters and displays
-the summed counts at the end of the run: ::
+the summed counts at the end of the run::
 
    root@crownbay:~# perf stat wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -139,7 +139,7 @@ Also, note that 'perf stat' isn't restricted to a fixed set of counters
 - basically any event listed in the output of 'perf list' can be tallied
 by 'perf stat'. For example, suppose we wanted to see a summary of all
 the events related to kernel memory allocation/freeing along with cache
-hits and misses: ::
+hits and misses::
 
    root@crownbay:~# perf stat -e kmem:* -e cache-references -e cache-misses wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -191,7 +191,7 @@ directory. ::
 To see the results in a
 'text-based UI' (tui), simply run 'perf report', which will read the
 perf.data file in the current working directory and display the results
-in an interactive UI: ::
+in an interactive UI::
 
    root@crownbay:~# perf report
 
@@ -217,7 +217,7 @@ Before we do that, however, let's try running a different profile, one
 which shows something a little more interesting. The only difference
 between the new profile and the previous one is that we'll add the -g
 option, which will record not just the address of a sampled function,
-but the entire callchain to the sampled function as well: ::
+but the entire callchain to the sampled function as well::
 
    root@crownbay:~# perf record -g wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -293,7 +293,7 @@ busybox binary, which is actually stripped out by the Yocto build
 system.
 
 One way around that is to put the following in your ``local.conf`` file
-when you build the image: ::
+when you build the image::
 
    INHIBIT_PACKAGE_STRIP = "1"
 
@@ -302,26 +302,26 @@ what can we do to get perf to resolve the symbols? Basically we need to
 install the debuginfo for the BusyBox package.
 
 To generate the debug info for the packages in the image, we can add
-``dbg-pkgs`` to :term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example: ::
+``dbg-pkgs`` to :term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::
 
    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"
 
 Additionally, in order to generate the type of debuginfo that perf
 understands, we also need to set
 :term:`PACKAGE_DEBUG_SPLIT_STYLE`
-in the ``local.conf`` file: ::
+in the ``local.conf`` file::
 
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
 
 Once we've done that, we can install the
 debuginfo for BusyBox. The debug packages once built can be found in
 ``build/tmp/deploy/rpm/*`` on the host system. Find the busybox-dbg-...rpm
-file and copy it to the target. For example: ::
+file and copy it to the target. For example::
 
    [trz@empanada core2]$ scp /home/trz/yocto/crownbay-tracing-dbg/build/tmp/deploy/rpm/core2_32/busybox-dbg-1.20.2-r2.core2_32.rpm root@192.168.1.31:
    busybox-dbg-1.20.2-r2.core2_32.rpm                     100% 1826KB   1.8MB/s   00:01
 
-Now install the debug rpm on the target: ::
+Now install the debug rpm on the target::
 
    root@crownbay:~# rpm -i busybox-dbg-1.20.2-r2.core2_32.rpm
 
@@ -382,7 +382,7 @@ traditional tools can also make use of the expanded possibilities now
 available to them, and in some cases have, as mentioned previously).
 
 We can get a list of the available events that can be used to profile a
-workload via 'perf list': ::
+workload via 'perf list'::
 
    root@crownbay:~# perf list
 
@@ -525,7 +525,7 @@ workload via 'perf list': ::
 Only a subset of these would be of interest to us when looking at this
 workload, so let's choose the most likely subsystems (identified by the
 string before the colon in the Tracepoint events) and do a 'perf stat'
-run using only those wildcarded subsystems: ::
+run using only those wildcarded subsystems::
 
    root@crownbay:~# perf stat -e skb:* -e net:* -e napi:* -e sched:* -e workqueue:* -e irq:* -e syscalls:* wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Performance counter stats for 'wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2':
@@ -587,7 +587,7 @@ run using only those wildcarded subsystems: ::
 
 
 Let's pick one of these tracepoints
-and tell perf to do a profile using it as the sampling event: ::
+and tell perf to do a profile using it as the sampling event::
 
    root@crownbay:~# perf record -g -e sched:sched_wakeup wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
 
@@ -644,14 +644,14 @@ individual steps that go into the higher-level behavior exposed by the
 coarse-grained profiling data.
 
 As a concrete example, we can trace all the events we think might be
-applicable to our workload: ::
+applicable to our workload::
 
    root@crownbay:~# perf record -g -e skb:* -e net:* -e napi:* -e sched:sched_switch -e sched:sched_wakeup -e irq:*
     -e syscalls:sys_enter_read -e syscalls:sys_exit_read -e syscalls:sys_enter_write -e syscalls:sys_exit_write
     wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
 
 We can look at the raw trace output using 'perf script' with no
-arguments: ::
+arguments::
 
    root@crownbay:~# perf script
 
@@ -735,7 +735,7 @@ two programming language bindings, one for Python and one for Perl.
 
 Now that we have the trace data in perf.data, we can use 'perf script
 -g' to generate a skeleton script with handlers for the read/write
-entry/exit events we recorded: ::
+entry/exit events we recorded::
 
    root@crownbay:~# perf script -g python
    generated Python script: perf-script.py
@@ -755,7 +755,7 @@ with its parameters. For example:
                   print "skbaddr=%u, len=%u, name=%s\n" % (skbaddr, len, name),
 
 We can run that script directly to print all of the events contained in the
-perf.data file: ::
+perf.data file::
 
    root@crownbay:~# perf script -s perf-script.py
 
@@ -833,7 +833,7 @@ result of all the per-event tallies. For that, we use the special
             for event_name, count in counts.iteritems():
                     print "%-40s %10s\n" % (event_name, count)
 
-The end result is a summary of all the events recorded in the trace: ::
+The end result is a summary of all the events recorded in the trace::
 
    skb__skb_copy_datagram_iovec                  13148
    irq__softirq_entry                             4796
@@ -877,13 +877,13 @@ To do system-wide profiling or tracing, you typically use the -a flag to
 'perf record'.
 
 To demonstrate this, open up one window and start the profile using the
--a flag (press Ctrl-C to stop tracing): ::
+-a flag (press Ctrl-C to stop tracing)::
 
    root@crownbay:~# perf record -g -a
    ^C[ perf record: Woken up 6 times to write data ]
    [ perf record: Captured and wrote 1.400 MB perf.data (~61172 samples) ]
 
-In another window, run the wget test: ::
+In another window, run the wget test::
 
    root@crownbay:~# wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -903,7 +903,7 @@ unresolvable symbols in the expanded Xorg callchain).
 Note also that we have both kernel and userspace entries in the above
 snapshot. We can also tell perf to focus on userspace but providing a
 modifier, in this case 'u', to the 'cycles' hardware counter when we
-record a profile: ::
+record a profile::
 
    root@crownbay:~# perf record -g -a -e cycles:u
    ^C[ perf record: Woken up 2 times to write data ]
@@ -923,13 +923,13 @@ the entries associated with the libc-xxx.so DSO.
    :align: center
 
 We can also use the system-wide -a switch to do system-wide tracing.
-Here we'll trace a couple of scheduler events: ::
+Here we'll trace a couple of scheduler events::
 
    root@crownbay:~# perf record -a -e sched:sched_switch -e sched:sched_wakeup
    ^C[ perf record: Woken up 38 times to write data ]
    [ perf record: Captured and wrote 9.780 MB perf.data (~427299 samples) ]
 
-We can look at the raw output using 'perf script' with no arguments: ::
+We can look at the raw output using 'perf script' with no arguments::
 
    root@crownbay:~# perf script
 
@@ -952,7 +952,7 @@ do with what we're interested in, namely events that schedule 'perf'
 itself in and out or that wake perf up. We can get rid of those by using
 the '--filter' option - for each event we specify using -e, we can add a
 --filter after that to filter out trace events that contain fields with
-specific values: ::
+specific values::
 
    root@crownbay:~# perf record -a -e sched:sched_switch --filter 'next_comm != perf && prev_comm != perf' -e sched:sched_wakeup --filter 'comm != perf'
    ^C[ perf record: Woken up 38 times to write data ]
@@ -1017,7 +1017,7 @@ perf isn't restricted to the fixed set of static tracepoints listed by
 'perf list'. Users can also add their own 'dynamic' tracepoints anywhere
 in the kernel. For instance, suppose we want to define our own
 tracepoint on do_fork(). We can do that using the 'perf probe' perf
-subcommand: ::
+subcommand::
 
    root@crownbay:~# perf probe do_fork
    Added new event:
@@ -1031,7 +1031,7 @@ Adding a new tracepoint via
 'perf probe' results in an event with all the expected files and format
 in /sys/kernel/debug/tracing/events, just the same as for static
 tracepoints (as discussed in more detail in the trace events subsystem
-section: ::
+section::
 
    root@crownbay:/sys/kernel/debug/tracing/events/probe/do_fork# ls -al
    drwxr-xr-x    2 root     root             0 Oct 28 11:42 .
@@ -1056,7 +1056,7 @@ section: ::
    print fmt: "(%lx)", REC->__probe_ip
 
 We can list all dynamic tracepoints currently in
-existence: ::
+existence::
 
    root@crownbay:~# perf probe -l
     probe:do_fork (on do_fork)
@@ -1064,13 +1064,13 @@ existence: ::
 
 Let's record system-wide ('sleep 30' is a
 trick for recording system-wide but basically do nothing and then wake
-up after 30 seconds): ::
+up after 30 seconds)::
 
    root@crownbay:~# perf record -g -a -e probe:do_fork sleep 30
    [ perf record: Woken up 1 times to write data ]
    [ perf record: Captured and wrote 0.087 MB perf.data (~3812 samples) ]
 
-Using 'perf script' we can see each do_fork event that fired: ::
+Using 'perf script' we can see each do_fork event that fired::
 
    root@crownbay:~# perf script
 
@@ -1163,7 +1163,7 @@ addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for
 basic 'help' functionality </show_bug.cgi?id=3388>`.
 
 The man pages in text form, along with some other files, such as a set
-of examples, can be found in the 'perf' directory of the kernel tree: ::
+of examples, can be found in the 'perf' directory of the kernel tree::
 
    tools/perf/Documentation
 
@@ -1197,7 +1197,7 @@ Basic ftrace usage
 'ftrace' essentially refers to everything included in the /tracing
 directory of the mounted debugfs filesystem (Yocto follows the standard
 convention and mounts it at /sys/kernel/debug). Here's a listing of all
-the files found in /sys/kernel/debug/tracing on a Yocto system: ::
+the files found in /sys/kernel/debug/tracing on a Yocto system::
 
    root@sugarbay:/sys/kernel/debug/tracing# ls
    README                      kprobe_events               trace
@@ -1222,12 +1222,12 @@ the ftrace documentation.
 
 We'll start by looking at some of the available built-in tracers.
 
-cat'ing the 'available_tracers' file lists the set of available tracers: ::
+cat'ing the 'available_tracers' file lists the set of available tracers::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat available_tracers
    blk function_graph function nop
 
-The 'current_tracer' file contains the tracer currently in effect: ::
+The 'current_tracer' file contains the tracer currently in effect::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat current_tracer
    nop
@@ -1237,7 +1237,7 @@ The above listing of current_tracer shows that the
 there's actually no tracer currently in effect.
 
 echo'ing one of the available_tracers into current_tracer makes the
-specified tracer the current tracer: ::
+specified tracer the current tracer::
 
    root@sugarbay:/sys/kernel/debug/tracing# echo function > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# cat current_tracer
@@ -1247,7 +1247,7 @@ The above sets the current tracer to be the 'function tracer'. This tracer
 traces every function call in the kernel and makes it available as the
 contents of the 'trace' file. Reading the 'trace' file lists the
 currently buffered function calls that have been traced by the function
-tracer: ::
+tracer::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
 
@@ -1306,7 +1306,7 @@ great way to learn about how the kernel code works in a dynamic sense.
 
 It is a little more difficult to follow the call chains than it needs to
 be - luckily there's a variant of the function tracer that displays the
-callchains explicitly, called the 'function_graph' tracer: ::
+callchains explicitly, called the 'function_graph' tracer::
 
    root@sugarbay:/sys/kernel/debug/tracing# echo function_graph > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
@@ -1442,7 +1442,7 @@ One especially important directory contained within the
 /sys/kernel/debug/tracing directory is the 'events' subdirectory, which
 contains representations of every tracepoint in the system. Listing out
 the contents of the 'events' subdirectory, we see mainly another set of
-subdirectories: ::
+subdirectories::
 
    root@sugarbay:/sys/kernel/debug/tracing# cd events
    root@sugarbay:/sys/kernel/debug/tracing/events# ls -al
@@ -1491,7 +1491,7 @@ subdirectories: ::
 Each one of these subdirectories
 corresponds to a 'subsystem' and contains yet again more subdirectories,
 each one of those finally corresponding to a tracepoint. For example,
-here are the contents of the 'kmem' subsystem: ::
+here are the contents of the 'kmem' subsystem::
 
    root@sugarbay:/sys/kernel/debug/tracing/events# cd kmem
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem# ls -al
@@ -1513,7 +1513,7 @@ here are the contents of the 'kmem' subsystem: ::
    drwxr-xr-x    2 root     root             0 Nov 14 23:19 mm_page_pcpu_drain
 
 Let's see what's inside the subdirectory for a
-specific tracepoint, in this case the one for kmalloc: ::
+specific tracepoint, in this case the one for kmalloc::
 
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem# cd kmalloc
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# ls -al
@@ -1529,7 +1529,7 @@ tracepoint describes the event in memory, which is used by the various
 tracing tools that now make use of these tracepoint to parse the event
 and make sense of it, along with a 'print fmt' field that allows tools
 like ftrace to display the event as text. Here's what the format of the
-kmalloc event looks like: ::
+kmalloc event looks like::
 
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# cat format
    name: kmalloc
@@ -1568,20 +1568,20 @@ The 'enable' file
 in the tracepoint directory is what allows the user (or tools such as
 trace-cmd) to actually turn the tracepoint on and off. When enabled, the
 corresponding tracepoint will start appearing in the ftrace 'trace' file
-described previously. For example, this turns on the kmalloc tracepoint: ::
+described previously. For example, this turns on the kmalloc tracepoint::
 
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# echo 1 > enable
 
 At the moment, we're not interested in the function tracer or
 some other tracer that might be in effect, so we first turn it off, but
 if we do that, we still need to turn tracing on in order to see the
-events in the output buffer: ::
+events in the output buffer::
 
    root@sugarbay:/sys/kernel/debug/tracing# echo nop > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# echo 1 > tracing_on
 
 Now, if we look at the 'trace' file, we see nothing
-but the kmalloc events we just turned on: ::
+but the kmalloc events we just turned on::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
    # tracer: nop
@@ -1627,7 +1627,7 @@ but the kmalloc events we just turned on: ::
             <idle>-0     [000] ..s3 18156.400660: kmalloc: call_site=ffffffff81619b36 ptr=ffff88006d554800 bytes_req=512 bytes_alloc=512 gfp_flags=GFP_ATOMIC
    matchbox-termin-1361  [001] ...1 18156.552800: kmalloc: call_site=ffffffff81614050 ptr=ffff88006db34800 bytes_req=576 bytes_alloc=1024 gfp_flags=GFP_KERNEL|GFP_REPEAT
 
-To again disable the kmalloc event, we need to send 0 to the enable file: ::
+To again disable the kmalloc event, we need to send 0 to the enable file::
 
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# echo 0 > enable
 
@@ -1669,12 +1669,12 @@ a per-CPU graphical display. It directly uses 'trace-cmd' as the
 plumbing that accomplishes all that underneath the covers (and actually
 displays the trace-cmd command it uses, as we'll see).
 
-To start a trace using kernelshark, first start kernelshark: ::
+To start a trace using kernelshark, first start kernelshark::
 
    root@sugarbay:~# kernelshark
 
 Then bring up the 'Capture' dialog by
-choosing from the kernelshark menu: ::
+choosing from the kernelshark menu::
 
    Capture | Record
 
@@ -1724,12 +1724,12 @@ ftrace Documentation
 --------------------
 
 The documentation for ftrace can be found in the kernel Documentation
-directory: ::
+directory::
 
    Documentation/trace/ftrace.txt
 
 The documentation for the trace event subsystem can also be found in the kernel
-Documentation directory: ::
+Documentation directory::
 
    Documentation/trace/events.txt
 
@@ -1784,7 +1784,7 @@ which it extracts from the open syscall's argstr.
 Normally, to execute this
 probe, you'd simply install systemtap on the system you want to probe,
 and directly run the probe on that system e.g. assuming the name of the
-file containing the above text is trace_open.stp: ::
+file containing the above text is trace_open.stp::
 
    # stap trace_open.stp
 
@@ -1825,7 +1825,7 @@ target, with arguments if necessary.
 In order to do this from a remote host, however, you need to have access
 to the build for the image you booted. The 'crosstap' script provides
 details on how to do this if you run the script on the host without
-having done a build: ::
+having done a build::
 
    $ crosstap root@192.168.1.88 trace_open.stp
 
@@ -1885,7 +1885,7 @@ Running a Script on a Target
 ----------------------------
 
 Once you've done that, you should be able to run a systemtap script on
-the target: ::
+the target::
 
    $ cd /path/to/yocto
    $ source oe-init-build-env
@@ -1903,17 +1903,17 @@ the target: ::
    You can also run generated QEMU images with a command like 'runqemu qemux86-64'
 
 Once you've done that, you can cd to whatever
-directory contains your scripts and use 'crosstap' to run the script: ::
+directory contains your scripts and use 'crosstap' to run the script::
 
    $ cd /path/to/my/systemap/script
    $ crosstap root@192.168.7.2 trace_open.stp
 
-If you get an error connecting to the target e.g.: ::
+If you get an error connecting to the target e.g.::
 
    $ crosstap root@192.168.7.2 trace_open.stp
    error establishing ssh connection on remote 'root@192.168.7.2'
 
-Try ssh'ing to the target and see what happens: ::
+Try ssh'ing to the target and see what happens::
 
    $ ssh root@192.168.7.2
 
@@ -2038,7 +2038,7 @@ tracing.
 Collecting and viewing a trace on the target (inside a shell)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-First, from the host, ssh to the target: ::
+First, from the host, ssh to the target::
 
    $ ssh -l root 192.168.1.47
    The authenticity of host '192.168.1.47 (192.168.1.47)' can't be established.
@@ -2047,30 +2047,30 @@ First, from the host, ssh to the target: ::
    Warning: Permanently added '192.168.1.47' (RSA) to the list of known hosts.
    root@192.168.1.47's password:
 
-Once on the target, use these steps to create a trace: ::
+Once on the target, use these steps to create a trace::
 
    root@crownbay:~# lttng create
    Spawning a session daemon
    Session auto-20121015-232120 created.
    Traces will be written in /home/root/lttng-traces/auto-20121015-232120
 
-Enable the events you want to trace (in this case all kernel events): ::
+Enable the events you want to trace (in this case all kernel events)::
 
    root@crownbay:~# lttng enable-event --kernel --all
    All kernel events are enabled in channel channel0
 
-Start the trace: ::
+Start the trace::
 
    root@crownbay:~# lttng start
    Tracing started for session auto-20121015-232120
 
 And then stop the trace after awhile or after running a particular workload that
-you want to trace: ::
+you want to trace::
 
    root@crownbay:~# lttng stop
    Tracing stopped for session auto-20121015-232120
 
-You can now view the trace in text form on the target: ::
+You can now view the trace in text form on the target::
 
    root@crownbay:~# lttng view
    [23:21:56.989270399] (+?.?????????) sys_geteuid: { 1 }, { }
@@ -2116,14 +2116,14 @@ You can now view the trace in text form on the target: ::
 
 You can now safely destroy the trace
 session (note that this doesn't delete the trace - it's still there in
-~/lttng-traces): ::
+~/lttng-traces)::
 
    root@crownbay:~# lttng destroy
    Session auto-20121015-232120 destroyed at /home/root
 
 Note that the trace is saved in a directory of the same name as returned by
 'lttng create', under the ~/lttng-traces directory (note that you can change this by
-supplying your own name to 'lttng create'): ::
+supplying your own name to 'lttng create')::
 
    root@crownbay:~# ls -al ~/lttng-traces
    drwxrwx---    3 root     root          1024 Oct 15 23:21 .
@@ -2139,18 +2139,18 @@ generated by the lttng-ust build.
 
 The 'hello' test program isn't installed on the rootfs by the lttng-ust
 build, so we need to copy it over manually. First cd into the build
-directory that contains the hello executable: ::
+directory that contains the hello executable::
 
    $ cd build/tmp/work/core2_32-poky-linux/lttng-ust/2.0.5-r0/git/tests/hello/.libs
 
-Copy that over to the target machine: ::
+Copy that over to the target machine::
 
    $ scp hello root@192.168.1.20:
 
 You now have the instrumented lttng 'hello world' test program on the
 target, ready to test.
 
-First, from the host, ssh to the target: ::
+First, from the host, ssh to the target::
 
    $ ssh -l root 192.168.1.47
    The authenticity of host '192.168.1.47 (192.168.1.47)' can't be established.
@@ -2159,35 +2159,35 @@ First, from the host, ssh to the target: ::
    Warning: Permanently added '192.168.1.47' (RSA) to the list of known hosts.
    root@192.168.1.47's password:
 
-Once on the target, use these steps to create a trace: ::
+Once on the target, use these steps to create a trace::
 
    root@crownbay:~# lttng create
    Session auto-20190303-021943 created.
    Traces will be written in /home/root/lttng-traces/auto-20190303-021943
 
-Enable the events you want to trace (in this case all userspace events): ::
+Enable the events you want to trace (in this case all userspace events)::
 
    root@crownbay:~# lttng enable-event --userspace --all
    All UST events are enabled in channel channel0
 
-Start the trace: ::
+Start the trace::
 
    root@crownbay:~# lttng start
    Tracing started for session auto-20190303-021943
 
-Run the instrumented hello world program: ::
+Run the instrumented hello world program::
 
    root@crownbay:~# ./hello
    Hello, World!
    Tracing... done.
 
 And then stop the trace after awhile or after running a particular workload
-that you want to trace: ::
+that you want to trace::
 
    root@crownbay:~# lttng stop
    Tracing stopped for session auto-20190303-021943
 
-You can now view the trace in text form on the target: ::
+You can now view the trace in text form on the target::
 
    root@crownbay:~# lttng view
    [02:31:14.906146544] (+?.?????????) hello:1424 ust_tests_hello:tptest: { cpu_id = 1 }, { intfield = 0, intfield2 = 0x0, longfield = 0, netintfield = 0, netintfieldhex = 0x0, arrfield1 = [ [0] = 1, [1] = 2, [2] = 3 ], arrfield2 = "test", _seqfield1_length = 4, seqfield1 = [ [0] = 116, [1] = 101, [2] = 115, [3] = 116 ], _seqfield2_length = 4,  seqfield2 = "test", stringfield = "test", floatfield = 2222, doublefield = 2, boolfield = 1 }
@@ -2199,7 +2199,7 @@ You can now view the trace in text form on the target: ::
    .
 
 You can now safely destroy the trace session (note that this doesn't delete the
-trace - it's still there in ~/lttng-traces): ::
+trace - it's still there in ~/lttng-traces)::
 
    root@crownbay:~# lttng destroy
    Session auto-20190303-021943 destroyed at /home/root
@@ -2244,7 +2244,7 @@ Basic blktrace Usage
 --------------------
 
 To record a trace, simply run the 'blktrace' command, giving it the name
-of the block device you want to trace activity on: ::
+of the block device you want to trace activity on::
 
    root@crownbay:~# blktrace /dev/sdc
 
@@ -2265,7 +2265,7 @@ dumps them to userspace for blkparse to merge and sort later). ::
     Total:                  8660 events (dropped 0),      406 KiB data
 
 If you examine the files saved to disk, you see multiple files, one per CPU and
-with the device name as the first part of the filename: ::
+with the device name as the first part of the filename::
 
    root@crownbay:~# ls -al
    drwxr-xr-x    6 root     root          1024 Oct 27 22:39 .
@@ -2275,7 +2275,7 @@ with the device name as the first part of the filename: ::
 
 To view the trace events, simply invoke 'blkparse' in the directory
 containing the trace files, giving it the device name that forms the
-first part of the filenames: ::
+first part of the filenames::
 
    root@crownbay:~# blkparse sdc
 
@@ -2373,7 +2373,7 @@ Live Mode
 
 blktrace and blkparse are designed from the ground up to be able to
 operate together in a 'pipe mode' where the stdout of blktrace can be
-fed directly into the stdin of blkparse: ::
+fed directly into the stdin of blkparse::
 
    root@crownbay:~# blktrace /dev/sdc -o - | blkparse -i -
 
@@ -2386,7 +2386,7 @@ identify and capture conditions of interest.
 
 There's actually another blktrace command that implements the above
 pipeline as a single command, so the user doesn't have to bother typing
-in the above command sequence: ::
+in the above command sequence::
 
    root@crownbay:~# btrace /dev/sdc
 
@@ -2401,19 +2401,19 @@ the traced device at all by providing native support for sending all
 trace data over the network.
 
 To have blktrace operate in this mode, start blktrace on the target
-system being traced with the -l option, along with the device to trace: ::
+system being traced with the -l option, along with the device to trace::
 
    root@crownbay:~# blktrace -l /dev/sdc
    server: waiting for connections...
 
 On the host system, use the -h option to connect to the target system,
-also passing it the device to trace: ::
+also passing it the device to trace::
 
    $ blktrace -d /dev/sdc -h 192.168.1.43
    blktrace: connecting to 192.168.1.43
    blktrace: connected!
 
-On the target system, you should see this: ::
+On the target system, you should see this::
 
    server: connection from 192.168.1.43
 
@@ -2424,7 +2424,7 @@ In another shell, execute a workload you want to trace. ::
    linux-2.6.19.2.tar.b 100% \|*******************************\| 41727k 0:00:00 ETA
 
 When it's done, do a Ctrl-C on the host system to stop the
-trace: ::
+trace::
 
    ^C=== sdc ===
     CPU  0:                 7691 events,      361 KiB data
@@ -2432,7 +2432,7 @@ trace: ::
     Total:                 11800 events (dropped 0),      554 KiB data
 
 On the target system, you should also see a trace summary for the trace
-just ended: ::
+just ended::
 
    server: end of run for 192.168.1.43:sdc
    === sdc ===
@@ -2441,20 +2441,20 @@ just ended: ::
     Total:                 11800 events (dropped 0),      554 KiB data
 
 The blktrace instance on the host will
-save the target output inside a hostname-timestamp directory: ::
+save the target output inside a hostname-timestamp directory::
 
    $ ls -al
    drwxr-xr-x   10 root     root          1024 Oct 28 02:40 .
    drwxr-sr-x    4 root     root          1024 Oct 26 18:24 ..
    drwxr-xr-x    2 root     root          1024 Oct 28 02:40 192.168.1.43-2012-10-28-02:40:56
 
-cd into that directory to see the output files: ::
+cd into that directory to see the output files::
 
    $ ls -l
    -rw-r--r--    1 root     root        369193 Oct 28 02:44 sdc.blktrace.0
    -rw-r--r--    1 root     root        197278 Oct 28 02:44 sdc.blktrace.1
 
-And run blkparse on the host system using the device name: ::
+And run blkparse on the host system using the device name::
 
    $ blkparse sdc
 
@@ -2517,25 +2517,25 @@ userspace tools.
 
 To enable tracing for a given device, use /sys/block/xxx/trace/enable,
 where xxx is the device name. This for example enables tracing for
-/dev/sdc: ::
+/dev/sdc::
 
    root@crownbay:/sys/kernel/debug/tracing# echo 1 > /sys/block/sdc/trace/enable
 
 Once you've selected the device(s) you want
-to trace, selecting the 'blk' tracer will turn the blk tracer on: ::
+to trace, selecting the 'blk' tracer will turn the blk tracer on::
 
    root@crownbay:/sys/kernel/debug/tracing# cat available_tracers
    blk function_graph function nop
 
    root@crownbay:/sys/kernel/debug/tracing# echo blk > current_tracer
 
-Execute the workload you're interested in: ::
+Execute the workload you're interested in::
 
    root@crownbay:/sys/kernel/debug/tracing# cat /media/sdc/testfile.txt
 
 And look at the output (note here that we're using 'trace_pipe' instead of
 trace to capture this trace - this allows us to wait around on the pipe
-for data to appear): ::
+for data to appear)::
 
    root@crownbay:/sys/kernel/debug/tracing# cat trace_pipe
                cat-3587  [001] d..1  3023.276361:   8,32   Q   R 1699848 + 8 [cat]
@@ -2554,7 +2554,7 @@ for data to appear): ::
                cat-3587  [001] d..1  3023.276497:   8,32   m   N cfq3587 activate rq, drv=1
                cat-3587  [001] d..2  3023.276500:   8,32   D   R 1699848 + 8 [cat]
 
-And this turns off tracing for the specified device: ::
+And this turns off tracing for the specified device::
 
    root@crownbay:/sys/kernel/debug/tracing# echo 0 > /sys/block/sdc/trace/enable
 
@@ -2572,6 +2572,6 @@ section can be found here:
 
 The above manpages, along with manpages for the other blktrace utilities
 (btt, blkiomon, etc) can be found in the /doc directory of the blktrace
-tools git repo: ::
+tools git repo::
 
    $ git clone git://git.kernel.dk/blktrace.git
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 64fdfdf756..a9103f83c6 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -125,7 +125,7 @@ file.
 
 Following is the applicable code for setting various proxy types in the
 ``.wgetrc`` file. By default, these settings are disabled with comments.
-To use them, remove the comments: ::
+To use them, remove the comments::
 
    # You can set the default proxies for Wget to use for http, https, and ftp.
    # They will override the value in the environment.
@@ -224,7 +224,7 @@ to add a BSP-specific netbase that includes an interfaces file. See the
 the Yocto Project Board Support Packages (BSP) Developer's Guide for
 information on creating these types of miscellaneous recipe files.
 
-For example, add the following files to your layer: ::
+For example, add the following files to your layer::
 
    meta-MACHINE/recipes-bsp/netbase/netbase/MACHINE/interfaces
    meta-MACHINE/recipes-bsp/netbase/netbase_5.0.bbappend
@@ -300,7 +300,7 @@ fail.
 
 As an example, you could add a specific server for the build system to
 attempt before any others by adding something like the following to the
-``local.conf`` configuration file: ::
+``local.conf`` configuration file::
 
    PREMIRRORS_prepend = "\
        git://.*/.* http://www.yoctoproject.org/sources/ \n \
@@ -343,7 +343,7 @@ however, the technique can simply waste time during the build.
 
 Finally, consider an example where you are behind an HTTP-only firewall.
 You could make the following changes to the ``local.conf`` configuration
-file as long as the ``PREMIRRORS`` server is current: ::
+file as long as the ``PREMIRRORS`` server is current::
 
    PREMIRRORS_prepend = "\
        ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index cf5cc1109f..6b4e958a85 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -27,7 +27,7 @@ image you want.
 
 From within the ``poky`` Git repository, you can use the following
 command to display the list of directories within the :term:`Source Directory`
-that contain image recipe files: ::
+that contain image recipe files::
 
    $ ls meta*/recipes*/images/*.bb
 
diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/ref-manual/migration-1.3.rst
index 0929f490d7..7c522dc123 100644
--- a/documentation/ref-manual/migration-1.3.rst
+++ b/documentation/ref-manual/migration-1.3.rst
@@ -29,7 +29,7 @@ location (either local or remote) and then point to it in
 :term:`SSTATE_MIRRORS`, you need to append "PATH"
 to the end of the mirror URL so that the path used by BitBake before the
 mirror substitution is appended to the path used to access the mirror.
-Here is an example: ::
+Here is an example::
 
    SSTATE_MIRRORS = "file://.* http://someserver.tld/share/sstate/PATH"
 
@@ -188,7 +188,7 @@ include :term:`PE` as part of the filename:
 
 Because the ``PE`` variable is not set by default, these binary files
 could result with names that include two dash characters. Here is an
-example: ::
+example::
 
    bzImage--3.10.9+git0+cd502a8814_7144bcc4b8-r0-qemux86-64-20130830085431.bin
 
diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/ref-manual/migration-1.6.rst
index 4c6afab1fb..fe3e04d685 100644
--- a/documentation/ref-manual/migration-1.6.rst
+++ b/documentation/ref-manual/migration-1.6.rst
@@ -207,7 +207,7 @@ functions to call and not arbitrary shell commands:
 
 For
 migration purposes, you can simply wrap shell commands in a shell
-function and then call the function. Here is an example: ::
+function and then call the function. Here is an example::
 
    my_postprocess_function() {
       echo "hello" > ${IMAGE_ROOTFS}/hello.txt
diff --git a/documentation/ref-manual/migration-1.8.rst b/documentation/ref-manual/migration-1.8.rst
index ec2b138796..68d5dcf859 100644
--- a/documentation/ref-manual/migration-1.8.rst
+++ b/documentation/ref-manual/migration-1.8.rst
@@ -56,7 +56,7 @@ you can now remove them.
 Additionally, a ``bluetooth`` class has been added to make selection of
 the appropriate bluetooth support within a recipe a little easier. If
 you wish to make use of this class in a recipe, add something such as
-the following: ::
+the following::
 
    inherit bluetooth
    PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
@@ -84,7 +84,7 @@ where the ``linux.inc`` file in ``meta-oe`` was updated.
 
 Recipes that rely on the kernel source code and do not inherit the
 module classes might need to add explicit dependencies on the
-``do_shared_workdir`` kernel task, for example: ::
+``do_shared_workdir`` kernel task, for example::
 
    do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
@@ -131,7 +131,7 @@ One of the improvements is to attempt to run "make clean" during the
 ``do_configure`` task if a ``Makefile`` exists. Some software packages
 do not provide a working clean target within their make files. If you
 have such recipes, you need to set
-:term:`CLEANBROKEN` to "1" within the recipe, for example: ::
+:term:`CLEANBROKEN` to "1" within the recipe, for example::
 
    CLEANBROKEN = "1"
 
diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
index 198181a469..d11735163e 100644
--- a/documentation/ref-manual/migration-2.2.rst
+++ b/documentation/ref-manual/migration-2.2.rst
@@ -179,7 +179,7 @@ Supported machines are as follows:
 
 Consider the
 following example, which uses the ``qemux86-64`` machine, provides a
-root filesystem, provides an image, and uses the ``nographic`` option: ::
+root filesystem, provides an image, and uses the ``nographic`` option::
 
    $ runqemu qemux86-64 tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4 tmp/deploy/images/qemux86-64/bzImage nographic
 
diff --git a/documentation/ref-manual/migration-2.5.rst b/documentation/ref-manual/migration-2.5.rst
index 9ef4b55399..fd5f2f88e0 100644
--- a/documentation/ref-manual/migration-2.5.rst
+++ b/documentation/ref-manual/migration-2.5.rst
@@ -169,7 +169,7 @@ one of the packages provided by the Python recipe. You can no longer run
 ``bitbake python-foo`` or have a
 :term:`DEPENDS` on ``python-foo``,
 but doing either of the following causes the package to work as
-expected: ::
+expected::
 
    IMAGE_INSTALL_append = " python-foo"
 
diff --git a/documentation/ref-manual/migration-3.1.rst b/documentation/ref-manual/migration-3.1.rst
index 84d32502e5..c62aba7d48 100644
--- a/documentation/ref-manual/migration-3.1.rst
+++ b/documentation/ref-manual/migration-3.1.rst
@@ -179,12 +179,12 @@ parameter instead of the earlier ``name`` which overlapped with the
 generic ``name`` parameter. All recipes using the npm fetcher will need
 to be changed as a result.
 
-An example of the new scheme: ::
+An example of the new scheme::
 
    SRC_URI = "npm://registry.npmjs.org;package=array-flatten;version=1.1.1 \
               npmsw://${THISDIR}/npm-shrinkwrap.json"
 
-Another example where the sources are fetched from git rather than an npm repository: ::
+Another example where the sources are fetched from git rather than an npm repository::
 
    SRC_URI = "git://github.com/foo/bar.git;protocol=https \
               npmsw://${THISDIR}/npm-shrinkwrap.json"
diff --git a/documentation/ref-manual/migration-3.2.rst b/documentation/ref-manual/migration-3.2.rst
index 39743af70d..956a56f626 100644
--- a/documentation/ref-manual/migration-3.2.rst
+++ b/documentation/ref-manual/migration-3.2.rst
@@ -90,12 +90,12 @@ If you have anonymous python or in-line python conditionally adding
 dependencies in your custom recipes, and you intend for those recipes to
 work with multilib, then you will need to ensure that ``${MLPREFIX}``
 is prefixed on the package names in the dependencies, for example
-(from the ``glibc`` recipe): ::
+(from the ``glibc`` recipe)::
 
     RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
 
 This also applies when conditionally adding packages to :term:`PACKAGES` where
-those packages have dependencies, for example (from the ``alsa-plugins`` recipe): ::
+those packages have dependencies, for example (from the ``alsa-plugins`` recipe)::
 
     PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
     ...
@@ -229,7 +229,7 @@ needs ``/etc/ld.so.conf`` to be present at image build time:
 
 When some recipe installs libraries to a non-standard location, and
 therefore installs in a file in ``/etc/ld.so.conf.d/foo.conf``, we
-need ``/etc/ld.so.conf`` containing: ::
+need ``/etc/ld.so.conf`` containing::
 
   include /etc/ld.so.conf.d/*.conf
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 6cb767d934..79d2d4266a 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -675,7 +675,7 @@ Errors and Warnings
     task. Patch fuzz is a situation when the ``patch`` tool ignores some of the context
     lines in order to apply the patch. Consider this example:
 
-    Patch to be applied: ::
+    Patch to be applied::
 
         --- filename
         +++ filename
@@ -687,7 +687,7 @@ Errors and Warnings
          context line 5
          context line 6
 
-    Original source code: ::
+    Original source code::
 
         different context line 1
         different context line 2
@@ -696,7 +696,7 @@ Errors and Warnings
         different context line 5
         different context line 6
 
-    Outcome (after applying patch with fuzz): ::
+    Outcome (after applying patch with fuzz)::
 
         different context line 1
         different context line 2
@@ -716,14 +716,14 @@ Errors and Warnings
     *How to eliminate patch fuzz warnings*
 
     Use the ``devtool`` command as explained by the warning. First, unpack the
-    source into devtool workspace: ::
+    source into devtool workspace::
 
             devtool modify <recipe>
 
     This will apply all of the patches, and create new commits out of them in
     the workspace - with the patch context updated.
 
-    Then, replace the patches in the recipe layer: ::
+    Then, replace the patches in the recipe layer::
 
             devtool finish --force-patch-refresh <recipe> <layer_path>
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 74ac12bf98..9435aec458 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -728,7 +728,7 @@ system and gives an overview of their function and contents.
 
       If you want to mask out multiple directories or recipes, you can
       specify multiple regular expression fragments. This next example
-      masks out multiple directories and individual recipes: ::
+      masks out multiple directories and individual recipes::
 
          BBMASK += "/meta-ti/recipes-misc/ meta-ti/recipes-ti/packagegroup/"
          BBMASK += "/meta-oe/recipes-support/"
@@ -4890,13 +4890,13 @@ system and gives an overview of their function and contents.
       Prevents installation of all "recommended-only" packages.
       Recommended-only packages are packages installed only through the
       :term:`RRECOMMENDS` variable). Setting the
-      ``NO_RECOMMENDATIONS`` variable to "1" turns this feature on: ::
+      ``NO_RECOMMENDATIONS`` variable to "1" turns this feature on::
 
          NO_RECOMMENDATIONS = "1"
 
       You can set this variable globally in your ``local.conf`` file or you
       can attach it to a specific image recipe by using the recipe name
-      override: ::
+      override::
 
          NO_RECOMMENDATIONS_pn-target_image = "1"
 
@@ -6924,7 +6924,7 @@ system and gives an overview of their function and contents.
       ``/proc/console`` before enabling them using getty. This variable
       allows aliasing in the format: <device>:<alias>. If a device was
       listed as "sclp_line0" in ``/dev/`` and "ttyS0" was listed in
-      ``/proc/console``, you would do the following: ::
+      ``/proc/console``, you would do the following::
 
          SERIAL_CONSOLES_CHECK = "slcp_line0:ttyS0"
 
@@ -6934,7 +6934,7 @@ system and gives an overview of their function and contents.
    :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
       A list of recipe dependencies that should not be used to determine
       signatures of tasks from one recipe when they depend on tasks from
-      another recipe. For example: ::
+      another recipe. For example::
 
          SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "intone->mplayer2"
 
@@ -6942,7 +6942,7 @@ system and gives an overview of their function and contents.
 
       You can use the special token ``"*"`` on the left-hand side of the
       dependency to match all recipes except the one on the right-hand
-      side. Here is an example: ::
+      side. Here is an example::
 
          SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "*->quilt-native"
 
-- 
2.25.1

