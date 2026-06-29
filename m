Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42D0C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:46:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39140.1782744380823482972
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gsO6tMFs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2DC8F1A0CF1
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 032CD5FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51A03106F18A8;
	Mon, 29 Jun 2026 16:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hkKaNcozykpzWKDyvt7lvwfVexfOBlyN7OO0ZPkOIl8=;
	b=gsO6tMFsqvUiZupDs4yaocDMy/0H5bkdFyseLX2K6MhMg9z/5to1Z+JDeAcszyA6Id1nOr
	umE1LUJUFkNNCMDGkwmjchod/9mXrKH5hHdfWMiG8f7nYnv0CItesGbFv4bfOdk2URLTTG
	IsGXBNU6e1ImSdZWPFG5zVzJA2ykfpCCcACEJkV8CBCP6+ifBNzZnIxZyfuWWtg2qYEoDt
	mYZcNV6G+vm+Ppf30VKT4yuTeqj2HZChKxg8rZw8MWWKG4BHXN7wLe3onNe/x/ryJNi/5X
	6fKV0NKKotBLdHGnMMlkdLbKjP3ixSJp+c8lgRWGk+J6gZdBDm0KrKsRqCZAIA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Jun 2026 16:46:10 +0200
Subject: [PATCH 1/7] ref-manual/variables.rst: document the USERMOD_PARAMS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-master-updates-1-v1-1-ad9b047f9ff0@bootlin.com>
References: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
In-Reply-To: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+EMCP75PO/wxHt/P7IpXtuvMMdAPSnnfn/OQPt5IGM8=;
 b=owEBbAKT/ZANAwAKAdGAQUApo6g2AcsmYgBqQoU32awgzrhWagGcYuLjPkkQzOlTZUo5T8Aql
 QSVMxpgDhaJAjIEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakKFNwAKCRDRgEFAKaOo
 Nn7bD/iuf0uI5E60s0REQwf7n07wIvDGqlqX9uFrALsvCu2XfO62pgOu94gv2nEJVzxBeRMFnAU
 qSjwNZyjaV+96PgpXZxtDXOkXALJra7zOHgSJR/d8Pmn4JDVnpX6XBoV/w6+rdcZu05R8UN2RZZ
 xhcJRri8GiWUnR5za25DU5htTDSm0IcjcNHADExuuHnDvB5Q6D79aSZzuHaQuCRlU6eop73Al4j
 SPO7jTeco59gmQweT6AFH8CRNNaQUgHMokF/n0QhdNIrWyqzn4zWJeMP1N14pyPYuFL/QTaFM2+
 xCE2WXhr0tPQh8OvH1GlhFsGU5Rg/vQVe0AUnoJ9W2AsGBh9WPz5JcdYRxsAZiJstr/cTh5id6k
 ekPpHAPUuHnXVND3wYhxC1nlfYp9qzAqKVWjjvfuad3lAL4bJ0bXI+4zEFx4eNo7Ub4XnsGrk7p
 bLwuWWkjhuQ0Zxg/6dC6yVPaTj/lt4eL9AAOjOAnfdTVEmfckGzoY6b4Aw4s81WDm4gNO7RUKRY
 jk1llQNeBmkiU/EJayN9MR8tsyL8j9CKsbqF2jUk+cac9DPtlu3uyA88qsZZY1me8igJjqYT6Hl
 3Z+D6yftarJKVNH+88J7E/Gj/rtgHnMSSftarLlsxpVJQVh6uXwpV8QdCTgjpZ0GCL3gMReLrcj
 acOz6gIucwI5M
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9974

Added by commit b8da733ab12c ("useradd.bbclass: Add support for
USERMOD_PARAM") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b4c6bc957..5713da32e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -12283,6 +12283,14 @@ system and gives an overview of their function and contents.
       Additionally, you should also set the
       :term:`USERADD_ERROR_DYNAMIC` variable.
 
+   :term:`USERMOD_PARAMS`
+      When a recipe inherits the :ref:`ref-classes-useradd` class, this variable
+      specifies for a package what parameters should be passed to the ``usermod``
+      command if you wish to modify a user when the package is installed.
+      Is is typically used to add the user to one or more groups. For example::
+
+         USERMOD_PARAM:${PN} = "--append --groups group1,group2 user"
+
    :term:`VIRTUAL-RUNTIME`
       :term:`VIRTUAL-RUNTIME` is a commonly used prefix for defining virtual
       packages for runtime usage, typically for use in :term:`RDEPENDS`

-- 
2.54.0


