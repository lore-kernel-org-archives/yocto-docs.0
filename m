Return-Path: <jaekyu.lee@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C01CDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:52:07 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7767.1782381121377114951
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaekyu.lee@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 25 Jun 2026 18:51:58 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: jaekyu.lee@lge.com
Received: from unknown (HELO user1..) (10.157.71.236)
	by 156.147.1.151 with ESMTP; 25 Jun 2026 18:51:58 +0900
X-Original-SENDERIP: 10.157.71.236
X-Original-MAILFROM: jaekyu.lee@lge.com
From: Jaekyu Lee <jaekyu.lee@lge.com>
To: docs@lists.yoctoproject.org,
	jaekyu.lee@lge.com
Subject: [PATCH] migration-guide: 5.1: Fix typo
Date: Thu, 25 Jun 2026 18:51:54 +0900
Message-Id: <20260625095154.3878438-1-jaekyu.lee@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:52:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9896

From: "jaekyu.lee" <jaekyu.lee@lge.com>

- Change do_compile to do_configure

Signed-off-by: jaekyu.lee <jaekyu.lee@lge.com>
---
 documentation/migration-guides/migration-5.1.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index 94b527bdc..70e034bc8 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -23,7 +23,7 @@ supported, and an error will be issued. The recipe should be changed to::
     S = "${UNPACKDIR}"
 
 Any :term:`WORKDIR` references where files from :term:`SRC_URI` are referenced
-should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
+should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-configure`,
 :ref:`ref-tasks-compile`, :ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
 
 :term:`WORKDIR` references in recipes

