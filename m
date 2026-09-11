Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08D7C88E58
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:11:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41832.1789139517374584982
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BJEGf7gn;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12B08C63A0C
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:12:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40EDA601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7ACB511C7AFC1;
	Fri, 11 Sep 2026 17:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+3zDB8Kk/9Ae12ewE9nlfG92PGb/UKSuHjDKssfn0qk=;
	b=BJEGf7gnTX4zBFejOo268UZDeIH/yF73uNdysOx8irjjBb+vgr/tUnypujI2/M3woseIrS
	eKogbu30DCRDxsDa31KH9A65PT4G26I8Pod6j0vjB2/gfO20oaRv3oGJ+JP0oSthTDZTSz
	3HZ5s1NRbuXbFes8N+jSP76PLPQKvxiIdOH9vur5yRZrXvu2AKI9Ql392TbG6Ro7NG6p+e
	51kUdwIliCvSdWNzohpfKZVxKgW0/uUDKjPsHwO9b9fBtaa+4dhunHFwtK3y0d8fEpI/sr
	EunRzWJHvb2s0bp60+AvdMQcDU6rwsKv3yxYFi0Vr6QabdYUgENuvlZ8p2XjhQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 17:11:12 +0200
Subject: [PATCH 6/8] ref-manual/variables.rst: GCCVERSION: replace
 local.conf and mention recipe existence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-remove-local-conf-refs-v1-6-322e1e9a232d@bootlin.com>
References: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
In-Reply-To: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TVJ2BPfHb1W9q6jFn/PMe8PsJCYk1OAfaQa2eAEHjXM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBoXIS0YmxFexlk0Or5IDBJ6EWuPKUfNBa8BS
 BLgyWEk03qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQaFwAKCRDRgEFAKaOo
 NvJREACnuIhHUG7SBH32W1sAZJJFBX/MrZGNmhYBr7lj7Tb3d/mzCDvAf/iyduHJgWhLD6X6g05
 MMe8xgYSYjXFIIY8qlNQixOYh40jKvsDLtXh7x0KeOjo7qOxSm8ToSgbquCzG7UF6DJiIYbmQ4g
 LUPjhKX4xKLr54EJtchYi+M2GL83IGa65LLqwtYlD8Mwvefnv9uAcCnVldVBTvg9rrQh3dJym57
 7htB8D7At0NZy/wmSxuEB9idEt3BAVlcEFk7v3eYpesZITsFnAGeUwvBsnJ4i+L9gvzO8Fih/2/
 Jeo9KhOBkF7VVJhyXSt8ELRZWq2mpHN+xiJvKoNMg4JMq/dFqZxZRQQ0vg5mFN9DWqGMw5JQSKs
 oW1/GKHcqyKV8S9BgMtJb92ra09NaaNijUxDbYGcHAgjDIZHBEXZQNovaZVeEcNUNUX3U4eSlrl
 K7Fr26BfJVkPHIxKBFZ8WlWMZbq+se8Rq3NDrQeKAgMRFYv6L/FbLMFbW7h4dX+Bpd0WQWOUnhk
 YbRaVc+UEQcaa4DeJkGQsyit4QXHopi4h4fNYahAAwqoE+NEGHX0yBEX/rAWl/sqymsjoUdCaeF
 nmR3s/Xi4/yC44RLHDytWqaD/vTsbMbnB67npvvpk+19BGjWsJ7iaYn/IYXtoGvTMDTxVe6dIhS
 QakKxh1pK7gzGdA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10475

OE-Core only provides one version of gcc et. al. Mention that recipes
with the overridden version should exist.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f76e5ba4d..0df84b463 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3834,7 +3834,8 @@ system and gives an overview of their function and contents.
          GCCVERSION ?= "8.%"
 
       You can override this value by setting it in a
-      configuration file such as the ``local.conf``.
+      :term:`configuration file` such as a distro configuration file, granted
+      that the recipes associated to this version of GCC exist in your workspace.
 
    :term:`GDB`
       The minimal command and arguments to run the GNU Debugger.

-- 
2.55.0


