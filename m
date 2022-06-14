Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FD5C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 17:17:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.24.1655227054224093560
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 10:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dAyC6je5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EEBBC1C000E;
	Tue, 14 Jun 2022 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655227051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMUnEBVLoO9X+SuYfzWmTaazIdYM7IR6MFHOb1XIHfQ=;
	b=dAyC6je5J7KCqFZVX4T7QLMarisY9Yrp9R4L+V3wswBcp+H2WdtYZTsEUOWIJbu9y1ohw8
	+0qFTDeVPn1MWPklpOWDR+AoaIysSbF+0p/kOkIFDtUozPaXgWvekDa+0NoPE6A3oPfTpP
	zB/06cFRmPNctHF/n7Tlx4sAvplVn5Ir34N0qMnRpGTLwYobSVJGTQ/1yBndzBi0Nf1+ik
	dw80UO6yxjs+PrX9jQlA564F3NT1KXNcECKrzjRTrwkl5+OOnuCfeNf1Rqhe70Xxu2CbuN
	AHFF/eVUx/iW9vDEWK0mzl5yTBL4pEZOHsW9uouukI28BVG8Q+rKWxroz9BItQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: add description for the "sysroot" term
Date: Tue, 14 Jun 2022 19:17:28 +0200
Message-Id: <20220614171728.889983-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: 
 <73a31eefa84a8416adb982e76aa19b3b7660e5ae.camel@linuxfoundation.org>
References: 
 <73a31eefa84a8416adb982e76aa19b3b7660e5ae.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jun 2022 17:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2996

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This term is used throughout the manual but is not properly
introduced anywhere.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Changes in V2:
* Replace the introductory paragraph by the one proposed by Richard Purdie
---
 documentation/ref-manual/terms.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index cba514c345..512032a67e 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -383,6 +383,31 @@ universal, the list includes them just in case:
      ":ref:`overview-manual/development-environment:repositories, tags, and branches`"
      section in the Yocto Project Overview and Concepts Manual.
 
+   :term:`Sysroot`
+      When cross-compiling, the target file system may be differently laid
+      out and contain different things compared to the host system. The concept
+      of a *sysroot* is directory which looks like the target filesystem and
+      can be used to cross-compile against.
+
+      In the context of cross-compiling toolchains, a *sysroot*
+      typically contains C library and kernel headers, plus the
+      compiled binaries for the C library. A *multilib toolchain*
+      can contain multiple variants of the C library binaries,
+      each compiled for a target instruction set (such as ``armv5``,
+      ``armv7`` and ``armv8``), and possibly optimized for a specific CPU core.
+
+      In the more specific context of the OpenEmbedded build System and
+      of the Yocto Project, each recipe has two sysroots:
+
+      -  A *target sysroot* contains all the **target** libraries and headers
+         needed to build the recipe.
+
+      -  A *native sysroot* contains all the **host** files and executables
+         needed to build the recipe.
+
+      See the :term:`SYSROOT_* <SYSROOT_DESTDIR>` variables controlling
+      how sysroots are created and stored.
+
    :term:`Task`
       A per-recipe unit of execution for BitBake (e.g.
       :ref:`ref-tasks-compile`,
-- 
2.34.1


