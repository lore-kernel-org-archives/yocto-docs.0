Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A5ACEDDBE
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19649.1728487496765998658
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OXOjAMyz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D339240012;
	Wed,  9 Oct 2024 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqnTR88bqtHFP0vxTZAfeYEI7QkH1DdkSi04l+A85ts=;
	b=OXOjAMyzXsayNAMWsNzYG94KXfRRyg3uFuQ3S31stDJo4HbtAKMaKU6xJ5+2EUTQojibPg
	JxmOOfjWGSOl9asrqYQabp5436wVy6pXWmZIrhz2V+0G4sVgr6kHOYnODR4v/u6vMYmjRf
	cq0f+RxZhGAFl7Y5+EZ2k6txMHf+U/ZmGKsem3a1lbzpTFnc/Bnxc49VY5hp3jsjLl2G5I
	lUe2hkUerFVDAM1UuLSOplvGthW4AGYG6jSo9yZOjfacZknhMaZE+B44LJFNDtWPy9kDAH
	gIiIr5f57/n2df0a77nBt7MuFAqETTi3zlmR/zIxWD4vPQuMx5WxwdVOytb38g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:15 +0200
Subject: [PATCH v2 07/16] ref-manual: add missing
 TESTIMAGE_FAILED_QA_ARTIFACTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-7-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+WYBC6XhlQZrxSjOIwzyfdukkNFUhq1yL89xlJHvFws=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBDKb/WMS+K6//fHdmNOZL9KF6f+3fA9GTot
 JWryexOhBeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagQwAKCRDRgEFAKaOo
 NnveD/9kgf2vn5eZFNuSHbH0f3iNi4hU5oYGoqX1FpAQJ5M81+S7TGbRla2B0nxIy6hpurTc8AF
 rMKYCIluyKyXMO/HIbd9iGfksH5SY0DKV5pKrnpQll5HICxJY3/Gxi1P/sFtzYHxW+0WV0v5eeq
 JSPo2q1nuLspbeqLMrTqky3qPcyW5dGeqiD8m0tAbTJMcqHhg6FHmlz4K1pbdd925pB7flwn5dH
 dgyel3qRKE/xvn5xvhtcRXuT/umgTMSqQr3K45zaynZX3boE+VeOTBieKEgVEeMtk6Tr42Iqi9N
 cMGWoyqIFxOlUFP7wiJVpLO9bwKS+xgk3bTGBv7KHILUPR4IbYlBc7GSczDB1BXGQFD+GlS3K3Y
 TsLeYSVL9oJ+79NSESHnh65wfvMd3Wme5SVvMofRPnIZOMDdNTMCflbNtRk2MMgMEN+DzHi2cH3
 ZD2qKx+NUiSp61sTTUReOhj4fit1R07Q+PPdXYgajXRgoVkOops6N+sAGXhxpk3VxPr0hNTKvTn
 YnfMoxMjjrNDtT++XZjwO4r94pQPPy0m18BlSxn//lYGq7ewui4x4qBX8KkZ1SvuldOMAej1q47
 qPWUgYDLmjYqLWK2dLMMWP5h5EZBScsgj8nWkXQesCNA6BJI7KyM8EB/Bd2Rlb7t5EywLOhsTgH
 jo9wsqx+Pd6tQdQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5436

This variable lists space-separated paths on the target to retrieve onto
the host, when inheriting testimage.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6af05c810..9eabc4a0d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9267,6 +9267,11 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`ref-classes-testimage`" section.
 
+   :term:`TESTIMAGE_FAILED_QA_ARTIFACTS`
+      When using the :ref:`ref-classes-testimage` class, the variable
+      :term:`TESTIMAGE_FAILED_QA_ARTIFACTS`  lists space-separated paths on the
+      target to retrieve onto the host.
+
    :term:`THISDIR`
       The directory in which the file BitBake is currently parsing is
       located. Do not manually set this variable.

-- 
2.46.0


