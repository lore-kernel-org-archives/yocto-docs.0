Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EBCC433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 18:24:45 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.11468.1645986283321283369
 for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 10:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=DNLS4khZ;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645986283;
  x=1677522283;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EZdsXcOLgPn33j9E89xXIvn3miqt3YjbV13tpdJgNi8=;
  b=DNLS4khZD5ufGyRDpsxtRYOW9qTYJOlNdpSxd7QjBuU/3N57+6AS9UG4
   tUSnllgzOnbq9JYlw0RoTNxaja4+Kpr+OzZgGGUimVbEa5Qqr6GYBYw2W
   Yn3qOJ+uCWWqxyU6QzuCbq+Vlv/j4wwmu41sqGYUc0fhFpuzBp3hw20eL
   1tWzD9K7MZMQR5Le5XvrjohUuyjMqvBwVbUJTgZ5WqAQbCRZjZPYeOuSR
   WJXDwVwDRTipOo15wBU4+n7LNQ8nqfHhfAm/GpF9LbYTsVthLp+tRRk0k
   LzyhIuWWzZ1sUe22qiedhUcJZDp8sGd8Jyfj1F7L6iJpPKTTls9ybNSnW
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] manuals: Update LICENSE vars in examples to use SPDX license
 identifiers
Date: Sun, 27 Feb 2022 19:24:35 +0100
Message-ID: <20220227182435.6239-1-peter.kjellerstedt@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 27 Feb 2022 18:24:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2503

This is similar to the recent change in meta to only use SPDX license
identifiers in the recipes.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/dev-manual/common-tasks.rst |  8 ++++----
 documentation/ref-manual/variables.rst    | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index c111355ccd..cfa81176c3 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -564,7 +564,7 @@ Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
    SUMMARY = "X.Org X server configuration file"
    HOMEPAGE = "http://www.x.org"
    SECTION = "x11/base"
-   LICENSE = "MIT-X"
+   LICENSE = "MIT"
    LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
    PR = "r33"
 
@@ -1543,7 +1543,7 @@ variables:
    given a piece of software licensed under the GNU General Public
    License version 2, you would set :term:`LICENSE` as follows::
 
-      LICENSE = "GPLv2"
+      LICENSE = "GPL-2.0-only"
 
    The licenses you specify within :term:`LICENSE` can have any name as long
    as you do not use spaces, since spaces are used as separators between
@@ -2338,7 +2338,7 @@ Following is one example: (``hello_2.3.bb``)
 
    SUMMARY = "GNU Helloworld application"
    SECTION = "examples"
-   LICENSE = "GPLv2+"
+   LICENSE = "GPL-2.0-or-later"
    LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
    SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.gz"
@@ -2378,7 +2378,7 @@ In the following example, ``mtd-utils`` is a makefile-based package::
    SECTION = "base"
    DEPENDS = "zlib lzo e2fsprogs util-linux"
    HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-   LICENSE = "GPLv2+"
+   LICENSE = "GPL-2.0-or-later"
    LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
        file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ecb2b60c73..1621e5419e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4348,9 +4348,9 @@ system and gives an overview of their function and contents.
 
       Here are some examples::
 
-         LICENSE = "LGPLv2.1 | GPLv3"
-         LICENSE = "MPL-1 & LGPLv2.1"
-         LICENSE = "GPLv2+"
+         LICENSE = "LGPL-2.1-only | GPL-3.0-only"
+         LICENSE = "MPL-1.0 & LGPL-2.1-only"
+         LICENSE = "GPL-2.0-or-later"
 
       The first example is from the
       recipes for Qt, which the user may choose to distribute under either
@@ -4365,8 +4365,8 @@ system and gives an overview of their function and contents.
       but has accompanying documentation licensed under the GNU Free
       Documentation License 1.2 could be specified as follows::
 
-         LICENSE = "GFDL-1.2 & GPLv2"
-         LICENSE:${PN} = "GPLv2"
+         LICENSE = "GFDL-1.2 & GPL-2.0-only"
+         LICENSE:${PN} = "GPL-2.0.only"
          LICENSE:${PN}-doc = "GFDL-1.2"
 
    :term:`LICENSE_CREATE_PACKAGE`

