Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E48EC43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 16:22:17 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.6960.1655310131334460348
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 09:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JtcHm7M8;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 59455100003;
	Wed, 15 Jun 2022 16:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655310129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GJQRxlmrxOKS5u/8HoaiR1hKnUGyojQ25Nna+hlnqrs=;
	b=JtcHm7M8wlfWIQqS4//8A4yFz4OkcCiqYq3OWV8wxxePSkozDpz9ORM8P6RdPOaxkouZAa
	TGE1fyA+Lh89RGxjpp19yPhqmq/7K0MHp/Di1Mu7tosaUti7dbW69oEzoWUVctUG3Qk06b
	JaiNpk5VTx3Iuk6gqxy4WgdDMXM5ufeV//MtyPdI6I3g7JKt9Lrl3N2Ot3f925LNo597KO
	W0nW7EWeV0eqRbVXAnGJgfdWeUXkbTdYIb2EZfCFSLox+zYL48KnSK/y1W8ZsFRisqASEX
	Zijlb4wEoSmxrQxHg/h3pUCP6IyR0Bvx27tmXHUYAqmcV4zh/cLgl6cU358rqg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: correct description of empty-root-passwd in
 IMAGE_FEATURES
Date: Wed, 15 Jun 2022 18:22:07 +0200
Message-Id: <20220615162207.1153708-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jun 2022 16:22:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3008

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

"empty-root-passwd" doesn't actually set an empty root password.
It just doesn't touch the initial root password which is empty by default.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/features.rst | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index f7abb417ba..76bb3bceac 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -216,8 +216,19 @@ Here are the image features available for all images:
 -  *doc-pkgs:* Installs documentation packages for all packages
    installed in a given image.
 
--  *empty-root-password:* Sets the root password to an empty string,
-   which allows logins with a blank password.
+-  *empty-root-password:* This feature or ``debug-tweaks`` is required if
+   you want to allow root login with an empty password. If these features
+   are not present in :term:`IMAGE_FEATURES`, a non-empty password is
+   forced in ``/etc/passwd`` and ``/etc/shadow`` if such files exist.
+
+   .. note::
+       ``empty-root-passwd`` doesn't set an empty root password by itself.
+       You get an initial empty root password thanks to the
+       :oe_git:`base-passwd </openembedded-core/tree/meta/recipes-core/base-passwd/>`
+       and :oe_git:`shadow </openembedded-core/tree/meta/recipes-extended/shadow/>`
+       recipes, and the presence of ``empty-root-passwd`` or ``debug-tweaks``
+       just disables the mechanism which forces an non-empty password for the
+       root user.
 
 -  *overlayfs-etc:* Configures the ``/etc`` directory to be in ``overlayfs``.
    This allows to store device specific information elsewhere, especially
-- 
2.34.1


