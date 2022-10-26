Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F612FA3741
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 16:07:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.9305.1666800455772375985
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 09:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kQXUr80i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 62F3720012;
	Wed, 26 Oct 2022 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666800453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dq+HLQCCBow1YCF+tCxwUZsWx/KWtgPWZVremBH+Qks=;
	b=kQXUr80ihHB+QthczYcOrH+ytLy401vzWKfAkLp5/Fx2+jBxR0m5ArE7XAZxDArDgmIaLX
	8FFgwDxAAkIiN4/2BS9MDdS0VZWZE07ZOm6loY/FJbitZ/yWoglTjlydlOo5kWousD5881
	0M+giLkvtw6uRxdZyfDij0rCj0lR/dRAt4Jw+Igba31JT/m0HKVoSbzRzVFv9NYC2/dy9Q
	7d26N2MT+hqnzM9IniX+zHatv6MeEsAq7LNaJFjKJarstozmJJD0tfuAb3K0pXx58Wavey
	kVCyJEnI3nV70EzETxYmRQAjjH2vURLuJmQM1qBmaG+nZK80s+iY9IXpe8CuQg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: rybczynska@gmail.com,
	mikko.rapeli@linaro.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 1/4] ref-manual: variables.rst: add documentation for CVE_VERSION
Date: Wed, 26 Oct 2022 18:07:10 +0200
Message-Id: <20221026160713.2068570-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
References: <1721A288D2BAB036.492@lists.yoctoproject.org>
 <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 16:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3417

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Related to cve-check.bbclass.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71e8c272a7..0f9df3ac20 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1508,6 +1508,18 @@ system and gives an overview of their function and contents.
 
          CVE_PRODUCT = "vendor:package"
 
+   :term:`CVE_VERSION`
+      In a recipe, defines the version used to match the recipe version
+      against the version in the `NIST CVE database <https://nvd.nist.gov/>`__
+      when usign :ref:`cve-check <ref-classes-cve-check>`.
+
+      The default is ${:term:`PV`} but if recipes use custom version numbers
+      which do not map to upstream software component release versions and the versions
+      used in the CVE database, then this variable can be used to set the
+      version number for :ref:`cve-check <ref-classes-cve-check>`. Example::
+
+          CVE_VERSION = "2.39"
+
    :term:`CVSDIR`
       The directory in which files checked out under the CVS system are
       stored.
-- 
2.34.1


