Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E20C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:22:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.289.1667838148121606721
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 08:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 1B91C6000A;
	Mon,  7 Nov 2022 16:22:25 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/2] docs: ref-manual: classes: add missing closing parenthesis
Date: Mon,  7 Nov 2022 17:22:06 +0100
Message-Id: <20221107-upstream-misc-fixes-v1-2-532ba173fc6f@theobroma-systems.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3463

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The closing parenthesis is missing in the sentence so let's add it.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/classes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index d418c3a89..3e7deaf47 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -959,7 +959,7 @@ Yocto Project Overview and Concepts Manual.
 
 The :ref:`image-buildinfo <ref-classes-image-buildinfo>` class writes a plain text file containing
 build information to the target filesystem at ``${sysconfdir}/buildinfo``
-by default (as specified by :term:`IMAGE_BUILDINFO_FILE`.
+by default (as specified by :term:`IMAGE_BUILDINFO_FILE`).
 This can be useful for manually determining the origin of any given
 image. It writes out two sections:
 

-- 
b4 0.10.1

