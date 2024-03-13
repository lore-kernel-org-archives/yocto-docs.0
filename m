Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC328C54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:12:16 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.1470.1710349931668521130
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 10:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=my6dRl7K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D044740006;
	Wed, 13 Mar 2024 17:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710349930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6QhbE8xzgY8ru2fDbbVDtJqGy9NVvFVvH+YHtbYrjI=;
	b=my6dRl7KPKrlnilrUrE9UPvloQ5jPXSgs9CcIxOh6fESf+FSeEVi633nZ263jkdfa2chly
	RSWvwQ92Ar2xpMwlofiztyVyEtEpGnbGOPPR1hfcRyfY1mjmVQOL+vfYTB2z3RFL0zd/br
	DV83DhwXRsCF94ZIFVajKzYKTmkcXxspHDq6GJssLvzHoZymJv4ThteLxkxHfnuOu9qJUZ
	6siV09KtjLlpXkg0ECrXFNOn/DbZuk8zXHmmuDH+8mnQ0h5NXMAawrM88Yobgi3k9IMLPi
	Z/yLv3nEkrRN1ijRA0yxsZVZsKaq9sRq1+5gK/YBDjOxdsxbDQa3rpXbPC0D5Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/3] manuals: use "manual page(s)"
Date: Wed, 13 Mar 2024 18:11:54 +0100
Message-Id: <20240313171155.64710-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313171155.64710-1-michael.opdenacker@bootlin.com>
References: <20240313171155.64710-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 17:12:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4957

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Instead of "manpage(s)" or "man page(s)".
To address one of the errors reported by "make stylecheck"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 28 +++++++++++++-------------
 documentation/ref-manual/classes.rst   |  2 +-
 documentation/ref-manual/variables.rst |  2 +-
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index bd45dc2137..768349512a 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -38,7 +38,7 @@ other tools when it seems useful to do so.
 
 The coverage below details some of the most common ways you'll likely
 want to apply the tool; full documentation can be found either within
-the tool itself or in the man pages at
+the tool itself or in the manual pages at
 `perf(1) <https://linux.die.net/man/1/perf>`__.
 
 Perf Setup
@@ -1147,37 +1147,37 @@ callgraphs from starting a few programs during those 30 seconds:
 Perf Documentation
 ------------------
 
-Online versions of the man pages for the commands discussed in this
+Online versions of the manual pages for the commands discussed in this
 section can be found here:
 
--  The `'perf stat' manpage <https://linux.die.net/man/1/perf-stat>`__.
+-  The `'perf stat' manual page <https://linux.die.net/man/1/perf-stat>`__.
 
 -  The `'perf record'
-   manpage <https://linux.die.net/man/1/perf-record>`__.
+   manual page <https://linux.die.net/man/1/perf-record>`__.
 
 -  The `'perf report'
-   manpage <https://linux.die.net/man/1/perf-report>`__.
+   manual page <https://linux.die.net/man/1/perf-report>`__.
 
--  The `'perf probe' manpage <https://linux.die.net/man/1/perf-probe>`__.
+-  The `'perf probe' manual page <https://linux.die.net/man/1/perf-probe>`__.
 
 -  The `'perf script'
-   manpage <https://linux.die.net/man/1/perf-script>`__.
+   manual page <https://linux.die.net/man/1/perf-script>`__.
 
 -  Documentation on using the `'perf script' Python
    binding <https://linux.die.net/man/1/perf-script-python>`__.
 
--  The top-level `perf(1) manpage <https://linux.die.net/man/1/perf>`__.
+-  The top-level `perf(1) manual page <https://linux.die.net/man/1/perf>`__.
 
-Normally, you should be able to invoke the man pages via perf itself
+Normally, you should be able to invoke the manual pages via perf itself
 e.g. ``perf help`` or ``perf help record``.
 
-To have the perf manpages installed on your target, modify your
+To have the perf manual pages installed on your target, modify your
 configuration as follows::
 
    IMAGE_INSTALL:append = " perf perf-doc"
    DISTRO_FEATURES:append = " api-documentation"
 
-The man pages in text form, along with some other files, such as a set
+The manual pages in text form, along with some other files, such as a set
 of examples, can also be found in the ``perf`` directory of the kernel tree::
 
    tools/perf/Documentation
@@ -2391,7 +2391,7 @@ first part of the filenames::
 The report shows each event that was
 found in the blktrace data, along with a summary of the overall block
 I/O traffic during the run. You can look at the
-`blkparse <https://linux.die.net/man/1/blkparse>`__ manpage to learn the
+`blkparse <https://linux.die.net/man/1/blkparse>`__ manual page to learn the
 meaning of each field displayed in the trace listing.
 
 Live Mode
@@ -2588,7 +2588,7 @@ And this turns off tracing for the specified device::
 blktrace Documentation
 ----------------------
 
-Online versions of the man pages for the commands discussed in this
+Online versions of the manual pages for the commands discussed in this
 section can be found here:
 
 -  https://linux.die.net/man/8/blktrace
@@ -2597,7 +2597,7 @@ section can be found here:
 
 -  https://linux.die.net/man/8/btrace
 
-The above manpages, along with manuals for the other blktrace utilities
+The above manual pages, along with manuals for the other blktrace utilities
 (btt, blkiomon, etc) can be found in the ``/doc`` directory of the blktrace
 tools git repo::
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 412dc5ca2f..ab71cbe40c 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -421,7 +421,7 @@ and BusyBox. It could have been called "kconfig" too.
 ``compress_doc``
 ================
 
-Enables compression for man pages and info pages. This class is intended
+Enables compression for manual and info pages. This class is intended
 to be inherited globally. The default compression mechanism is gz (gzip)
 but you can select an alternative mechanism by setting the
 :term:`DOC_COMPRESS` variable.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6e66dc7358..4571f2522c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2292,7 +2292,7 @@ system and gives an overview of their function and contents.
    :term:`DOC_COMPRESS`
       When inheriting the :ref:`ref-classes-compress_doc`
       class, this variable sets the compression policy used when the
-      OpenEmbedded build system compresses man pages and info pages. By
+      OpenEmbedded build system compresses manual and info pages. By
       default, the compression method used is gz (gzip). Other policies
       available are xz and bz2.
 
-- 
2.34.1


