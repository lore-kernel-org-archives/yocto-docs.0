Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA98C46CD7
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.2907.1702935258941247236
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KDkVy8qr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F49840002;
	Mon, 18 Dec 2023 21:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cX6M920vlMgKz7XgWTWJh1ORBHTdkxdjWZq3CfC3Bjs=;
	b=KDkVy8qrhgj/Tpmp3gBRbImXrooYhidRVD0NcIxpx5r1HNDpmA+gb135qH70S4WFkKiQcq
	rvp1dy5YA5edy8MWSa8cgSs28d9THUU1ZAPaIHiVSx1KSTx+lFfRfCr1K5xlL0sU3qtHbz
	NPpec29vkCfIOsfczhAcJ7Dphd4rvw51eJG98m0KoBaJ7K5yoJuSy9c2mOj/vOww1YXdwP
	QqilVjcX6bSUld3egzksqlIUD9yUEZc9HtwoxFePLjFW21/FNaZvgdyocrcmMwCj+xfBEb
	ovCAdSShvmKMHn0RBmEtv/gzjsXwU8chLwW6eJXlt73beYxYXPj95hihjLM9Gg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Lee Chee Yang <chee.yang.lee@intel.com>
Subject: [nanbield][PATCH 16/20] migration-guides: reword fix in release-notes-4.3.1
Date: Mon, 18 Dec 2023 22:33:30 +0100
Message-Id: <20231218213334.146370-17-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4702

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Reword a fix to align with the final release notes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.3.1.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.3.1.rst b/documentation/migration-guides/release-notes-4.3.1.rst
index 377cdb43f4..cea9c538a2 100644
--- a/documentation/migration-guides/release-notes-4.3.1.rst
+++ b/documentation/migration-guides/release-notes-4.3.1.rst
@@ -19,7 +19,6 @@ Security Fixes in Yocto-4.3.1
 Fixes in Yocto-4.3.1
 ~~~~~~~~~~~~~~~~~~~~
 
--  Remove references to apm in :term:`MACHINE_FEATURES`
 -  baremetal-helloworld: Pull in fix for race condition on x86-64
 -  base: Ensure recipes using mercurial-native have certificates
 -  bb-matrix-plot.sh: Show underscores correctly in labels
@@ -54,6 +53,7 @@ Fixes in Yocto-4.3.1
 -  machine: drop obsolete SERIAL_CONSOLES_CHECK
 -  manuals: correct "yocto-linux" by "linux-yocto"
 -  manuals: improve description of :term:`CVE_STATUS` and :term:`CVE_STATUS_GROUPS`
+-  manuals: Remove references to apm in :term:`MACHINE_FEATURES`
 -  manuals: update linux-yocto append examples
 -  manuals: update list of supported machines
 -  migration-4.3: additional migration items
-- 
2.34.1


