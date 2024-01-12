Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12EFC4725D
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:51:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12518.1705078284573421732
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c0ubYSSE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97FA820007;
	Fri, 12 Jan 2024 16:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtX6YFNlHfTS1mnHwjFA21NiCWotVGotPb2W5wb17TA=;
	b=c0ubYSSEEx3M30QFtEH/sLY6KpTj3F2J9MB1ZY+Vkd+xsiqTUaJl8hcUXNh/wDrcwaOO9Q
	ep0KB/OkDh7I62scJdF9XzR6wnNWs0faufghgSbcDCJVpcd9qiikIbZ/pexYa/NXLG1Bov
	Qh/nBHu+3AwNXXlBdiWMsi07Y/1U2A0FfaFt00Q5gEgYif/7ZkgL6I7Z0S0CnSevrbKopO
	mdZU2eAR3vvQ5tDe2GngGRWZhl179/R1LgLZxsUXahGH7zv8KaO4IKfUdJx9f6TC72kwj+
	CcRXcXc3ichZ0JOzStHye0LQki939UlXmvyRf6BQurmITfhxkynTxDe1/v8/XQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [nanbield][PATCH 1/7] dev-manual: start.rst: Update use of Download page
Date: Fri, 12 Jan 2024 17:50:53 +0100
Message-Id: <20240112165059.3553847-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112165059.3553847-1-michael.opdenacker@bootlin.com>
References: <20240112165059.3553847-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:51:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4766

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Simone Weiß <simone.p.weiss@posteo.com>

The yocto website has changed its structure. Update the section for
Accessing the Downloads page to match the new structure.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/start.rst | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 4a556967eb..a4f938db3d 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -621,7 +621,7 @@ a selection of these components.
 Using the Downloads Page
 ------------------------
 
-The :yocto_home:`Yocto Project Website <>` uses a "DOWNLOADS" page
+The :yocto_home:`Yocto Project Website <>` uses a "RELEASES" page
 from which you can locate and download tarballs of any Yocto Project
 release. Rather than Git repositories, these files represent snapshot
 tarballs similar to the tarballs located in the Index of Releases
@@ -630,12 +630,13 @@ described in the ":ref:`dev-manual/start:accessing source archives`" section.
 #. *Go to the Yocto Project Website:* Open The
    :yocto_home:`Yocto Project Website <>` in your browser.
 
-#. *Get to the Downloads Area:* Select the "DOWNLOADS" item from the
-   pull-down "SOFTWARE" tab menu near the top of the page.
+#. *Get to the Downloads Area:* Select the "RELEASES" item from the
+   pull-down "DEVELOPMENT" tab menu near the top of the page.
 
-#. *Select a Yocto Project Release:* Use the menu next to "RELEASE" to
-   display and choose a recent or past supported Yocto Project release
-   (e.g. &DISTRO_NAME_NO_CAP;, &DISTRO_NAME_NO_CAP_MINUS_ONE;, and so forth).
+#. *Select a Yocto Project Release:* On the top of the "RELEASE" page currently
+   supported releases are displayed, further down past supported Yocto Project
+   releases are visible. The "Download" links in the rows of the table there
+   will lead to the download tarballs for the release.
 
    .. note::
 
@@ -645,9 +646,9 @@ described in the ":ref:`dev-manual/start:accessing source archives`" section.
    You can use the "RELEASE ARCHIVE" link to reveal a menu of all Yocto
    Project releases.
 
-#. *Download Tools or Board Support Packages (BSPs):* From the
-   "DOWNLOADS" page, you can download tools or BSPs as well. Just scroll
-   down the page and look for what you need.
+#. *Download Tools or Board Support Packages (BSPs):* Next to the tarballs you
+   will find download tools or BSPs as well. Just select a Yocto Project
+   release and look for what you need.
 
 Cloning and Checking Out Branches
 =================================
-- 
2.34.1


