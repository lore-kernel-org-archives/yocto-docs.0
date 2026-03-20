Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F255F108B8FA
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:46:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9792.1774003591259413655
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0gaMY7OL;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0377AC40405
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B66A600E0;
	Fri, 20 Mar 2026 10:46:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF85C10450B9A;
	Fri, 20 Mar 2026 11:46:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jglCvn/ToogYqBP0PUbipgu/rNXsrAu5PyvOdLUEAxE=;
	b=0gaMY7OLvgebsHRxcytRu8DFu6yWvpuHrC86DO5CVj+fZSVGVeQJjM5R2vxaY84JSbf/OJ
	oGDa5AS029Frd61xEHGxqPqvOaqDQT9zorH3X+mmZRhgLpB5HFkahYqXn7YV+qXWhfNo2T
	VnKDL1ZOB3h1e2Gxz1aXMbD6Jt7H7OixZH/JifBVOUPLyVWJREnRBpg7jCgE4DDN8Bhqn3
	T60Tzdbwdf6SWerQuOGnV5xGKZXr9Vj3sQ5+CentHj0RleEFuFA9MkTRrs34S3Jsrfi5eS
	UeqtO5lq60IY9uck/GECED5SrYOClurE/4SDJ4VSwn1y9LEmMHh1C8H6xu9jJg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:21 +0100
Subject: [PATCH v2 3/8] ref-manual/variables.rst: SPDX_PACKAGE_URL: add
 missing parenthesis
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-release-notes-6-0-v2-3-1bdb1eb142ae@bootlin.com>
References: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
In-Reply-To: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FsfPs/CgoW2EE62+PXT/5Iv9wImlzuKPk8b8LcevD38=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpvSWBUYkRqFbBCD4ZpKdo2SWJLLgEysUgdUmOO
 C2c9UshzdaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0lgQAKCRDRgEFAKaOo
 Ngu3D/9fYi+tZ62CJzE0XOHnzg9BvpxZQhs6RhS9CL5kMlxFrsgQYwlcaMSM1zPIvTW52Ui9WzF
 4RNnYOLNAHOIQedlqO8GuKvx7Khe8XWU8IzNzR4rgHF4UoXhNNTDZhDCUt4sIwDe1AItsilezmd
 +V9bTwhTxZveV7pAXHMwwYZOn0nHD61tCFF3BaIaOuPM8NRAhIiHNoqSeqrRhxefSJUSubpWcFx
 xo1P5FloiuvF1+O+5GxVpzo2TYe27MrzqhdZizNB19N8AVit8znHmjTc/pFkNrAq+XMkIr02nKN
 ZlQgjBrsRJe9WTVbpQRcBHRd66kqA7XO9yaPIQULR7b+Yn4LclMU9EW5TYPHK6xv/bCSqN6Ka9Z
 LCG2ES0Ujcf60SpFtm+VslTRawgWkY8ycCHmxByC8TL8KCATYaE0Y9KghauhXNmWI4QHFUePZ1T
 Ty+SvzEcqCw1kzqGtuetTtUaEWjcdnvasj28daJxnJj8YmcCcTybpL7Dr1MbHDslMo+If8NPL8q
 rKi3NlyUCcM8LzdBi5+M+KlGhSpvBMkshizEVz8xzQtuN9EsXQdvd9cYy+FVa0PKI5pMZrBP1js
 nuF9zOa6it/eWODFd7cnU6p+RAbFS2tlXLYqG/VWrgXbAck3Y9amVufoU3eLnHyY73PQfdEM+TV
 Jmbuqjq7LUZnKYQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9104

Fixes: 108549dae76a ("ref-manual/variables.rst: document SPDX_PACKAGE_URL")
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e24c4bbf8..45542d715 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9338,7 +9338,7 @@ system and gives an overview of their function and contents.
 
    :term:`SPDX_PACKAGE_URL`
       Provides a place for the SPDX data creator to record the package URL
-      string (``software_packageUrl``, in accordance with the Package URL
+      string (``software_packageUrl``), in accordance with the Package URL
       specification) for a software Package. The default value of this variable
       is an empty string.
 

-- 
2.53.0


