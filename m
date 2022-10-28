Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93F3FA3741
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:11:16 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.626.1666969868845792553
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 08:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fq2nzwS2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 308D420012;
	Fri, 28 Oct 2022 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666969867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=op8ma9BXrffWOzkRiLLxVnba3eMYKFNd8VydYb9coE8=;
	b=fq2nzwS2EuuFiqt2QwD7Djk823p9KwA7bfftc4t0SiO51H6kitXHyinccBRQUo+VOt5Hmr
	xTdXhldXgpxBAfb/01WhAtQ3U2XdwX0E3zr9FHqSdRvBu6UfWr3m9oe9YJJmW35nJLqBBC
	//NZudHmSexcAS8MbeeN08nS+LLgBnMfRhiWppMe1b+SR0HuM47I14prK+2VCzYW7H7IvQ
	uNzFWaKlOyeLAuQaZLvRiCli1n0Pa9YEXcFV+tgNtb63D7fr3AkVq3NmugsO4DxeDIqbxZ
	3eUkRTBTNPPmI906ZxcfJF98perrpGwdZarHhyLNqedgB3blkotVHWgS9/FY8A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: JPEWhacker@gmail.com,
	mikko.rapeli@linaro.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 4/5] ref-manual: classes.rst: expand documentation of create-spdx class
Date: Fri, 28 Oct 2022 17:10:32 +0200
Message-Id: <20221028151033.383087-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028151033.383087-1-michael.opdenacker@bootlin.com>
References: <17224368BE5A21CF.6604@lists.yoctoproject.org>
 <20221028151033.383087-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 15:11:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3446

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3b33783c58..5537eb774a 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -373,8 +373,26 @@ support.
 ``create-spdx.bbclass``
 =======================
 
-The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for automatically creating
-SPDX SBoM documents based upon image and SDK contents.
+The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for
+automatically creating :term:`SPDX` :term:`SBOM` documents based upon image
+and SDK contents.
+
+This class is meant to be inherited globally from a configuration file::
+
+   INHERIT += "create-spdx"
+
+The toplevel :term:`SPDX` output file is generated in JSON format as a
+``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside the
+:term:`Build Directory`. There are other related files in the same directory,
+as well as in ``tmp/deploy/spdx``.
+
+The exact behaviour of this class, and the amount of output can be controlled
+by the :term:`SPDX_PRETTY`, :term:`SPDX_ARCHIVE_PACKAGED`,
+:term:`SPDX_ARCHIVE_SOURCES` and :term:`SPDX_INCLUDE_SOURCES` variables.
+
+See the description of these variables and the
+":ref:`dev-manual/common-tasks:creating a software bill of materials`"
+section in the Yocto Project Development Manual for more details.
 
 .. _ref-classes-cross:
 
-- 
2.34.1


