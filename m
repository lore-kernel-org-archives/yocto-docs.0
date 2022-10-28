Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A99FA3741
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:19:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.4667.1666952389111243451
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 03:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cyGMy16v;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 68B5F40006;
	Fri, 28 Oct 2022 10:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666952386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBwUGVlgHKH66tlh4Bz9LKRl0yvIeYkPvK4QM4DLd4U=;
	b=cyGMy16vOhdB+XfH0IJjb+nk+XyF4miwJ1J0WbUfX7X4k5k6zk/K5HV3062y9VFcDdodNq
	i4Z01SW/AQHFHxaNHKRK4XBNDIL8Wv2WQD8VPAXCT40EZIVW5scyoOgYT5NE2+DdT6A2wr
	LwQromdvvW0EQNl3H7Dmxh9pYHdYmEeUdFln1MA13beHArq7VTa9OMgpjC6wsT9w13c8eT
	kJTelHJ9N8qel1mnliZ5WoDx7FY+QkJOTfobTtocr2bLVTLIjjByZw6Hpd81j8VEuCNjYy
	tYZbrIY10l57wZ4RgCLA/dXjJPVvREZTzIC6q4kwANpcd7vgKCOLZoW2TfSVqg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/5] ref-manual: terms.rst: add SBOM and SPDX terms
Date: Fri, 28 Oct 2022 12:19:35 +0200
Message-Id: <20221028101939.93195-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
References: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 10:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3432

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/terms.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 1e3f718a8f..5aedd08aae 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -323,6 +323,23 @@ universal, the list includes them just in case:
       :term:`build host<Build Host>` and other components, that can
       work on specific hardware.
 
+   :term:`SBOM`
+      This term means *Software Bill of Materials*. When you distribute
+      software, it offers a description of all the components you used,
+      their corresponding licenses, their dependencies, the changes that were
+      applied and the known vulnerabilities that were fixed.
+
+      This can be used by the recipients of the software to assess
+      their exposure to license compliance and security vulnerability issues.
+
+      See the `Software Supply Chain <https://en.wikipedia.org/wiki/Software_supply_chain>`__
+      article on Wikipedia for more details.
+
+      The OpenEmbedded Build System can generate such documentation for your
+      project, in :term:`SPDX` format, based on all the metadata it used to
+      build the software images. See the ":ref:`dev-manual/common-tasks:creating
+      a software bill of materials`" section of the Development Tasks manual.
+
    :term:`Source Directory`
      This term refers to the directory structure
      created as a result of creating a local copy of the ``poky`` Git
@@ -383,6 +400,15 @@ universal, the list includes them just in case:
      ":ref:`overview-manual/development-environment:repositories, tags, and branches`"
      section in the Yocto Project Overview and Concepts Manual.
 
+   :term:`SPDX`
+      This term means *Software Package Data Exchange*, and is used as a open
+      standard for providing a *Software Bill of Materials* (:term:`SBOM`).
+      This standard is developed through a `Linux Foundation project
+      <https://spdx.dev/>`__ and is used by the OpenEmbedded Build System to
+      provide an :term:`SBOM` associated to each a software image.
+
+      For details, see Wikipedia's `SPDX page <https://en.wikipedia.org/wiki/Software_Package_Data_Exchange>`__.
+
    :term:`Sysroot`
       When cross-compiling, the target file system may be differently laid
       out and contain different things compared to the host system. The concept
-- 
2.34.1


