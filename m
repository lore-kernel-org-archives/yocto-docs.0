Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D172C6FA92
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:39 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.581.1663955612547298699
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Nxu/JFTj;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E4AAF200006;
	Fri, 23 Sep 2022 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KLreiqD6AzLG5eZB8VYQ2nJxHpbSAwjERcOnQHIal8I=;
	b=Nxu/JFTjdwKRbO26JJ3yUxU8v1lHZYNvE1V+a9yZcaaiYwHD6APsQXNmE5PYG23n2/zxSy
	3AufHR5E/tirG1+pVJpLx0Lp+q7O384gstZ3UxZl4Ko7NoF3OpKQptZ6hpXS8n4o9igVjL
	Wh6/bzORhIYr7xidiMiVn27Gv6kx8dmj/yhmkmrr5ZxUf4I45Iy+tlKAK+oLVxnASdFQHi
	wUI58qHJdT0QlV+XjzX5fX2o0Kbj3nkgSuBZRY9S0uLCP2LV/wwWNV6rkVyiQw66Np8VGf
	/Ar2Ol9PvOxhPn90y6FWCwQlSAYkPd+lK5BfXm+SHT4zlswG0WCgrfaUb265Rw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 14/30] manuals: add reference to the "do_populate_sdk" task
Date: Fri, 23 Sep 2022 19:52:03 +0200
Message-Id: <20220923175219.6652-15-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3229

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-3.4.rst | 2 +-
 documentation/overview-manual/concepts.rst           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-3.4.rst b/documentation/migration-guides/release-notes-3.4.rst
index 323e4df7ae..33525120c6 100644
--- a/documentation/migration-guides/release-notes-3.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.rst
@@ -67,7 +67,7 @@ New Features / Enhancements in 3.4
 
 -  SDK-related enhancements:
 
-   -  Enable do_populate_sdk with multilibs
+   -  Enable :ref:`ref-tasks-populate_sdk` with multilibs
    -  New ``SDKPATHINSTALL`` variable decouples default install path from built in path to avoid rebuilding nativesdk components on e.g. :term:`DISTRO_VERSION` changes
    -  eSDK: Error if trying to generate an eSDK from a multiconfig
    -  eSDK: introduce :term:`TOOLCHAIN_HOST_TASK_ESDK` to be used in place of :term:`TOOLCHAIN_HOST_TASK` to add components to the host part of the eSDK
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index a477139996..1215e0ee94 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1085,7 +1085,7 @@ the extensible SDK (eSDK):
    For more information on the cross-development toolchain generation,
    see the ":ref:`overview-manual/concepts:cross-development toolchain generation`"
    section. For information on advantages gained when building a
-   cross-development toolchain using the do_populate_sdk task, see the
+   cross-development toolchain using the :ref:`ref-tasks-populate_sdk` task, see the
    ":ref:`sdk-manual/appendix-obtain:building an sdk installer`" section in
    the Yocto Project Application Development and the Extensible Software
    Development Kit (eSDK) manual.
@@ -1100,7 +1100,7 @@ actually install. For information on the variables listed in the figure,
 see the ":ref:`overview-manual/concepts:application development sdk`"
 section.
 
-The ``do_populate_sdk`` task helps create the standard SDK and handles
+The :ref:`ref-tasks-populate_sdk` task helps create the standard SDK and handles
 two parts: a target part and a host part. The target part is the part
 built for the target hardware and includes libraries and headers. The
 host part is the part of the SDK that runs on the
-- 
2.34.1


