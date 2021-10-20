Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0614C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:58:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.921.1634752694483143285
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 10:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 132C9FF80D;
	Wed, 20 Oct 2021 17:58:11 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: poky.yaml: updates for 3.4
Date: Wed, 20 Oct 2021 19:58:03 +0200
Message-Id: <20211020175803.2019839-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Oct 2021 17:58:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2016

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/poky.yaml | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 50d1f9c4aa..6dab21b985 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.3.3"
-DISTRO_NAME_NO_CAP : "hardknott"
-DISTRO_NAME : "Hardknott"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
+DISTRO : "3.4"
+DISTRO_NAME_NO_CAP : "honister"
+DISTRO_NAME : "Honister"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "3.3.3"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
-DISTRO_REL_TAG : "yocto-3.3.3"
-POKYVERSION : "25.0.3"
+YOCTO_DOC_VERSION : "3.4"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.3.3"
+DISTRO_REL_TAG : "yocto-3.4"
+POKYVERSION : "26.0.0"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


