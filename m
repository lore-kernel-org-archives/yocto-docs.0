Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F57CCF9F7
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:43:00 +0000 (UTC)
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
 by mx.groups.io with SMTP id smtpd.web11.11090.1761759778313607425
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 10:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cxZMh5mdWzT3g;
	Wed, 29 Oct 2025 18:42:56 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cxZMh3BprzHbK;
	Wed, 29 Oct 2025 18:42:56 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 29 Oct 2025 18:42:40 +0100
Subject: [PATCH 1/3] kernel-dev: common: migrate bitbake -e to
 bitbake-getvar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-bitbake-e-v1-1-c06ad212db9e@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7904

From: Quentin Schulz <quentin.schulz@cherry.de>

It's recommended to use bitbake-getvar for a few releases now so let's
use that instead of bitbake -e.

While at it, use a cross-reference for "OpenEmbedded Build System".

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/kernel-dev/common.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index bd6c3fb2c..ef9a8d8fe 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1431,15 +1431,13 @@ Expanding Variables
 ===================
 
 Sometimes it is helpful to determine what a variable expands to during a
-build. You can examine the values of variables by examining the
-output of the ``bitbake -e`` command. The output is long and is more
-easily managed in a text file, which allows for easy searches::
+build. You can examine the value of a variable by running the ``bitbake-getvar``
+command::
 
-   $ bitbake -e virtual/kernel > some_text_file
+   $ bitbake-getvar -r virtual/kernel VARIABLE
 
-Within the text file, you can see
-exactly how each variable is expanded and used by the OpenEmbedded build
-system.
+The output of the command explains exactly how the variable is expanded and used
+by the :term:`OpenEmbedded Build System`.
 
 Working with a "Dirty" Kernel Version String
 ============================================

-- 
2.51.0


