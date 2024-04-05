Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BB9CD1299
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:22:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.15171.1712330540802008095
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 08:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i4dRjxZQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51BFDE0004;
	Fri,  5 Apr 2024 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712330539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oy+xIqVlqg7FfZVFjCUhvvlKSQCIQ6wJpypuhxQkukA=;
	b=i4dRjxZQLzIeLuH4/YCr9DTiVoGg08gT0DVGNDNepiSMsqXEa9esIrxHM/tD6paPp84QVm
	EqeAF8AsL2H6pOF0klktlXtJHt74YTg+OMSknIOLFGpbvEziSrJF0clImVmf7+ruSlK3xS
	qZ8mOwKwyJdLPLe5OBCsDaQEttjGCvIilmZN6uPmt3BrX9q41sDkckKiq/lhEsOAwQu2aD
	vXNdDLNpNWwa8Y9DT7m9wr0ux4L3TWaA7sUItl0XQYftTKMB3xDNliMshb2iopzvYhVpcJ
	idFnr5//yb5cB2k2URmHIrjagS3ej2dwZbbecw0DIHPI/wOlsdhsBTDIDZK3bQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 3/4] migration: add Miscellaneous changes
Date: Fri,  5 Apr 2024 17:22:11 +0200
Message-ID: <20240405152211.2285650-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405152211.2285650-1-joaomarcos.costa@bootlin.com>
References: <20240405152211.2285650-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 15:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5086

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index b8e18aa7f..c53d74d6a 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -130,3 +130,5 @@ option. Therefore, from now on, ``Nehalem`` model is used instead.
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
+-  ``bitbake-whatchanged`` script was removed.
+-  ``ccache`` no longer supports FORTRAN.
-- 
2.43.0


