Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AC1C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:22:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.286.1667838147118519148
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 08:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 317A660008;
	Mon,  7 Nov 2022 16:22:24 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/2] docs: ref-manual: classes: fix section name for github-releases
Date: Mon,  7 Nov 2022 17:22:05 +0100
Message-Id: <20221107-upstream-misc-fixes-v1-1-532ba173fc6f@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107-upstream-misc-fixes-v1-0-532ba173fc6f@theobroma-systems.com>
References: <20221107-upstream-misc-fixes-v1-0-532ba173fc6f@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Nov 2022 16:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3462

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

All other classes are suffixed with .bbclass so let's stay consistent
and add it to github-releases section too.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/classes.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3b33783c5..d418c3a89 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -723,8 +723,8 @@ class.
 
 .. _ref-classes-github-releases:
 
-``github-releases``
-===================
+``github-releases.bbclass``
+===========================
 
 For recipes that fetch release tarballs from github, the :ref:`github-releases <ref-classes-github-releases>`
 class sets up a standard way for checking available upstream versions

-- 
b4 0.10.1

