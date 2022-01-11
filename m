Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DD8C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:07:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.5553.1641899231093255817
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 03:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2E2A3C000E;
	Tue, 11 Jan 2022 11:07:08 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: stop mentioning nightly builds
Date: Tue, 11 Jan 2022 12:07:04 +0100
Message-Id: <20220111110704.2231847-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 11:07:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2375

While nightly builds are still run, they only produce
test files and reports. They are no longer a solution
to use the latest code.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/start.rst | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 1ca25318cd..9c7dde8cf2 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -666,32 +666,6 @@ described in the ":ref:`dev-manual/start:accessing index of releases`" section.
    "DOWNLOADS" page, you can download tools or BSPs as well. Just scroll
    down the page and look for what you need.
 
-Accessing Nightly Builds
-------------------------
-
-Yocto Project maintains an area for nightly builds that contains tarball
-releases at https://autobuilder.yocto.io/pub/nightly/. These builds include Yocto
-Project releases ("poky"), toolchains, and builds for supported
-machines.
-
-Should you ever want to access a nightly build of a particular Yocto
-Project component, use the following procedure:
-
-1. *Locate the Index of Nightly Builds:* Open a browser and go to
-   https://autobuilder.yocto.io/pub/nightly/ to access the Nightly Builds.
-
-2. *Select a Date:* Click on the date in which you are interested. If
-   you want the latest builds, use "CURRENT".
-
-3. *Select a Build:* Choose the area in which you are interested. For
-   example, if you are looking for the most recent toolchains, select
-   the "toolchain" link.
-
-4. *Find the Tarball:* Drill down to find the associated tarball.
-
-5. *Download the Tarball:* Click the tarball to download and save a
-   snapshot of the given component.
-
 Cloning and Checking Out Branches
 =================================
 
-- 
2.25.1


