Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA94C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:14:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.6692.1634807649634766265
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 02:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D8A0F1C0007;
	Thu, 21 Oct 2021 09:14:06 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: fix description of SOURCE_DATE_EPOCH
Date: Thu, 21 Oct 2021 11:13:59 +0200
Message-Id: <20211021091359.2033404-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 09:14:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2021

Update the reference to the code that computes this default
value for this variable.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 53a8ee50a2..b9e97719b9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6935,7 +6935,7 @@ system and gives an overview of their function and contents.
       <https://reproducible-builds.org/specs/source-date-epoch/>`__.
 
       A value for each recipe is computed from the sources by
-      the :ref:`reproducible-build <ref-classes-reproducible-build>` class.
+      :oe_git:`meta/lib/oe/reproducible.py </openembedded-core/tree/meta/lib/oe/reproducible.py>`.
 
       If a recipe wishes to override the default behavior, it should set its
       own :term:`SOURCE_DATE_EPOCH` value::
-- 
2.25.1


