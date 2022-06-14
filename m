Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032FDC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 18:30:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.484.1655231406036848856
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 11:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dNWFe1Y/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0B101C000A;
	Tue, 14 Jun 2022 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655231404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SPTcr66JqNYWBejLoAf9SrEHEGWlPxOAaW9BgLE1+nw=;
	b=dNWFe1Y/wQYCGjGyIUeYXxz+yBZ+E7FFdJSHNLRzv8H/KDauYbpvF3yWJ4j+DOG4f+8qWT
	GAXVKup03J6IhknhLAc9KjttKg0S04sERbrYnSa/kHQyZKNIkchMZG2bV1X1hzl8LhY3Ox
	S0vrSzHemubUmIvf5ydj1yrYf3fyoVd3XAHDc6yQ6oEJA6kq7wnpVFXPpPdQjYIZVonBt0
	v9kb76I70jHmnRQ0JBCe5NOTXl7oB1v9iYqFBPeCrvR6QeNv8ngFKO4EAL2G7HjchozzEo
	QC7NBEpSFPhcXAmDgBu/t4NzujcxkEOyVa/Fw2Pfui4uPBNf9Y0YSE368j+EQw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: update host tool requirements
Date: Tue, 14 Jun 2022 20:30:01 +0200
Message-Id: <20220614183001.1074666-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jun 2022 18:30:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2999

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As enforced by meta/classes/sanity.bbclass:
- at least GNU make 4.0
- at least GNU tar 7.5 (instead of 5.0)

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     | 3 ++-
 documentation/dev-manual/start.rst               | 6 ++++--
 documentation/migration-guides/migration-1.5.rst | 2 +-
 documentation/migration-guides/migration-1.7.rst | 2 +-
 documentation/migration-guides/migration-2.1.rst | 2 +-
 documentation/migration-guides/migration-3.3.rst | 2 +-
 documentation/poky.yaml.in                       | 3 ++-
 documentation/ref-manual/faq.rst                 | 2 +-
 documentation/ref-manual/system-requirements.rst | 6 ++++--
 9 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7179f25022..4d5ac85e61 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -64,11 +64,12 @@ following requirements:
    -  tar &MIN_TAR_VERSION; or greater
    -  Python &MIN_PYTHON_VERSION; or greater.
    -  gcc &MIN_GCC_VERSION; or greater.
+   -  GNU make &MIN_MAKE_VERSION; or greater
 
 If your build host does not meet any of these three listed version
 requirements, you can take steps to prepare the system so that you
 can still use the Yocto Project. See the
-:ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
+:ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
 section in the Yocto Project Reference Manual for information.
 
 Build Host Packages
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 8cf3ebe316..499c3f8394 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -311,7 +311,7 @@ Project Build Host:
 
 3. *Meet Minimal Version Requirements:* The OpenEmbedded build system
    should be able to run on any modern distribution that has the
-   following versions for Git, tar, Python and gcc.
+   following versions for Git, tar, Python, gcc and make.
 
    -  Git &MIN_GIT_VERSION; or greater
 
@@ -321,10 +321,12 @@ Project Build Host:
 
    -  gcc &MIN_GCC_VERSION; or greater.
 
+   -  GNU make &MIN_MAKE_VERSION; or greater
+
    If your build host does not meet any of these listed version
    requirements, you can take steps to prepare the system so that you
    can still use the Yocto Project. See the
-   ":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
+   ":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
    section in the Yocto Project Reference Manual for information.
 
 4. *Install Development Host Packages:* Required development host
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 93db14c3ba..366fb006e8 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -26,7 +26,7 @@ provide packages for these, you can install and use the Buildtools
 tarball, which provides an SDK-like environment containing them.
 
 For more information on this requirement, see the
-":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
+":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
 section.
 
 .. _migration-1.5-atom-pc-bsp:
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 88a6855d50..8213ab58d9 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -31,7 +31,7 @@ build host is now 1.7.8 because the ``--list`` option is now required by
 BitBake's Git fetcher. As always, if your host distribution does not
 provide a version of Git that meets this requirement, you can use the
 ``buildtools-tarball`` that does. See the
-":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
+":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
 section for more information.
 
 .. _migration-1.7-autotools-class-changes:
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index ae6268d509..b2d8a0b678 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -357,7 +357,7 @@ These additional changes exist:
 -  The minimum Git version has been increased to 1.8.3.1. If your host
    distribution does not provide a sufficiently recent version, you can
    install the buildtools, which will provide it. See the
-   :ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
+   :ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
    section for more information on the buildtools tarball.
 
 -  The buggy and incomplete support for the RPM version 4 package
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index 22562dacd4..d65f1c7b1f 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -14,7 +14,7 @@ You will now need at least Python 3.6 installed on your build host. Most recent
 distributions provide this, but should you be building on a distribution that
 does not have it, you can use the ``buildtools-tarball`` (easily installable
 using ``scripts/install-buildtools``) - see
-:ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
+:ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
 for details.
 
 
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 1e1d6c83ed..6b942f0959 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -44,4 +44,5 @@ PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.6.0"
 MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
-MIN_GCC_VERSION : "5.0"
+MIN_GCC_VERSION : "7.5"
+MIN_MAKE_VERSION : "4.0"
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index e06b5e6caa..3eee9e1be5 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -22,7 +22,7 @@ Can I still use the Yocto Project?
 **A:** You can get the required tools on your host development system a
 couple different ways (i.e. building a tarball or downloading a
 tarball). See the
-":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
+":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
 section for steps on how to update your build tools.
 
 **Q:** How can you claim Poky / OpenEmbedded-Core is stable?
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 04f9efaa23..6cf88f2a98 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -234,8 +234,8 @@ supported CentOS-8 Linux distribution:
       $ sudo dnf install make python3-pip which
       &PIP3_HOST_PACKAGES_DOC;
 
-Required Git, tar, Python and gcc Versions
-==========================================
+Required Git, tar, Python, make and gcc Versions
+================================================
 
 In order to use the build system, your host development system must meet
 the following version requirements for Git, tar, and Python:
@@ -246,6 +246,8 @@ the following version requirements for Git, tar, and Python:
 
 -  Python &MIN_PYTHON_VERSION; or greater
 
+-  GNU make &MIN_MAKE_VERSION; or greater
+
 If your host development system does not meet all these requirements,
 you can resolve this by installing a ``buildtools`` tarball that
 contains these tools. You can get the tarball one of two ways: download
-- 
2.34.1


