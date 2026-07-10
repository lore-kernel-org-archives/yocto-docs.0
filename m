Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD68C44509
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:47:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.609.1783694836094025938
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 07:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vL85uBA3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 731001A0F42
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4793F60342
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D87611BD1743;
	Fri, 10 Jul 2026 16:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783694833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8VmVoJUKUk++1YiTFSVRIAo7FVvKfqUlvZNNqXZ33QA=;
	b=vL85uBA36izQgvb0K57lpbHgMxj+5GOo2+HeGab27D8FTfpyfsDMF4cRBb6W+auKsB3sRq
	7qulrogwleq0qOWpTnhbNkvabhcwPpTMXn1FLVnaj38jGHvzwbg8P90cA9Bt/ZoIWKzkWC
	FHyrp89uVSfSlXwsvjvCyC6cmz5i6NfgljOzhqlC117SwN4gDAvKPkshNrzqrPSZdo8wxD
	IOSnkTwl2NA3MJqOeqU/tAkQbKU2oEDKkNJ9Q+SmyJuRbudtWrXGCKmm6+SN3WoPc0N/PQ
	+Vx+6+mHVPQTdG4f7iIcylTMuoRg77+nygvaSDKwIAgMJIx1zZ3NlOX7CnlCLw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 16:46:55 +0200
Subject: [PATCH 8/8] docs-wide: fix various broken links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-linkcheck-v1-8-999168371d5e@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
In-Reply-To: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13164;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ReWQCsT9Xl3qQbaaLAEWD8KSl7xfaC3bLB17EvhBDuY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUQXrHXvgFWpMg5rg5WNPd4JnWSJC9QmCLOvuD
 4Z0LCiJ0CqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalEF6wAKCRDRgEFAKaOo
 NjTsD/9QqYl3R4C42jpHrisCsR+Wl9e7RQN35WI2BuTUwGiFEFQ2J3FPZp2j6xfd2UExDC67lQ9
 BiNeyItG9jASSPuAgUrqzn7Vju9HwrVKI07HPjVGL9dRWSLShOyjf/HUw9b4yltgbGlzyHNkvC7
 1TJb+BQ8d9BeqXPy8f6TJUvksEhcMPCmuH2KPeFX05qBZ8tCwtADxpKxPCaRD1n35dSGEkbznyD
 Qpqk5Gc83gPyos4+E+SIPVzzsoMru0AOB09CQFE9bXAPFivP0P8lsx9PThNsyTQp5MU2pJoDE8M
 R528itIFQg1hLBdjg55Q8ZdfABEnJDMr8S3uiuzzBIjLBcxduXG1nrB9gPW1M0kaX1DEVI+mLYX
 t9JOMMftMp4MPX4uHMi6rLpAmf6FApwgA/PCII9A7NJ5jnBBtBdSrzEH3p5TiJYhf1H5ob82H2N
 ThHAIer7hYIJXbDySnje/E/8tmm6hfif3ADAWFgAzqkV7RJKLY7V8P2NdttIId6z1lmbfvkaTxc
 g9H5u6TIw7WzoCySegjOATjcSRGIhltxmKH2OkfLpt5ObicYkNuadLbCUkICaavjoHFlpiqVZxF
 ag0gcXddUjzGEx9sGiLCg0T75uDnDZqFoyY54avTWz3MO0BcFBFqC9EDQoeYjxLOBayFmfqn3g8
 O3omGRcRZkekosA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10064

Fix various broken links found using the linkcheck builder, in various
places of the documentation. For most, the replacing link is the
equivalent new link.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst            |  2 +-
 documentation/dev-manual/start.rst                 |  2 +-
 documentation/dev-manual/x32-psabi.rst             |  4 +--
 .../migration-guides/release-notes-5.3.rst         |  2 +-
 .../overview-manual/development-environment.rst    |  4 +--
 documentation/profile-manual/usage.rst             | 38 ++++++++++------------
 documentation/ref-manual/classes.rst               |  4 +--
 documentation/ref-manual/variables.rst             |  8 ++---
 .../yocto-project-supported-features.rst           |  2 +-
 9 files changed, 31 insertions(+), 35 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 5f42dd4df..6888bb46a 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -837,7 +837,7 @@ different ways:
 -  *systemd:* System Management Daemon (systemd) was designed to replace
    SysVinit and to provide enhanced management of services. For more
    information on systemd, see the systemd homepage at
-   https://freedesktop.org/wiki/Software/systemd/.
+   https://systemd.io/.
 
    To enable a service using systemd, your recipe needs to inherit the
    :ref:`ref-classes-systemd` class. See the ``systemd.bbclass`` file
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 4ea27fceb..8fa7f8f38 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -367,7 +367,7 @@ as your Yocto Project build host:
    Depending on your build host, you might have to install different
    software to support Docker containers. Go to the Docker installation
    page and read about the platform requirements in "`Supported
-   Platforms <https://docs.docker.com/engine/install/#supported-platforms>`__"
+   Platforms <https://docs.docker.com/engine/install/#installation-procedures-for-supported-platforms>`__"
    your build host needs to run containers.
 
 #. *Choose What To Install:* Depending on whether or not your build host
diff --git a/documentation/dev-manual/x32-psabi.rst b/documentation/dev-manual/x32-psabi.rst
index 92b1f96fa..0a19d2823 100644
--- a/documentation/dev-manual/x32-psabi.rst
+++ b/documentation/dev-manual/x32-psabi.rst
@@ -3,8 +3,8 @@
 Using x32 psABI
 ***************
 
-x32 processor-specific Application Binary Interface (`x32
-psABI <https://software.intel.com/en-us/node/628948>`__) is a native
+x32 processor-specific Application Binary Interface (:wikipedia:`x32
+psABI <X32_ABI>`) is a native
 32-bit processor-specific ABI for Intel 64 (x86-64) architectures. An
 ABI defines the calling conventions between functions in a processing
 environment. The interface determines what registers are used and what
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index 1655ca90f..fdc092e51 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -561,7 +561,7 @@ New Features / Enhancements in |yocto-ver|
       :term:`IMAGE_EXTRA_PARTITION_FILES` variable for more information.
 
    -  The ``--diskid`` option was added to allow passing a :wikipedia:`MS-DOS
-      </MS-DOS>` or :wikipedia:`GPT <GUID_Partition_Table>`-formatted
+      <MS-DOS>` or :wikipedia:`GPT <GUID_Partition_Table>`-formatted
       disk IDs for a partition (for example: ``deadbeef-cafe-babe-f00d-cec2ea4eface``).
 
 -  SDK-related changes:
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index e1bb8b15d..0daaf1c1a 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -350,7 +350,7 @@ commands.
 .. note::
 
    -  For more information on Git, see
-      https://git-scm.com/documentation.
+      https://git-scm.com/docs.
 
    -  If you need to download Git, it is recommended that you add Git to
       your system through your distribution's "software store" (e.g. for
@@ -474,7 +474,7 @@ you can manage with a small set of basic operations and workflows once
 you understand the basic philosophy behind Git. You do not have to be an
 expert in Git to be functional. A good place to look for instruction on
 a minimal set of Git commands is
-`here <https://git-scm.com/documentation>`__.
+`here <https://git-scm.com/docs>`__.
 
 The following list of Git commands briefly describes some basic Git
 operations as a way to get started. As with any set of commands, this
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index d17b256d0..f8de6848e 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -39,7 +39,7 @@ other tools when it seems useful to do so.
 The coverage below details some of the most common ways you'll likely
 want to apply the tool; full documentation can be found either within
 the tool itself or in the manual pages at
-`perf(1) <https://linux.die.net/man/1/perf>`__.
+:manpage:`perf(1)`.
 
 perf Setup
 ----------
@@ -869,8 +869,8 @@ goes a little way to support the idea mentioned previously that given
 the right kind of trace data, higher-level profiling-type summaries can
 be derived from it.
 
-Documentation on using the `'perf script' Python
-binding <https://linux.die.net/man/1/perf-script-python>`__.
+Documentation on using the :manpage:`'perf script' Python
+binding <perf-script-python(1)>`.
 
 System-Wide Tracing and Profiling
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -1150,23 +1150,19 @@ perf Documentation
 Online versions of the manual pages for the commands discussed in this
 section can be found here:
 
--  The `'perf stat' manual page <https://linux.die.net/man/1/perf-stat>`__.
+-  The :manpage:`'perf stat' manual page <perf-stat(1)>`.
 
--  The `'perf record'
-   manual page <https://linux.die.net/man/1/perf-record>`__.
+-  The :manpage:`'perf record' manual page <perf-record(1)>`.
 
--  The `'perf report'
-   manual page <https://linux.die.net/man/1/perf-report>`__.
+-  The :manpage:`'perf report' manual page <perf-report(1)>`.
 
--  The `'perf probe' manual page <https://linux.die.net/man/1/perf-probe>`__.
+-  The :manpage:`'perf probe' manual page <perf-probe(1)>`.
 
--  The `'perf script'
-   manual page <https://linux.die.net/man/1/perf-script>`__.
+-  The :manpage:`'perf script' manual page <perf-script(1)>`.
 
--  Documentation on using the `'perf script' Python
-   binding <https://linux.die.net/man/1/perf-script-python>`__.
+-  Documentation on using the :manpage:`'perf script' Python binding <perf-script-python(1)>`.
 
--  The top-level `perf(1) manual page <https://linux.die.net/man/1/perf>`__.
+-  The top-level :manpage:`perf(1) manual page <perf(1)>`.
 
 Normally, you should be able to open the manual pages via perf itself
 e.g. ``perf help`` or ``perf help record``.
@@ -1781,7 +1777,7 @@ gather / print / aggregate data extracted from the context they end up being
 called under.
 
 For example, this probe from the `SystemTap
-tutorial <https://sourceware.org/systemtap/tutorial/>`__ just prints a
+tutorial <https://sourceware.org/systemtap/tutorial.html>`__ just prints a
 line every time any process on the system runs ``open()`` on a file. For each line,
 it prints the executable name of the program that opened the file, along
 with its PID, and the name of the file it opened (or tried to open), which it
@@ -1957,7 +1953,7 @@ SystemTap Documentation
 -----------------------
 
 The SystemTap language reference can be found here: `SystemTap Language
-Reference <https://sourceware.org/systemtap/langref/>`__
+Reference <https://sourceware.org/systemtap/langref.html>`__
 
 Links to other SystemTap documents, tutorials, and examples can be found
 here: `SystemTap documentation
@@ -2388,7 +2384,7 @@ first part of the filenames::
 The report shows each event that was
 found in the blktrace data, along with a summary of the overall block
 I/O traffic during the run. You can look at the
-`blkparse <https://linux.die.net/man/1/blkparse>`__ manual page to learn the
+:manpage:`blkparse(1)` manual page to learn the
 meaning of each field displayed in the trace listing.
 
 Live Mode
@@ -2588,14 +2584,14 @@ blktrace Documentation
 Online versions of the manual pages for the commands discussed in this
 section can be found here:
 
--  https://linux.die.net/man/8/blktrace
+-  :manpage:`blktrace(8)`
 
--  https://linux.die.net/man/1/blkparse
+-  :manpage:`blkparse(1)`
 
--  https://linux.die.net/man/8/btrace
+-  :manpage:`btrace(8)`
 
 The above manual pages, along with manuals for the other blktrace utilities
 (``btt``, ``blkiomon``, etc) can be found in the ``/doc`` directory of the blktrace
 tools git repository::
 
-   $ git clone git://git.kernel.dk/blktrace.git
+   $ git clone https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 02ff36178..2622be14f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2844,7 +2844,7 @@ Python version 3.x extensions that use build systems based on ``setuptools``
 ``pyproject.toml`` format). Unlike :ref:`ref-classes-setuptools3`,
 this uses the traditional ``setup.py`` ``build`` and ``install`` commands and
 not wheels. This use of ``setuptools`` like this is
-`deprecated <https://github.com/pypa/setuptools/blob/main/CHANGES.rst#v5830>`__
+`deprecated <https://github.com/pypa/setuptools/blob/14cc4452199818e60cf01cd9cea96e90761abce7/NEWS.rst#v5830>`__
 but still relatively common.
 
 .. _ref-classes-setuptools3-base:
@@ -3100,7 +3100,7 @@ the :term:`SYSTEMD_BOOT_CFG`,
 :term:`SYSTEMD_BOOT_TIMEOUT` variables.
 
 You can also see the `Systemd-boot
-documentation <https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__
+documentation <https://systemd.io/BOOT/>`__
 for more information.
 
 .. _ref-classes-terminal:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 12d2e335c..c1abd8693 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3786,7 +3786,7 @@ system and gives an overview of their function and contents.
             source $loadaddr#bootscr-boot.cmd
 
       More information can be found in the official U-Boot documentation:
-      `U-Boot source command <https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image.f>`__
+      `U-Boot source command <https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image>`__
 
    :term:`FONT_EXTRA_RDEPENDS`
       When inheriting the :ref:`ref-classes-fontcache` class,
@@ -3953,7 +3953,7 @@ system and gives an overview of their function and contents.
          GROUPADD_PARAM:${PN} = "-g 880 group1; -g 890 group2"
 
       For information on the standard Linux shell command
-      ``groupadd``, see https://linux.die.net/man/8/groupadd.
+      ``groupadd``, see :manpage:`groupadd(8)`.
 
    :term:`GROUPMEMS_PARAM`
       Deprecated in favor of :term:`USERMOD_PARAMS`. See
@@ -6436,7 +6436,7 @@ system and gives an overview of their function and contents.
       See the :term:`KERNEL_MODULE_AUTOLOAD` variable for more information.
 
    :term:`module_conf`
-      Specifies `modprobe.d <https://linux.die.net/man/5/modprobe.d>`__
+      Specifies :manpage:`modprobe.d(5)`
       syntax lines for inclusion in the ``/etc/modprobe.d/modname.conf``
       file.
 
@@ -12333,7 +12333,7 @@ system and gives an overview of their function and contents.
 
       For information on the
       standard Linux shell command ``useradd``, see
-      https://linux.die.net/man/8/useradd.
+      :manpage:`useradd(8)`.
 
    :term:`USERADD_UID_TABLES`
       Specifies a password file to use for obtaining static user
diff --git a/documentation/ref-manual/yocto-project-supported-features.rst b/documentation/ref-manual/yocto-project-supported-features.rst
index 021fca36b..d7229f1c2 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -72,7 +72,7 @@ Below is a list of primary tested features, their maintainer(s) and builder(s):
      - Buildtools generation
      - Collective effort
      - buildtools
-   * - `meta-agl-core <https://gerrit.automotivelinux.org/gerrit/AGL/meta-agl>`__
+   * - `meta-agl-core <https://git.automotivelinux.org/AGL/meta-agl/>`__
      - meta-agl-core layer testing
      - TBD
      - meta-agl-core

-- 
2.54.0


