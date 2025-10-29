Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E450CCF9F8
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:43:00 +0000 (UTC)
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
 by mx.groups.io with SMTP id smtpd.web01.11097.1761759778736470155
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 10:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cxZMj10D9zT3j;
	Wed, 29 Oct 2025 18:42:57 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cxZMh5fLbzGL4;
	Wed, 29 Oct 2025 18:42:56 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 29 Oct 2025 18:42:41 +0100
Subject: [PATCH 2/3] ref-manual: variables: migrate the OVERRIDES note to
 bitbake-getvar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-bitbake-e-v1-2-c06ad212db9e@cherry.de>
References: <20251029-bitbake-e-v1-0-c06ad212db9e@cherry.de>
In-Reply-To: <20251029-bitbake-e-v1-0-c06ad212db9e@cherry.de>
To: docs@lists.yoctoproject.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 17:43:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7906

From: Quentin Schulz <quentin.schulz@cherry.de>

Wherever possible, we should use bitbake-getvar as it's the recommended
tool so let's do that.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 591c03028..1f55d1c00 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6472,8 +6472,8 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         An easy way to see what overrides apply is to search for :term:`OVERRIDES`
-         in the output of the ``bitbake -e`` command. See the
+         An easy way to see what overrides apply is to run the command
+         ``bitbake-getvar -r myrecipe OVERRIDES``. See the
          ":ref:`dev-manual/debugging:viewing variable values`" section in the Yocto
          Project Development Tasks Manual for more information.
 

-- 
2.51.0


