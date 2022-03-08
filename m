Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3443C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 18:51:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.11971.1646765514040131637
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 10:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R/uwwY70;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 734A11C0005;
	Tue,  8 Mar 2022 18:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646765511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7aogfHYlgfsG5m7jM53Yx5PP2jc7+eb5eQXIYWSg1zE=;
	b=R/uwwY70ulZYZNdr6ZTF5p67Q+QgyW0U315lsfU3Yjm6eqrsIEobFiNY+58ZbpcU0iczFQ
	hSFMoe0WTXlgAGZWX4CQyaVZc/PQwqs0RMKtD4ZnYUL7aBNnIW/xLJe4YsL5IGhwhjD7A1
	twDK3LVjXV2xw2R8SeJKvQKu9j2NkHqpVzJMrhyS1FsHUu3SMHtVbDqsHVsS2kIyV4CZA0
	+xU0/nPMVb0kJAPlVhtsLrWOzGmKWBrkO19FaUBGzfHckIpRV3TAQRiQ2YC+S8bjyMwgvJ
	KmApWcOHQgpa3+vuKShh0bzqQN3H8YMt9Pms/DtMpwTjPJ9d1/QOIeSooAU6Cw==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] [dunfell] docs: fix hardcoded link warning messages
Date: Tue,  8 Mar 2022 19:51:45 +0100
Message-Id: <20220308185145.591990-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 18:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2551

Sphinx complains about hardcoded links which can be replaced by an
extlink.

So let's apply its recommendations.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss+yocto@0leil.net>
---
 documentation/bsp-guide/bsp.rst                              | 5 +++--
 documentation/dev-manual/dev-manual-common-tasks.rst         | 2 +-
 .../overview-manual-development-environment.rst              | 4 ++--
 documentation/overview-manual/overview-manual-yp-intro.rst   | 4 ++--
 documentation/profile-manual/profile-manual-usage.rst        | 5 ++---
 documentation/ref-manual/ref-system-requirements.rst         | 2 +-
 documentation/toaster-manual/toaster-manual-reference.rst    | 4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index d0275eea9a..efb5328911 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -166,8 +166,9 @@ section.
 #. *Determine the BSP Layer You Want:* The Yocto Project supports many
    BSPs, which are maintained in their own layers or in layers designed
    to contain several BSPs. To get an idea of machine support through
-   BSP layers, you can look at the `index of
-   machines <&YOCTO_RELEASE_DL_URL;/machines>`__ for the release.
+   BSP layers, you can look at the
+   :yocto_dl:`index of machines </releases/yocto/&DISTRO_REL_TAG;/machines>`
+   for the release.
 
 #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
    based on current Intel CPUs and devices, you can leverage this BSP
diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index d401d3b4ee..159da6a019 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -2168,7 +2168,7 @@ recipe, but which one? You can configure your build to call out the
 kernel recipe you want by using the
 :term:`PREFERRED_PROVIDER`
 variable. As an example, consider the
-`x86-base.inc <https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/conf/machine/include/x86-base.inc>`_
+:yocto_git:`x86-base.inc </cgit/cgit.cgi/poky/tree/meta/conf/machine/include/x86-base.inc>`
 include file, which is a machine (i.e.
 :term:`MACHINE`) configuration file.
 This include file is the reason all x86-based machines use the
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index 4bedd6df67..a5469d4d78 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -422,7 +422,7 @@ files. Git uses "branches" to organize different development efforts.
 For example, the ``poky`` repository has several branches that include
 the current "&DISTRO_NAME_NO_CAP;" branch, the "master" branch, and many
 branches for past Yocto Project releases. You can see all the branches
-by going to https://git.yoctoproject.org/cgit.cgi/poky/ and clicking on the
+by going to :yocto_git:`/cgit.cgi/poky/` and clicking on the
 ``[...]`` link beneath the "Branch" heading.
 
 Each of these branches represents a specific area of development. The
@@ -468,7 +468,7 @@ Git uses "tags" to mark specific changes in a repository branch
 structure. Typically, a tag is used to mark a special point such as the
 final change (or commit) before a project is released. You can see the
 tags used with the ``poky`` Git repository by going to
-https://git.yoctoproject.org/cgit.cgi/poky/ and clicking on the ``[...]`` link
+:yocto_git:`/cgit.cgi/poky/` and clicking on the ``[...]`` link
 beneath the "Tag" heading.
 
 Some key tags for the ``poky`` repository are ``jethro-14.0.3``,
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index f1c725ac27..6dd10f2187 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -271,8 +271,8 @@ with the string ``meta-``.
    , but it is a commonly accepted standard in the Yocto Project
    community.
 
-For example, if you were to examine the `tree
-view <https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/>`__ of the
+For example, if you were to examine the :yocto_git:`tree
+view </cgit/cgit.cgi/poky/tree/>` of the
 ``poky`` repository, you will see several layers: ``meta``,
 ``meta-skeleton``, ``meta-selftest``, ``meta-poky``, and
 ``meta-yocto-bsp``. Each of these repositories represents a distinct
diff --git a/documentation/profile-manual/profile-manual-usage.rst b/documentation/profile-manual/profile-manual-usage.rst
index d3c020a1cf..15cf1efe1c 100644
--- a/documentation/profile-manual/profile-manual-usage.rst
+++ b/documentation/profile-manual/profile-manual-usage.rst
@@ -1169,9 +1169,8 @@ e.g. 'perf help' or 'perf help record'.
 
 However, by default Yocto doesn't install man pages, but perf invokes
 the man pages for most help functionality. This is a bug and is being
-addressed by a Yocto bug: `Bug 3388 - perf: enable man pages for basic
-'help'
-functionality <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3388>`__.
+addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for basic
+'help' functionality </show_bug.cgi?id=3388>`.
 
 The man pages in text form, along with some other files, such as a set
 of examples, can be found in the 'perf' directory of the kernel tree: ::
diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 2acf11cdb8..109aa60d05 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -351,7 +351,7 @@ Downloading a Pre-Built ``buildtools`` Tarball
 Downloading and running a pre-built buildtools installer is the easiest
 of the two methods by which you can get these tools:
 
-1. Locate and download the ``*.sh`` at &YOCTO_RELEASE_DL_URL;/buildtools/
+1. Locate and download the ``*.sh`` at :yocto_dl:`/releases/yocto/&DISTRO_REL_TAG;/buildtools/`
 
 2. Execute the installation script. Here is an example for the
    traditional installer:
diff --git a/documentation/toaster-manual/toaster-manual-reference.rst b/documentation/toaster-manual/toaster-manual-reference.rst
index e5e3531e83..bd3a060eee 100644
--- a/documentation/toaster-manual/toaster-manual-reference.rst
+++ b/documentation/toaster-manual/toaster-manual-reference.rst
@@ -173,13 +173,13 @@ As shipped, Toaster is configured to work with the following releases:
 -  *Yocto Project &DISTRO; "&DISTRO_NAME;" or OpenEmbedded "&DISTRO_NAME;":*
    This release causes your Toaster projects to build against the head
    of the &DISTRO_NAME_NO_CAP; branch at
-   https://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=&DISTRO_NAME_NO_CAP; or
+   :yocto_git:`/cgit/cgit.cgi/poky/log/?h=&DISTRO_NAME_NO_CAP;` or
    http://git.openembedded.org/openembedded-core/commit/?h=&DISTRO_NAME_NO_CAP;.
 
 -  *Yocto Project "Master" or OpenEmbedded "Master":* This release
    causes your Toaster Projects to build against the head of the master
    branch, which is where active development takes place, at
-   https://git.yoctoproject.org/cgit/cgit.cgi/poky/log/ or
+   :yocto_git:`/cgit/cgit.cgi/poky/log/` or
    http://git.openembedded.org/openembedded-core/log/.
 
 -  *Local Yocto Project or Local OpenEmbedded:* This release causes your
-- 
2.25.1


