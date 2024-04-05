Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD22CCD1299
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 14:35:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.13788.1712327711239963644
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 07:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EVedhelu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBDFDC000D;
	Fri,  5 Apr 2024 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712327709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGPndor7uryb8mLy9UziMCP8Wf8malUnyrORzrDlML4=;
	b=EVedheluY3Oa5a3BcWL6OydoRbII+WYQ9l87M6I02+mFN2m0X6XbMI1tQGxZ4tt4Sy1UMk
	1yrThwD/ND3mhJsarvVoU3YgAvuBZvYcL/HTsNhqK6d8ncHi6joAb3GvM0w6DNVXHVcoA7
	Gk/G+Q/UpEcHG0FyHtCgmDJ9EeuV2o2bQnWJx1CKFdKuYZ2q48cB/ZZpYVMMxxJF4+B2sz
	rRjuqhhmeIKI0bpOBANhIdy32PXTlyNnfNMnzGyv7eCuvnRD0iUrV7RzGYUAMZduI4YLOd
	ijAmW6HaUqi/yfdf88Bqu16RjNkCnT7YX43h+t8vvAswL7F0VrZ2/d+J67EyiQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 3/6] migration: add Miscellaneous changes
Date: Fri,  5 Apr 2024 16:34:50 +0200
Message-ID: <20240405143453.2281900-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
References: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 14:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5078

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index 72af77083..157a95733 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -130,3 +130,5 @@ option. Therefore, from now on, ``Nehalem`` model is used instead.
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
+-  ``bitbake-whatchanged`` script was removed.
+-  ``ccache`` no longer supports FORTRAN.
-- 
2.43.0


