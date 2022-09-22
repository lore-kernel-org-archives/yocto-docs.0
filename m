Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31455C6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 09:07:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.5060.1663837672699105909
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 02:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LIKxDox2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 73AEB1C000F;
	Thu, 22 Sep 2022 09:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663837670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Drg4uvFdKUxfkomf+OlHSHSXT08dwezuMhEIQYd0KbU=;
	b=LIKxDox2DngNVqf17uC6YM+vMhuFHtmhtMhdNpXvk8a1r13wDBmtrCdUfpqo2MEnAp211R
	hkNCD1DtzyZNioulOVKvXEdT/CL004i+k77TCJYxaZYPdgMR/T8mB1iHAJsnt2Dq3Y7Qzu
	fqWxScCqHZYj8KGIFL+dBeQVphxQZfrZTDiScO/jSImONF2oWhabRceiEXm9ftRzZPnGIh
	Xxg9pJfTfajHcKEaKrdQqgQmodAWn9FVVvJ0CffHA9jhV15zZLUpn3Z9Mg6Tu1Ekebcdjy
	K++HRH8wlvlGDlk9B8mWcBlSA5vz3a8QwyJNi6PjFfggFDej/bLLx5hqr6mB9A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH v2] ref-manual: variables.rst: remove BBPATH
Date: Thu, 22 Sep 2022 11:07:41 +0200
Message-Id: <20220922090741.2331948-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <171722EDD973C83B.16339@lists.yoctoproject.org>
References: <171722EDD973C83B.16339@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 09:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3207

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As reported in [YOCTO #14502], the description of BBPATH in the
Yocto Project Manual is redundant with its description in the
BitBake User Manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>

---

Changes in V2:
- Remove the manual redirection
  The consequence is that BBPATH will no longer be listed
  in the Yocto variable index.
---
 documentation/ref-manual/variables.rst | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fe845bf375..72aca440be 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -728,22 +728,6 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/common-tasks:building images for multiple targets using multiple configurations`"
       section in the Yocto Project Development Tasks Manual.
 
-   :term:`BBPATH`
-      Used by BitBake to locate ``.bbclass`` and configuration files. This
-      variable is analogous to the ``PATH`` variable.
-
-      .. note::
-
-         If you run BitBake from a directory outside of the
-         :term:`Build Directory`, you must be sure to set :term:`BBPATH`
-         to point to the Build Directory. Set the variable as you would any
-         environment variable and then run BitBake::
-
-                 $ BBPATH = "build_directory"
-                 $ export BBPATH
-                 $ bitbake target
-
-
    :term:`BBSERVER`
       If defined in the BitBake environment, :term:`BBSERVER` points to the
       BitBake remote server.
-- 
2.34.1


