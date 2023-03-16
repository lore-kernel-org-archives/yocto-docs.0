Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FA8C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 15:18:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14953.1678979936174273543
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Mar 2023 08:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TCZq+vxM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C01B24000C;
	Thu, 16 Mar 2023 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678979934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dWn55ktNS3cwv5OMytOH0ZUqmg3Jdb0Boss9Xvp10fM=;
	b=TCZq+vxMxytSdtcgZCHufdAyYEdPOJhf9AJWGe+FGK89JDcrlq+LRuJGev1hTFcoV7TElS
	D++WhtD73+cx4wlymjI2vOVzq3n3DB3nqBdPMsNEw4MZLVRc83d6MgOMrOu11B4qZRmtuv
	UbC/X6BiDdsUlBQ/CLmWBU4DRIJUT4P82MUEt25r0qgeQLgMeR9FDAtyG4DbzAmxyvy1wh
	BSjNiYuUVVrZ+9bmBEbeZtGt+1qtL7GgcSFMb7OabRpAfs0Ccynr2jNQBLs/G/XFXokF1l
	YJz2Q5Fbc3GzjF39p0ED9cICjVLmfNDeL3n+B4EUzy2YugaQC4ESNdSCNXYgLA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: variables.rst: update LAYERSERIES_COMPAT
Date: Thu, 16 Mar 2023 16:18:39 +0100
Message-Id: <20230316151839.3708045-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Mar 2023 15:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3800

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Replace by a reference to the description which was
  moved to the BitBake manual.

- Also drop the reference to the Yocto Project Development Tasks Manual
  which doesn't add extra information on this variable.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6c59ffee5f..c787a17937 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4741,31 +4741,7 @@ system and gives an overview of their function and contents.
       ``LAYERRECOMMENDS_mylayer``).
 
    :term:`LAYERSERIES_COMPAT`
-      Lists the versions of the :term:`OpenEmbedded-Core (OE-Core)` for which
-      a layer is compatible. Using the :term:`LAYERSERIES_COMPAT` variable
-      allows the layer maintainer to indicate which combinations of the
-      layer and OE-Core can be expected to work. The variable gives the
-      system a way to detect when a layer has not been tested with new
-      releases of OE-Core (e.g. the layer is not maintained).
-
-      To specify the OE-Core versions for which a layer is compatible, use
-      this variable in your layer's ``conf/layer.conf`` configuration file.
-      For the list, use the Yocto Project
-      :yocto_wiki:`Release Name </Releases>` (e.g.
-      &DISTRO_NAME_NO_CAP;). To specify multiple OE-Core versions for the
-      layer, use a space-separated list::
-
-         LAYERSERIES_COMPAT_layer_root_name = "&DISTRO_NAME_NO_CAP; &DISTRO_NAME_NO_CAP_MINUS_ONE;"
-
-      .. note::
-
-         Setting :term:`LAYERSERIES_COMPAT` is required by the Yocto Project
-         Compatible version 2 standard.
-         The OpenEmbedded build system produces a warning if the variable
-         is not set for any given layer.
-
-      See the ":ref:`dev-manual/layers:creating your own layer`"
-      section in the Yocto Project Development Tasks Manual.
+      See :term:`bitbake:LAYERSERIES_COMPAT` in the BitBake manual.
 
    :term:`LAYERVERSION`
       Optionally specifies the version of a layer as a single number. You
-- 
2.34.1


