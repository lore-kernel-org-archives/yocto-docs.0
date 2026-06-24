Return-Path: <jaekyu.lee@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779A5CDB47C
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:48:10 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3337.1782294484980912894
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 02:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaekyu.lee@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 24 Jun 2026 18:48:02 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaekyu.lee@lge.com
Received: from unknown (HELO user1..) (10.157.71.236)
	by 156.147.1.125 with ESMTP; 24 Jun 2026 18:48:02 +0900
X-Original-SENDERIP: 10.157.71.236
X-Original-MAILFROM: jaekyu.lee@lge.com
From: Jaekyu Lee <jaekyu.lee@lge.com>
To: docs@lists.yoctoproject.org,
	jaekyu.lee@lge.com
Subject: [PATCH] migration-guide: 5.1: Remove duplicated typo
Date: Wed, 24 Jun 2026 18:47:47 +0900
Message-Id: <20260624094747.3447103-1-jaekyu.lee@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 09:48:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9855

From: "jaekyu.lee" <jaekyu.lee@lge.com>

- Remove duplicated typo, do_compile

Signed-off-by: jaekyu.lee <jaekyu.lee@lge.com>
---
 documentation/migration-guides/migration-5.1.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index 94b527bdc..f1c953c7e 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -23,8 +23,8 @@ supported, and an error will be issued. The recipe should be changed to::
     S = "${UNPACKDIR}"
 
 Any :term:`WORKDIR` references where files from :term:`SRC_URI` are referenced
-should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
-:ref:`ref-tasks-compile`, :ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
+should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`, 
+:ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
 
 :term:`WORKDIR` references in recipes
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

