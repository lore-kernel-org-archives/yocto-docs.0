Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC789C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 17:33:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.8949.1636133607049362081
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 10:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0436840009;
	Fri,  5 Nov 2021 17:33:24 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [PATCH] ref-manual: replace Container Layer example
Date: Fri,  5 Nov 2021 18:33:18 +0100
Message-Id: <20211105173318.33423-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16B4B6058A93F2E8.453@lists.yoctoproject.org>
References: <16B4B6058A93F2E8.453@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Nov 2021 17:33:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2098

meta-openembedded is not a layer by itself, at least
according to the manual that specifies that a layer must
have a conf/layer.conf file.

Use "meta-security" as a better example which is
consistent with this requirement for a layer.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 documentation/ref-manual/terms.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index eccae91a1c..d6f2162c4a 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -134,10 +134,9 @@ universal, the list includes them just in case:
       the Texas Instruments ARM Cortex-A8 development board).
 
    :term:`Container Layer`
-      Layers that hold other layers. An example of a container layer is
-      OpenEmbedded's `meta-openembedded
-      <https://github.com/openembedded/meta-openembedded>`_ layer. The
-      ``meta-openembedded`` layer contains many ``meta-*`` layers.
+      A layer that holds other layers. An example of a container layer is
+      :yocto_git:`meta-security </meta-security/>`. This layer contains
+      many ``meta-*`` layers.
 
    :term:`Cross-Development Toolchain`
       In general, a cross-development toolchain is a collection of software
-- 
2.25.1


