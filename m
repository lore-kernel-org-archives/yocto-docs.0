Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FB0C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 11:32:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.48767.1699011163263520637
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 04:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hpl7RDkk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 415BFE0005;
	Fri,  3 Nov 2023 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699011161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+sualf4AgIVI/+Kj9XZU15+hNnmLSPyjXAK3M59EKJM=;
	b=hpl7RDkkJj7dBbTN8A51vchgEoDDjNSv/1Ay4oJqUIIXIcf5OrktbQ2sBleFk0bl8lYE93
	/01GbNVzbCQcPONnzV2Wrs64psns5I4Zbg88uBNMD7wcHabuXOUL4xnx20aYHKXbRtFh3U
	bKt4L7HyjKkUsL/8+cSd9JoM9BMPVRZ6LM7VAi6VG80RRst40s2RYoEwxZ76aViVcplZ5t
	UdtKleJUxl1yUnC8recDsDMvCZ4K2UM6A/cx2W9m9QRwgFzSzkcsLx/yZnDPlQ1m8H8ubo
	mjL4qqDRBVhER+xNvyMSr5LHb+dYSOhK4wEHshFchI4SMSkd7ISAvYUz/Z65UQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables: add RECIPE_MAINTAINER
Date: Fri,  3 Nov 2023 12:32:39 +0100
Message-Id: <20231103113239.2014768-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Nov 2023 11:32:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4580

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 52e3e59588..38c63d6179 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6989,6 +6989,22 @@ system and gives an overview of their function and contents.
       ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
       BitBake User Manual for additional information on tasks and dependencies.
 
+   :term:`RECIPE_MAINTAINER`
+      This variable defines the name and e-mail address of the maintainer of a
+      recipe. Such information can be used by human users submitted changes,
+      and by automated tools to send notifications, for example about
+      vulnerabilities or source updates.
+
+      The variable can be defined in a global distribution :oe_git:`maintainers.inc
+      </openembedded-core/tree/meta/conf/distro/include/maintainers.inc>` file::
+
+          meta/conf/distro/include/maintainers.inc:RECIPE_MAINTAINER:pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
+
+      It can also be directly defined in a recipe,
+      for example in the ``libgpiod`` one::
+
+          RECIPE_MAINTAINER = "Bartosz Golaszewski <brgl@bgdev.pl>"
+
    :term:`RECIPE_NO_UPDATE_REASON`
       If a recipe should not be replaced by a more recent upstream version,
       putting the reason why in this variable in a recipe allows
-- 
2.34.1


