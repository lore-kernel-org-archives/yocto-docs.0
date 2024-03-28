Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678B3CD128A
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 15:07:39 +0000 (UTC)
Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch [83.166.143.174])
 by mx.groups.io with SMTP id smtpd.web10.18864.1711638453724551319
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 08:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.174, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4V56N40cl6zp3q;
	Thu, 28 Mar 2024 16:07:32 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4V56N34yPrzMpnPg;
	Thu, 28 Mar 2024 16:07:31 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 28 Mar 2024 16:07:15 +0100
Subject: [PATCH 2/3] refer to new yocto-patches mailing list wherever
 appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-yocto-patches-v1-2-1124fa0bc532@theobroma-systems.com>
References: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
In-Reply-To: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Mar 2024 15:07:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5024

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

There's a new yocto-patches mailing list available for all layers that
do not have their own mailing list.

c.f. https://lists.yoctoproject.org/g/yocto/topic/105197684

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 documentation/ref-manual/resources.rst             | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 95728c25c..b5a6e4240 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -407,7 +407,7 @@ varies by component:
 
 For changes to other layers and tools hosted in the Yocto Project source
 repositories (i.e. :yocto_git:`git.yoctoproject.org <>`), use the
-:yocto_lists:`yocto </g/yocto/>` general mailing list.
+:yocto_lists:`yocto-patches </g/yocto-patches/>` general mailing list.
 
 For changes to other layers hosted in the OpenEmbedded source
 repositories (i.e. :oe_git:`git.openembedded.org <>`), use
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 8e54ac87c..8ffc4ca1e 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -66,6 +66,9 @@ instructions:
 -  :yocto_lists:`/g/yocto` --- general Yocto Project
    discussion mailing list.
 
+-  :yocto_lists:`/g/yocto-patches` --- patch contibrution mailing list for Yocto
+   Project-related layers which do not have their own mailing list.
+
 -  :oe_lists:`/g/openembedded-core` --- discussion mailing
    list about OpenEmbedded-Core (the core metadata).
 

-- 
2.44.0


