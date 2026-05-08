Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3944CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:44 +0000 (UTC)
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1701.1778259582233599032
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=cYul9v5n;
 spf=pass (domain: 0leil.net, ip: 45.157.188.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMc5dD9zD1f;
	Fri,  8 May 2026 18:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259580;
	bh=ZtCvDy3fap/FujmFTv2JhqLlNMs3e+1tEH29fVOaf90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cYul9v5n6NSoEhLRNQpvQu5O2Hz2qGbFYzxgO66SJxtx1JQh0wFXs+wtrvvNe5svt
	 W3su9nVPeqb6yB32dvOIcH6GQJ+m16f3p8+taXYD35PRr96qiBTxRjjrimml35YbvK
	 0ooIdDAZ1WYyS0j4v5FnR2m/049Zz9Qq9ExzXz5A4Alsc9uw+M7ajchRWLomJg4FAI
	 Afks8Sv1vdOW29R7Dm+gpXMLaPfsdPaoXJezXJyLZm+bc9ZGtFbJyYGjNw52CIbN/A
	 wrMs4mRsR/Me+ZUqHvmvvbL++Y/yxJ9lbwAfQPhB0OeJp3KlZvCdgNA5Eg3uaa9EOi
	 gchgw3qHZwV/Q==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMc395dzlt2;
	Fri,  8 May 2026 18:59:40 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:35 +0200
Subject: [PATCH 11/11] ref-manual: variables: add hyphen to "space
 separated" and "auto generated"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-11-8fb61b5358cc@cherry.de>
References: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
In-Reply-To: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 16:59:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9416

From: Quentin Schulz <quentin.schulz@cherry.de>

So we're consistent with the rest of the docs.

Fixes: c34bfa05cc10 ("ref-manual/variables.rst: document the SPDX_PACKAGE_URLS variable")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ac515939d..10572e7af 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9667,10 +9667,10 @@ system and gives an overview of their function and contents.
       is an empty string.
 
    :term:`SPDX_PACKAGE_URLS`
-      A space separated list of Package URLs ("PURLs") for the software package.
+      A space-separated list of Package URLs ("PURLs") for the software package.
       The first item in this list will be listed as the ``packageUrl`` property
       of the packages, and all PURLs (including the first one) will be listed as
-      external references. The default value is an auto generated ``pkg:yocto``
+      external references. The default value is an auto-generated ``pkg:yocto``
       PURL based on the recipe name, version, and layer name. Override this
       variable to replace the default, otherwise append or prepend to add
       additional PURLs.

-- 
2.54.0


