Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E77C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 17:24:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.20194.1679419475702151159
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 10:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gi3KiEdE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E98D340005;
	Tue, 21 Mar 2023 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679419473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMnt/g4OCEvc7IZL7NaDral1mCrTH5uokQOwkqbbL1E=;
	b=gi3KiEdEwRczdOFsXXyLYzk+mKuwT5cIteEkX47zD0ZhlRxSqCxmFD8FASoPcasgLLFjmc
	w3VL2nm27Sgg8SuYhgP1viIVor3I2/EwKPcM83vx8tMkVFH8MXZbAvCJfA1/pJwy46/CiN
	jFCKRq9kIPSlSmRyydEyWsZVZzCG5uaJkfbRZzeOx8YfcRgvKIpdT/UgfdA/5j4694sINZ
	ryGZ6gMtpW/jsue0lWzH8WigXikBOKWg7X+CXxuboGI+nEFU7KxV0CbWiWyeJD1VVwasK7
	e7MQfIXKduclT2ZlxWr3vBy1YUxnUc13SDFiIh9r9USe78ecEvAN0lI/n5p8WA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] manuals: add "LTS" term
Date: Tue, 21 Mar 2023 18:24:23 +0100
Message-Id: <20230321172423.57050-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321172423.57050-1-michael.opdenacker@bootlin.com>
References: <20230321172423.57050-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Mar 2023 17:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3809

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/securing-images.rst   |  2 +-
 .../migration-guides/release-notes-4.0.1.rst   |  2 +-
 documentation/ref-manual/release-process.rst   | 18 +++++++++---------
 documentation/ref-manual/terms.rst             |  6 ++++++
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/securing-images.rst b/documentation/dev-manual/securing-images.rst
index 6a9223c19c..e5791d3d6d 100644
--- a/documentation/dev-manual/securing-images.rst
+++ b/documentation/dev-manual/securing-images.rst
@@ -68,7 +68,7 @@ more secure:
 
 -  Regularly update your version of Poky and OE-Core from their upstream
    developers, e.g. to apply updates and security fixes from stable
-   and LTS branches.
+   and :term:`LTS` branches.
 
 -  Ensure you remove or disable debugging functionality before producing
    the final image. For information on how to do this, see the
diff --git a/documentation/migration-guides/release-notes-4.0.1.rst b/documentation/migration-guides/release-notes-4.0.1.rst
index c46142a08a..5529f71c6f 100644
--- a/documentation/migration-guides/release-notes-4.0.1.rst
+++ b/documentation/migration-guides/release-notes-4.0.1.rst
@@ -86,7 +86,7 @@ Fixes in 4.0.1
 -  migration-3.4: add missing entry on :term:`EXTRA_USERS_PARAMS`
 -  migration-guides: add release notes for 4.0
 -  migration-guides: complete migration guide for 4.0
--  migration-guides: release-notes-4.0: mention LTS release
+-  migration-guides: release-notes-4.0: mention :term:`LTS` release
 -  migration-guides: release-notes-4.0: update 'Repositories / Downloads' section
 -  migration-guides: stop including documents with ".. include"
 -  musl: Fix build when usrmerge distro feature is enabled
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 8b70a08f04..2cbf0d3b8c 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -92,26 +92,26 @@ Long Term Support Releases
 
 While stable releases are supported for a duration of seven months,
 some specific ones are now supported for a longer period by the Yocto
-Project, and are called Long Term Support (LTS) releases.
+Project, and are called Long Term Support (:term:`LTS`) releases.
 
 This started with version 3.1 ("Dunfell"), released in April 2020, that
-the project committed to supporting until the next LTS release was out.
-This next LTS release, version 4.0 ("Kirkstone"), was released in May 2022
+the project committed to supporting until the next :term:`LTS` release was out.
+This next :term:`LTS` release, version 4.0 ("Kirkstone"), was released in May 2022
 and offered with two years of support too.
 
 However, as an experiment, support for "Dunfell" was extended to four years, until
 April 2024, therefore offering more stability to projects and leaving more time
-to upgrade to the latest LTS release. The project hasn't made any commitment to
+to upgrade to the latest :term:`LTS` release. The project hasn't made any commitment to
 extending "Kirkstone" support too, as this will also depend on available funding
 for such an effort.
 
-When significant issues are found, LTS releases allow to publish
+When significant issues are found, :term:`LTS` releases allow to publish
 fixes not only for the current stable release, but also to the
-LTS releases that are still supported. Older stable releases which
+:term:`LTS` releases that are still supported. Older stable releases which
 have reached their End of Life (EOL) won't receive such updates.
 
 See :yocto_wiki:`/Stable_Release_and_LTS` for details about the management
-of stable and LTS releases.
+of stable and :term:`LTS` releases.
 
 .. image:: svg/releases.*
    :width: 100%
@@ -119,9 +119,9 @@ of stable and LTS releases.
 .. note::
 
    In some circumstances, a layer can be created by the community in order to
-   add a specific feature or support a new version of some package for an LTS
+   add a specific feature or support a new version of some package for an :term:`LTS`
    release.  This is called a "mixin" layer. These are thin and specific
-   purpose layers which can be stacked with an LTS release to "mix" a specific
+   purpose layers which can be stacked with an :term:`LTS` release to "mix" a specific
    feature into that build. These are created on an as-needed basis and
    maintained by the people who need them.
 
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index ec447d35d2..5a7363acad 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -227,6 +227,12 @@ universal, the list includes them just in case:
       Layers`" section in the Yocto Project Board Support Packages (BSP)
       Developer's Guide.
 
+   :term:`LTS`
+      This term means "Long Term Support", and in the context of the Yocto
+      Project, it corresponds to selected stable releases for which bug and
+      security fixes are provided for at least two years. See
+      ":doc:`/ref-manual/release-process`" for details.
+
    :term:`Metadata`
       A key element of the Yocto Project is the Metadata that
       is used to construct a Linux distribution and is contained in the
-- 
2.34.1


