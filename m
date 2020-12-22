Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.9664.1608631089085920084
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 01:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dqqMYxL3;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id r7so13908800wrc.5
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 01:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pLW5MVF+k/nNakh3FOpE4WzxfY79f0nEpxXRlAvmsQE=;
        b=dqqMYxL3IeuRNj1E/MrO1TTovDM28nr4cqSOuBYAOVWPIUDNUnRiZ02GUXqujrnjC0
         CY5cC8ro9rv0B+vrAHTgtrPevnDxAWRLZfOSoCFQ5gALl6fqDx6LQmynvpnMWfdtdJQh
         NYgDd/Kc3jJlFaMhVg4Irw0KJIuJWsFCqwVVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pLW5MVF+k/nNakh3FOpE4WzxfY79f0nEpxXRlAvmsQE=;
        b=sr1cNHwRPYxUVx3/y2FA/ZjIJfy8LyZ6jzQnb0gPIy4QMtJuJETHmBUbhvTAXsAIOk
         AOHneBULn/oNKB/mnCwvG2tAIX8DL/k99vMHRQMl7PRq7apmIC+VDPAo5typR6LqzNN6
         2yRsu4B8dRrKd92Wkjl61uVb5G+tP7z7C71PZBF3TTieI2QtVJdZ+QTRo8WwlC3uJAey
         WrAcgisW7I4S23bqYxtB+9vEFfOffLdVBg/L6R7iVSCjcXqFqT40XSbF80krHY/SgfYg
         ElzIP6EsVCjthJAHg+fczNAqxOkBM8Mft9Nmgg0g9mWoc7PbU2JRukjncjPUPp883kmC
         XcEQ==
X-Gm-Message-State: AOAM530/2WEMUrn0wqr1RE4qKc/BnT3lFe+UUvgdpvf8TpCEdtBmViTa
	YRFKuOCkla1ppzcapl6Ww++e3sgvrdqgyA==
X-Google-Smtp-Source: ABdhPJz/Y2sbJ+wF5E7TqqevRblDSCraG/3arcCaS1/SUpa4fIhnSoxYjAtZlAaGo6JUAimjRDETDQ==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr23288650wrn.300.1608631086415;
        Tue, 22 Dec 2020 01:58:06 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id o125sm27291772wmo.30.2020.12.22.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:58:05 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 6/6] documentation: Use https links where possible
Date: Tue, 22 Dec 2020 09:57:58 +0000
Message-Id: <20201222095758.7411-7-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222095758.7411-1-pbarker@konsulko.com>
References: <20201222095758.7411-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/README                          |  8 ++--
 documentation/boilerplate.rst                 |  2 +-
 documentation/brief-yoctoprojectqs/index.rst  |  2 +-
 documentation/dev-manual/common-tasks.rst     |  2 +-
 .../development-environment.rst               | 22 +++++-----
 documentation/overview-manual/yp-intro.rst    |  4 +-
 documentation/profile-manual/usage.rst        | 44 +++++++++----------
 documentation/ref-manual/classes.rst          |  4 +-
 documentation/ref-manual/faq.rst              |  6 +--
 documentation/ref-manual/images.rst           |  4 +-
 documentation/ref-manual/kickstart.rst        |  4 +-
 documentation/ref-manual/migration-2.1.rst    |  2 +-
 documentation/ref-manual/migration-2.3.rst    |  2 +-
 documentation/ref-manual/migration-2.7.rst    |  2 +-
 documentation/ref-manual/qa-checks.rst        |  2 +-
 documentation/ref-manual/resources.rst        |  4 +-
 documentation/ref-manual/variables.rst        | 20 ++++-----
 documentation/sdk-manual/intro.rst            |  2 +-
 documentation/toaster-manual/reference.rst    |  4 +-
 19 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/documentation/README b/documentation/README
index b0a3cb1dc..be03bb119 100644
--- a/documentation/README
+++ b/documentation/README
@@ -2,7 +2,7 @@ documentation
 =============
 
 This is the directory that contains the Yocto Project documentation.  The Yocto
-Project source repositories at http://git.yoctoproject.org/cgit.cgi have two
+Project source repositories at https://git.yoctoproject.org/cgit.cgi have two
 instances of the "documentation" directory.  You should understand each of
 these instances.
 
@@ -47,12 +47,12 @@ Folders exist for individual manuals as follows:
 Each folder is self-contained regarding content and figures.
 
 If you want to find HTML versions of the Yocto Project manuals on the web,
-go to http://www.yoctoproject.org and click on the "Documentation" tab.  From
+go to https://www.yoctoproject.org and click on the "Documentation" tab.  From
 there you have access to archived documentation from previous releases, current
 documentation for the latest release, and "Docs in Progress" for the release
 currently being developed.
 
-In general, the Yocto Project site (http://www.yoctoproject.org) is a great
+In general, the Yocto Project site (https://www.yoctoproject.org) is a great
 reference for both information and downloads.
 
 poky.yaml
@@ -228,7 +228,7 @@ content:
 
 Variables can be nested, like it was the case for DocBook:
 
-  YOCTO_HOME_URL : "http://www.yoctoproject.org"
+  YOCTO_HOME_URL : "https://www.yoctoproject.org"
   YOCTO_DOCS_URL : "&YOCTO_HOME_URL;/docs"
 
 Note directive
diff --git a/documentation/boilerplate.rst b/documentation/boilerplate.rst
index ddffdac24..2ad60eb8b 100644
--- a/documentation/boilerplate.rst
+++ b/documentation/boilerplate.rst
@@ -8,7 +8,7 @@
 
 Permission is granted to copy, distribute and/or modify this document under the
 terms of the `Creative Commons Attribution-Share Alike 2.0 UK: England & Wales
-<http://creativecommons.org/licenses/by-sa/2.0/uk/>`_ as published by Creative
+<https://creativecommons.org/licenses/by-sa/2.0/uk/>`_ as published by Creative
 Commons.
 
 To report any inaccuracies or problems with this (or any other Yocto Project)
diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index f077ee843..63083cb13 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -397,7 +397,7 @@ information including the website, wiki pages, and user manuals:
    Development Community into which you can tap.
 
 -  **Developer Screencast:** The `Getting Started with the Yocto Project -
-   New Developer Screencast Tutorial <http://vimeo.com/36450321>`__
+   New Developer Screencast Tutorial <https://vimeo.com/36450321>`__
    provides a 30-minute video created for users unfamiliar with the
    Yocto Project but familiar with Linux build hosts. While this
    screencast is somewhat dated, the introductory and fundamental
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index bd8ceedc7..67dc7d820 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -6043,7 +6043,7 @@ the Internet:
    Botnet
 
 -  *"*\ `Security Issues for Embedded
-   Devices <http://elinux.org/images/6/6f/Security-issues.pdf>`__\ *"*
+   Devices <https://elinux.org/images/6/6f/Security-issues.pdf>`__\ *"*
    by Jake Edge
 
 When securing your image is of concern, there are steps, tools, and
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 9a2997d9f..011a47957 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -40,7 +40,7 @@ project is the Windows family of operating systems developed by
 Microsoft Corporation.
 
 Wikipedia has a good historical description of the Open Source
-Philosophy `here <http://en.wikipedia.org/wiki/Open_source>`__. You can
+Philosophy `here <https://en.wikipedia.org/wiki/Open_source>`__. You can
 also find helpful information on how to participate in the Linux
 Community
 `here <https://www.kernel.org/doc/html/latest/process/index.html>`__.
@@ -291,7 +291,7 @@ While each development environment is unique, there are some best
 practices or methods that help development run smoothly. The following
 list describes some of these practices. For more information about Git
 workflows, see the workflow topics in the `Git Community
-Book <http://book.git-scm.com>`__.
+Book <https://book.git-scm.com>`__.
 
 -  *Make Small Changes:* It is best to keep the changes you commit small
    as compared to bundling many disparate changes into a single commit.
@@ -368,12 +368,12 @@ commands.
 .. note::
 
    -  For more information on Git, see
-      http://git-scm.com/documentation.
+      https://git-scm.com/documentation.
 
    -  If you need to download Git, it is recommended that you add Git to
       your system through your distribution's "software store" (e.g. for
       Ubuntu, use the Ubuntu Software feature). For the Git download
-      page, see http://git-scm.com/download.
+      page, see https://git-scm.com/download.
 
    -  For information beyond the introductory nature in this section,
       see the ":ref:`dev-manual/start:locating yocto project source files`"
@@ -507,7 +507,7 @@ you can manage with a small set of basic operations and workflows once
 you understand the basic philosophy behind Git. You do not have to be an
 expert in Git to be functional. A good place to look for instruction on
 a minimal set of Git commands is
-`here <http://git-scm.com/documentation>`__.
+`here <https://git-scm.com/documentation>`__.
 
 The following list of Git commands briefly describes some basic Git
 operations as a way to get started. As with any set of commands, this
@@ -614,10 +614,10 @@ and Free Software has an interesting history. If you are interested in
 this history, you can find basic information here:
 
 -  `Open source license
-   history <http://en.wikipedia.org/wiki/Open-source_license>`__
+   history <https://en.wikipedia.org/wiki/Open-source_license>`__
 
 -  `Free software license
-   history <http://en.wikipedia.org/wiki/Free_software_license>`__
+   history <https://en.wikipedia.org/wiki/Free_software_license>`__
 
 In general, the Yocto Project is broadly licensed under the
 Massachusetts Institute of Technology (MIT) License. MIT licensing
@@ -626,9 +626,9 @@ license is distributed with that software. MIT is also compatible with
 the GNU General Public License (GPL). Patches to the Yocto Project
 follow the upstream licensing scheme. You can find information on the
 MIT license
-`here <http://www.opensource.org/licenses/mit-license.php>`__. You can
+`here <https://www.opensource.org/licenses/mit-license.php>`__. You can
 find information on the GNU GPL
-`here <http://www.opensource.org/licenses/LGPL-3.0>`__.
+`here <https://www.opensource.org/licenses/LGPL-3.0>`__.
 
 When you build an image using the Yocto Project, the build process uses
 a known list of licenses to ensure compliance. You can find this list in
@@ -646,11 +646,11 @@ the developer to resolve potential licensing issues.
 
 The base list of licenses used by the build process is a combination of
 the Software Package Data Exchange (SPDX) list and the Open Source
-Initiative (OSI) projects. `SPDX Group <http://spdx.org>`__ is a working
+Initiative (OSI) projects. `SPDX Group <https://spdx.org>`__ is a working
 group of the Linux Foundation that maintains a specification for a
 standard format for communicating the components, licenses, and
 copyrights associated with a software package.
-`OSI <http://opensource.org>`__ is a corporation dedicated to the Open
+`OSI <https://opensource.org>`__ is a corporation dedicated to the Open
 Source Definition and the effort for reviewing and approving licenses
 that conform to the Open Source Definition (OSD).
 
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 980bfe5c2..91451fc04 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -368,7 +368,7 @@ activities using the Yocto Project:
 
 -  *Patchwork:* `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`__
    is a fork of a project originally started by
-   `OzLabs <http://ozlabs.org/>`__. The project is a web-based tracking
+   `OzLabs <https://ozlabs.org/>`__. The project is a web-based tracking
    system designed to streamline the process of bringing contributions
    into a project. The Yocto Project uses Patchwork as an organizational
    tool to handle patches, which number in the thousands for every
@@ -400,7 +400,7 @@ activities using the Yocto Project:
 
    Historically, cross-prelink is a variant of prelink, which was
    conceived by `Jakub
-   Jelínek <http://people.redhat.com/jakub/prelink.pdf>`__ a number of
+   Jelínek <https://people.redhat.com/jakub/prelink.pdf>`__ a number of
    years ago. Both prelink and cross-prelink are maintained in the same
    repository albeit on separate branches. By providing an emulated
    runtime dynamic linker (i.e. ``glibc``-derived ``ld.so`` emulation),
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 0da408443..b401cf904 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -39,7 +39,7 @@ other tools when it seems useful to do so.
 The coverage below details some of the most common ways you'll likely
 want to apply the tool; full documentation can be found either within
 the tool itself or in the man pages at
-`perf(1) <http://linux.die.net/man/1/perf>`__.
+`perf(1) <https://linux.die.net/man/1/perf>`__.
 
 Perf Setup
 ----------
@@ -860,7 +860,7 @@ the right kind of trace data, higher-level profiling-type summaries can
 be derived from it.
 
 Documentation on using the `'perf script' python
-binding <http://linux.die.net/man/1/perf-script-python>`__.
+binding <https://linux.die.net/man/1/perf-script-python>`__.
 
 System-Wide Tracing and Profiling
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -1136,23 +1136,23 @@ Perf Documentation
 Online versions of the man pages for the commands discussed in this
 section can be found here:
 
--  The `'perf stat' manpage <http://linux.die.net/man/1/perf-stat>`__.
+-  The `'perf stat' manpage <https://linux.die.net/man/1/perf-stat>`__.
 
 -  The `'perf record'
-   manpage <http://linux.die.net/man/1/perf-record>`__.
+   manpage <https://linux.die.net/man/1/perf-record>`__.
 
 -  The `'perf report'
-   manpage <http://linux.die.net/man/1/perf-report>`__.
+   manpage <https://linux.die.net/man/1/perf-report>`__.
 
--  The `'perf probe' manpage <http://linux.die.net/man/1/perf-probe>`__.
+-  The `'perf probe' manpage <https://linux.die.net/man/1/perf-probe>`__.
 
 -  The `'perf script'
-   manpage <http://linux.die.net/man/1/perf-script>`__.
+   manpage <https://linux.die.net/man/1/perf-script>`__.
 
 -  Documentation on using the `'perf script' python
-   binding <http://linux.die.net/man/1/perf-script-python>`__.
+   binding <https://linux.die.net/man/1/perf-script-python>`__.
 
--  The top-level `perf(1) manpage <http://linux.die.net/man/1/perf>`__.
+-  The top-level `perf(1) manpage <https://linux.die.net/man/1/perf>`__.
 
 Normally, you should be able to invoke the man pages via perf itself
 e.g. 'perf help' or 'perf help record'.
@@ -1718,7 +1718,7 @@ events':
 
 The tool is pretty self-explanatory, but for more detailed information
 on navigating through the data, see the `kernelshark
-website <http://rostedt.homelinux.com/kernelshark/>`__.
+website <https://rostedt.homelinux.com/kernelshark/>`__.
 
 ftrace Documentation
 --------------------
@@ -1736,19 +1736,19 @@ Documentation directory: ::
 There is a nice series of articles on using ftrace and trace-cmd at LWN:
 
 -  `Debugging the kernel using Ftrace - part
-   1 <http://lwn.net/Articles/365835/>`__
+   1 <https://lwn.net/Articles/365835/>`__
 
 -  `Debugging the kernel using Ftrace - part
-   2 <http://lwn.net/Articles/366796/>`__
+   2 <https://lwn.net/Articles/366796/>`__
 
 -  `Secrets of the Ftrace function
-   tracer <http://lwn.net/Articles/370423/>`__
+   tracer <https://lwn.net/Articles/370423/>`__
 
 -  `trace-cmd: A front-end for
    Ftrace <https://lwn.net/Articles/410200/>`__
 
 There's more detailed documentation kernelshark usage here:
-`KernelShark <http://rostedt.homelinux.com/kernelshark/>`__
+`KernelShark <https://rostedt.homelinux.com/kernelshark/>`__
 
 An amusing yet useful README (a tracing mini-HOWTO) can be found in
 ``/sys/kernel/debug/tracing/README``.
@@ -1763,7 +1763,7 @@ gather/print/aggregate data extracted from the context they end up being
 invoked under.
 
 For example, this probe from the `SystemTap
-tutorial <http://sourceware.org/systemtap/tutorial/>`__ simply prints a
+tutorial <https://sourceware.org/systemtap/tutorial/>`__ simply prints a
 line every time any process on the system open()s a file. For each line,
 it prints the executable name of the program that opened the file, along
 with its PID, and the name of the file it opened (or tried to open),
@@ -1936,11 +1936,11 @@ systemtap Documentation
 -----------------------
 
 The SystemTap language reference can be found here: `SystemTap Language
-Reference <http://sourceware.org/systemtap/langref/>`__
+Reference <https://sourceware.org/systemtap/langref/>`__
 
 Links to other SystemTap documents, tutorials, and examples can be found
 here: `SystemTap documentation
-page <http://sourceware.org/systemtap/documentation.html>`__
+page <https://sourceware.org/systemtap/documentation.html>`__
 
 Sysprof
 =======
@@ -2214,7 +2214,7 @@ developers who are working in a Linux environment and are interested in
 efficient software tracing.
 
 For information on LTTng in general, visit the `LTTng
-Project <http://lttng.org/lttng2.0>`__ site. You can find a "Getting
+Project <https://lttng.org/lttng2.0>`__ site. You can find a "Getting
 Started" link on this site that takes you to an LTTng Quick Start.
 
 blktrace
@@ -2365,7 +2365,7 @@ first part of the filenames: ::
 The report shows each event that was
 found in the blktrace data, along with a summary of the overall block
 I/O traffic during the run. You can look at the
-`blkparse <http://linux.die.net/man/1/blkparse>`__ manpage to learn the
+`blkparse <https://linux.die.net/man/1/blkparse>`__ manpage to learn the
 meaning of each field displayed in the trace listing.
 
 Live Mode
@@ -2564,11 +2564,11 @@ blktrace Documentation
 Online versions of the man pages for the commands discussed in this
 section can be found here:
 
--  http://linux.die.net/man/8/blktrace
+-  https://linux.die.net/man/8/blktrace
 
--  http://linux.die.net/man/1/blkparse
+-  https://linux.die.net/man/1/blkparse
 
--  http://linux.die.net/man/8/btrace
+-  https://linux.die.net/man/8/btrace
 
 The above manpages, along with manpages for the other blktrace utilities
 (btt, blkiomon, etc) can be found in the /doc directory of the blktrace
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5a30ce379..eb8b62702 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -278,7 +278,7 @@ The ``ccache`` class enables the C/C++ Compiler Cache for the build.
 This class is used to give a minor performance boost during the build.
 However, using the class can lead to unexpected side-effects. Thus, it
 is recommended that you do not use this class. See
-http://ccache.samba.org/ for information on the C/C++ Compiler
+https://ccache.samba.org/ for information on the C/C++ Compiler
 Cache.
 
 .. _ref-classes-chrpath:
@@ -2581,7 +2581,7 @@ the :term:`SYSTEMD_BOOT_CFG`,
 :term:`SYSTEMD_BOOT_TIMEOUT` variables.
 
 You can also see the `Systemd-boot
-documentation <http://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__
+documentation <https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__
 for more information.
 
 .. _ref-classes-terminal:
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index f67c53824..34b26ee3e 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -55,9 +55,9 @@ Yocto Project is fairly straightforward.
 **Q:** Are there any products built using the OpenEmbedded build system?
 
 **A:** The software running on the `Vernier
-LabQuest <http://vernier.com/labquest/>`__ is built using the
+LabQuest <https://vernier.com/labquest/>`__ is built using the
 OpenEmbedded build system. See the `Vernier
-LabQuest <http://www.vernier.com/products/interfaces/labq/>`__ website
+LabQuest <https://www.vernier.com/products/interfaces/labq/>`__ website
 for more information. There are a number of pre-production devices using
 the OpenEmbedded build system and the Yocto Project team announces them
 as soon as they are released.
@@ -273,7 +273,7 @@ OpenEmbedded build system to use its internally built toolchain (i.e.
 particular, "external-\*" refers to external toolchains. One example is
 the Sourcery G++ Toolchain. The support for this toolchain resides in
 the separate ``meta-sourcery`` layer at
-http://github.com/MentorEmbedded/meta-sourcery/.
+https://github.com/MentorEmbedded/meta-sourcery/.
 
 In addition to the toolchain configuration, you also need a
 corresponding toolchain recipe file. This recipe file needs to package
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index 5e9374eae..cf5cc1109 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -37,9 +37,9 @@ Following is a list of supported recipes:
    all the pieces required to run builds using the build system as well
    as the build system itself. You can boot and run the image using
    either the `VMware
-   Player <http://www.vmware.com/products/player/overview.html>`__ or
+   Player <https://www.vmware.com/products/player/overview.html>`__ or
    `VMware
-   Workstation <http://www.vmware.com/products/workstation/overview.html>`__.
+   Workstation <https://www.vmware.com/products/workstation/overview.html>`__.
    For more information on this image, see the :yocto_home:`Build
    Appliance </software-item/build-appliance>` page
    on the Yocto Project website.
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index bb9c0460f..472820f16 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -24,7 +24,7 @@ The information lists the commands, their syntax, and meanings.
 Kickstart commands are based on the Fedora kickstart versions but with
 modifications to reflect Wic capabilities. You can see the original
 documentation for those commands at the following link:
-http://pykickstart.readthedocs.io/en/latest/kickstart-docs.html
+https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html
 
 Command: part or partition
 ==========================
@@ -164,7 +164,7 @@ the ``part`` and ``partition`` commands:
 -  ``--part-type``: This option is a Wic-specific option that
    specifies the partition type globally unique identifier (GUID) for
    GPT partitions. You can find the list of partition type GUIDs at
-   http://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs.
+   https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs.
 
 -  ``--use-uuid``: This option is a Wic-specific option that causes
    Wic to generate a random GUID for the partition. The generated
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index e8b3ada26..861d04861 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -89,7 +89,7 @@ package-specific nesting should be done by the package itself. Finally,
 having ``libexecdir`` change between recipes makes it very difficult for
 different recipes to invoke binaries that have been installed into
 ``libexecdir``. The Filesystem Hierarchy Standard (i.e.
-http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html) now
+https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html) now
 recognizes the use of ``${prefix}/libexec/``, giving distributions the
 choice between ``${prefix}/lib`` or ``${prefix}/libexec`` without
 breaking FHS.
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index 57ff011e7..23879d6b5 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -274,7 +274,7 @@ The following package management changes took place:
    fixed.
 
    For more information, see the `DNF
-   Documentation <http://dnf.readthedocs.io/en/latest/>`__.
+   Documentation <https://dnf.readthedocs.io/en/latest/>`__.
 
 -  Rpm 5.x is replaced with Rpm 4.x. This is done for two major reasons:
 
diff --git a/documentation/ref-manual/migration-2.7.rst b/documentation/ref-manual/migration-2.7.rst
index 7e628fc3e..5af5947ff 100644
--- a/documentation/ref-manual/migration-2.7.rst
+++ b/documentation/ref-manual/migration-2.7.rst
@@ -159,7 +159,7 @@ The following miscellaneous changes occurred:
    from the top-level ``scripts`` directory.
 
 -  Perl now builds for the target using
-   `perl-cross <http://arsv.github.io/perl-cross/>`_ for better
+   `perl-cross <https://arsv.github.io/perl-cross/>`_ for better
    maintainability and improved build performance. This change should
    not present any problems unless you have heavily customized your Perl
    recipe.
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 54977dcb2..6cb767d93 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -227,7 +227,7 @@ Errors and Warnings
       CFLAGS_append = " -fPIC "
 
    For more information on text relocations at runtime, see
-   http://www.akkadia.org/drepper/textrelocs.html.
+   https://www.akkadia.org/drepper/textrelocs.html.
 
     
 .. _qa-check-ldflags:
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 2c49c4e87..7554164d1 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -52,7 +52,7 @@ against the Yocto Project, see the following:
 
 -  The Yocto Project :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
 
-For information on Bugzilla in general, see http://www.bugzilla.org/about/.
+For information on Bugzilla in general, see https://www.bugzilla.org/about/.
 
 .. _resources-mailinglist:
 
@@ -193,5 +193,5 @@ Here is a list of resources you might find helpful:
    available for Yocto Project and Poky discussions: ``#yocto`` and
    ``#poky``, respectively.
 
--  `Quick EMUlator (QEMU) <http://wiki.qemu.org/Index.html>`__\ *:* An
+-  `Quick EMUlator (QEMU) <https://wiki.qemu.org/Index.html>`__\ *:* An
    open-source machine emulator and virtualizer.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8c6cc46b6..44e075ca4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2648,7 +2648,7 @@ system and gives an overview of their function and contents.
          GROUPADD_PARAM_${PN} = "-r netdev"
 
       For information on the standard Linux shell command
-      ``groupadd``, see http://linux.die.net/man/8/groupadd.
+      ``groupadd``, see https://linux.die.net/man/8/groupadd.
 
    :term:`GROUPMEMS_PARAM`
       When inheriting the :ref:`useradd <ref-classes-useradd>` class,
@@ -2657,7 +2657,7 @@ system and gives an overview of their function and contents.
       of a group when the package is installed.
 
       For information on the standard Linux shell command ``groupmems``,
-      see http://linux.die.net/man/8/groupmems.
+      see https://linux.die.net/man/8/groupmems.
 
    :term:`GRUB_GFXSERIAL`
       Configures the GNU GRand Unified Bootloader (GRUB) to have graphics
@@ -4679,7 +4679,7 @@ system and gives an overview of their function and contents.
       See the :term:`KERNEL_MODULE_AUTOLOAD` variable for more information.
 
    module_conf
-      Specifies `modprobe.d <http://linux.die.net/man/5/modprobe.d>`_
+      Specifies `modprobe.d <https://linux.die.net/man/5/modprobe.d>`_
       syntax lines for inclusion in the ``/etc/modprobe.d/modname.conf``
       file.
 
@@ -7604,7 +7604,7 @@ system and gives an overview of their function and contents.
          SYSTEMD_BOOT_CFG ?= "${:term:`S`}/loader.conf"
 
       For information on Systemd-boot, see the `Systemd-boot
-      documentation <http://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
+      documentation <https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
 
    :term:`SYSTEMD_BOOT_ENTRIES`
       When :term:`EFI_PROVIDER` is set to
@@ -7618,7 +7618,7 @@ system and gives an overview of their function and contents.
           SYSTEMD_BOOT_ENTRIES ?= ""
 
       For information on Systemd-boot, see the `Systemd-boot
-      documentation <http://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
+      documentation <https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
 
    :term:`SYSTEMD_BOOT_TIMEOUT`
       When :term:`EFI_PROVIDER` is set to
@@ -7631,7 +7631,7 @@ system and gives an overview of their function and contents.
          SYSTEMD_BOOT_TIMEOUT ?= "10"
 
       For information on Systemd-boot, see the `Systemd-boot
-      documentation <http://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
+      documentation <https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
 
    :term:`SYSTEMD_PACKAGES`
       When inheriting the :ref:`systemd <ref-classes-systemd>` class,
@@ -7662,7 +7662,7 @@ system and gives an overview of their function and contents.
       When using
       :ref:`SysVinit <dev-manual/common-tasks:enabling system services>`,
       specifies a space-separated list of the virtual terminals that should
-      run a `getty <http://en.wikipedia.org/wiki/Getty_%28Unix%29>`__
+      run a `getty <https://en.wikipedia.org/wiki/Getty_%28Unix%29>`__
       (allowing login), assuming :term:`USE_VT` is not set to
       "0".
 
@@ -7886,7 +7886,7 @@ system and gives an overview of their function and contents.
       toolchain. One example is the Sourcery G++ Toolchain. The support for
       this toolchain resides in the separate Mentor Graphics
       ``meta-sourcery`` layer at
-      http://github.com/MentorEmbedded/meta-sourcery/.
+      https://github.com/MentorEmbedded/meta-sourcery/.
 
       The layer's ``README`` file contains information on how to use the
       Sourcery G++ Toolchain as an external toolchain. In summary, you must
@@ -8562,7 +8562,7 @@ system and gives an overview of their function and contents.
       When using
       :ref:`SysVinit <dev-manual/common-tasks:enabling system services>`,
       determines whether or not to run a
-      `getty <http://en.wikipedia.org/wiki/Getty_%28Unix%29>`__ on any
+      `getty <https://en.wikipedia.org/wiki/Getty_%28Unix%29>`__ on any
       virtual terminals in order to enable logging in through those
       terminals.
 
@@ -8673,7 +8673,7 @@ system and gives an overview of their function and contents.
 
       For information on the
       standard Linux shell command ``useradd``, see
-      http://linux.die.net/man/8/useradd.
+      https://linux.die.net/man/8/useradd.
 
    :term:`USERADD_UID_TABLES`
       Specifies a password file to use for obtaining static user
diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 66b12cdff..e4b9b05ba 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -210,7 +210,7 @@ You just need to follow these general steps:
 3. *Develop and Test your Application:* At this point, you have the
    tools to develop your application. If you need to separately install
    and use the QEMU emulator, you can go to `QEMU Home
-   Page <http://wiki.qemu.org/Main_Page>`__ to download and learn about
+   Page <https://wiki.qemu.org/Main_Page>`__ to download and learn about
    the emulator. See the ":doc:`/dev-manual/qemu`" chapter in the
    Yocto Project Development Tasks Manual for information on using QEMU
    within the Yocto Project.
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 34a1f39cf..d2ab14c8e 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -29,7 +29,7 @@ layer index's web application at :yocto_git:`/layerindex-web/`.
 
 When you tie a layer source into Toaster, it can query the layer source
 through a
-`REST <http://en.wikipedia.org/wiki/Representational_state_transfer>`__
+`REST <https://en.wikipedia.org/wiki/Representational_state_transfer>`__
 API, store the information about the layers in the Toaster database, and
 then show the information to users. Users are then able to view that
 information and build layers from Toaster itself without worrying about
@@ -370,7 +370,7 @@ Remote Toaster Monitoring
 Toaster has an API that allows remote management applications to
 directly query the state of the Toaster server and its builds in a
 machine-to-machine manner. This API uses the
-`REST <http://en.wikipedia.org/wiki/Representational_state_transfer>`__
+`REST <https://en.wikipedia.org/wiki/Representational_state_transfer>`__
 interface and the transfer of JSON files. For example, you might monitor
 a build inside a container through well supported known HTTP ports in
 order to easily access a Toaster server inside the container. In this
-- 
2.26.2

