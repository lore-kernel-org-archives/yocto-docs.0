Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2008C47258
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:53:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.12410.1705078418420447337
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S8ZMa5pq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02C452000A;
	Fri, 12 Jan 2024 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKSZe3PkMiVNNoBrz/Bp0EntPTUGCLTBxTuc9shQN1c=;
	b=S8ZMa5pqOehkGxFYmLu/m/EQx+SoVS+sHf/SLHAEXNMF6StHnEq2IZNuYN2YLU34VbNzo8
	VFPUrs/xtQTZg0asjI/mL/3CX8PeBmoek9Nbg+ACpqbXQjM5YStqJMZF5In4PAgfl3gPaY
	+E1c6/6ns8hA2RRfT2YGEd1EXvVIV33lE2KMJyldquVDe6BahjEK+QStwQv1HGD14ABMCT
	Gt2x/5G39asY/P+a5bZbQsgsnwtrIH1OLt6wn1U40170RdqyaSL3pPm0e5dV0E9uPErUJ+
	M/Ns4rrUhBGAlEqg0JR2C0TKLFO77JXDbXMb2V/XyHv8FX4z/PRvf+NyljRlvw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [kirkstone][PATCH 2/6] dev-manual: start.rst: update use of Download page
Date: Fri, 12 Jan 2024 17:53:07 +0100
Message-Id: <20240112165311.3554201-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
References: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:53:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4775

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Simone Weiß <simone.p.weiss@posteo.com>

The yocto website has changed its structure. Update the section for
Accessing the Downloads page to match the new structure.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/start.rst | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 3bc4244595..5a81506a9b 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -642,7 +642,7 @@ Follow these steps to locate and download a particular tarball:
 Using the Downloads Page
 ------------------------
 
-The :yocto_home:`Yocto Project Website <>` uses a "DOWNLOADS" page
+The :yocto_home:`Yocto Project Website <>` uses a "RELEASES" page
 from which you can locate and download tarballs of any Yocto Project
 release. Rather than Git repositories, these files represent snapshot
 tarballs similar to the tarballs located in the Index of Releases
@@ -651,11 +651,13 @@ described in the ":ref:`dev-manual/start:accessing index of releases`" section.
 1. *Go to the Yocto Project Website:* Open The
    :yocto_home:`Yocto Project Website <>` in your browser.
 
-2. *Get to the Downloads Area:* Select the "DOWNLOADS" item from the
-   pull-down "SOFTWARE" tab menu near the top of the page.
+#. *Get to the Downloads Area:* Select the "RELEASES" item from the
+   pull-down "DEVELOPMENT" tab menu near the top of the page.
 
-3. *Select a Yocto Project Release:* Use the menu next to "RELEASE" to
-   display and choose a recent or past supported Yocto Project release
+#. *Select a Yocto Project Release:* On the top of the "RELEASE" page currently
+   supported releases are displayed, further down past supported Yocto Project
+   releases are visible. The "Download" links in the rows of the table there
+   will lead to the download tarballs for the release
    (e.g. &DISTRO_NAME_NO_CAP;, &DISTRO_NAME_NO_CAP_MINUS_ONE;, and so forth).
 
    .. note::
@@ -666,9 +668,9 @@ described in the ":ref:`dev-manual/start:accessing index of releases`" section.
    You can use the "RELEASE ARCHIVE" link to reveal a menu of all Yocto
    Project releases.
 
-4. *Download Tools or Board Support Packages (BSPs):* From the
-   "DOWNLOADS" page, you can download tools or BSPs as well. Just scroll
-   down the page and look for what you need.
+#. *Download Tools or Board Support Packages (BSPs):* Next to the tarballs you
+   will find download tools or BSPs as well. Just select a Yocto Project
+   release and look for what you need.
 
 Cloning and Checking Out Branches
 =================================
-- 
2.34.1


