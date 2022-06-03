Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6518DC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 13:34:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.7257.1654263257484386733
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jun 2022 06:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E5E81C0003;
	Fri,  3 Jun 2022 13:34:14 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] docs: releases: move hardknott and honister to outdated
 section
Date: Fri,  3 Jun 2022 15:33:53 +0200
Message-Id: <20220603133353.506482-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jun 2022 13:34:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2959

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Hardknott and honister releases are now outdated, let's move their
manuals to the outdated section.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/releases.rst | 44 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 08984b2b6..5d14954ca 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -18,28 +18,6 @@ Release Series 4.0 (kirkstone)
 - :yocto_docs:`4.0 Documentation </4.0>`
 - :yocto_docs:`4.0.1 Documentation </4.0.1>`
 
-******************************
-Release Series 3.4 (honister)
-******************************
-
-- :yocto_docs:`3.4 Documentation </3.4>`
-- :yocto_docs:`3.4.1 Documentation </3.4.1>`
-- :yocto_docs:`3.4.2 Documentation </3.4.2>`
-- :yocto_docs:`3.4.3 Documentation </3.4.3>`
-- :yocto_docs:`3.4.4 Documentation </3.4.4>`
-
-******************************
-Release Series 3.3 (hardknott)
-******************************
-
-- :yocto_docs:`3.3 Documentation </3.3>`
-- :yocto_docs:`3.3.1 Documentation </3.3.1>`
-- :yocto_docs:`3.3.2 Documentation </3.3.2>`
-- :yocto_docs:`3.3.3 Documentation </3.3.3>`
-- :yocto_docs:`3.3.4 Documentation </3.3.4>`
-- :yocto_docs:`3.3.5 Documentation </3.3.5>`
-- :yocto_docs:`3.3.6 Documentation </3.3.6>`
-
 ****************************
 Release Series 3.1 (dunfell)
 ****************************
@@ -66,6 +44,28 @@ Release Series 3.1 (dunfell)
  Outdated Release Manuals
 ==========================
 
+******************************
+Release Series 3.4 (honister)
+******************************
+
+- :yocto_docs:`3.4 Documentation </3.4>`
+- :yocto_docs:`3.4.1 Documentation </3.4.1>`
+- :yocto_docs:`3.4.2 Documentation </3.4.2>`
+- :yocto_docs:`3.4.3 Documentation </3.4.3>`
+- :yocto_docs:`3.4.4 Documentation </3.4.4>`
+
+******************************
+Release Series 3.3 (hardknott)
+******************************
+
+- :yocto_docs:`3.3 Documentation </3.3>`
+- :yocto_docs:`3.3.1 Documentation </3.3.1>`
+- :yocto_docs:`3.3.2 Documentation </3.3.2>`
+- :yocto_docs:`3.3.3 Documentation </3.3.3>`
+- :yocto_docs:`3.3.4 Documentation </3.3.4>`
+- :yocto_docs:`3.3.5 Documentation </3.3.5>`
+- :yocto_docs:`3.3.6 Documentation </3.3.6>`
+
 *******************************
 Release Series 3.2 (gatesgarth)
 *******************************
-- 
2.36.1


