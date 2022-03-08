Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23532C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 17:24:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.10886.1646760263649165303
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 09:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XYf5rRIt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D6B89E0002;
	Tue,  8 Mar 2022 17:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646760262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f9yEWHtSYsVR44ZC3oc+1fVIo9qowtj8OEUE33LCn+Y=;
	b=XYf5rRItkZF65K+1pEjbDrkDbYtTn+YQHgCoDKiZhez+6AqDVjb9qEvvI+q50ycRbG/eYE
	jBtnYeuOnpNrgNiernlW1zu3TyZl+wMNTZm/M0W3heE1MJvPn8AA5eHzZ7MhVYQQ6DxgrB
	i6+v9B2mkzBMwt+Tdt7QspAuApEtNti5P5xGDz6jAvGKKY3heqmQi22tmE1moUt2Q7J0G8
	tuVr1g+JazBRX1jz3eXmzNjNNW9uH+3PNS8VA8Cqxle6VHJzjWDNMBZOR1yzkntvix/j5i
	0TMGaDpVpQj/2aKfGuEO/+QGDs7O3g0lt+iZWTDSzDloAVvwYsQu2Q+XqUTNHQ==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: migration-3.5.rst: fix "distutils" typo
Date: Tue,  8 Mar 2022 18:23:54 +0100
Message-Id: <20220308172354.588113-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 17:24:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2547

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-3.5.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index b52ae7119d..556d7da0b6 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -54,5 +54,5 @@ Recipe changes
 - :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
   which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
 
-- The `disutils*.bbclasses` have been moved to `meta-python`. The classes and
+- The `distutils*.bbclasses` have been moved to `meta-python`. The classes and
   `DISTUTILS*` variables have been removed from the documentation.
-- 
2.25.1


