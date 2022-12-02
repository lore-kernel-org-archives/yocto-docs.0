Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998C0C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 15:33:02 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.78458.1669995173780064900
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 07:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y129U78O;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 56DB3240005;
	Fri,  2 Dec 2022 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669995170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FcdhOhMCOc+lnGFw5ufyYrZaxrKTroIKiruKjPFgBRY=;
	b=Y129U78OaIJTdWJm9Q79dZ4MnHrXtkF61gk5ZhtTJ9LYx4YX1KCvjPKxX/21Mb1wOkbhmk
	9NswtVSjfAYMz4rUKSBvWeh+WCAL1bENRoOEeobiMPU/3JyzoyRDv2p46/rsb3mB1KD5oU
	Lox0VIw0Ix6QvF4549m3nxqNiWBKq/WPLuAZ6EHpsxIIm1oljKbThFxD0wMl+f2kr7tL5u
	WcRIuPAl45Qa2xZOkZeYFTHUKreAo/PtgArwAiokdXKWy1zqj/qOOwdtTeQ5FRNWmgs3hk
	VAk6Iocse0s4Qv2OpR6VehjRs+ipcbHHb3vuqQFdhKk/tNlmGMTaymyZqhrD5Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] [langdale] Expand create-spdx class documentation
Date: Fri,  2 Dec 2022 16:32:32 +0100
Message-Id: <20221202153233.340139-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Dec 2022 15:33:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3516

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Using backported content from the master branch

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 1880e44486..a2d743d568 100644
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


