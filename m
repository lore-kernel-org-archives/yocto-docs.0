Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EDAC44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:46:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93800.1782744383313686935
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=W2ltiCs9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A746E1A0D1D
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 768C45FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62D5C106F18B3;
	Mon, 29 Jun 2026 16:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jZ/fOuOpUJQFSg7JrnNcToRef2WcpyiPXLxgw8wDPlY=;
	b=W2ltiCs9J2kSH/eNW8lsJWerMnJdEAvAEKxu0MDj0q4PJQo4MnKKdT9Odb3gV9fPCiFDAg
	ZYsknIInJj2IsYm+i8W8aWXVuDspQIEirvR4+Sjf9OFt0rSLL5BJqsvZKyDh8nj97L7Ci9
	TifEFQd4SqPPBp/pBezHwCx8E6+rv6EGJPT5rwV92G+wZz5fUOgASpqmCZ8MUgwAG7Bt26
	/CryYOxKMbjZZWWGxWWVjK1kU8ivZv9VSEWPBnC1W2qvVj3UPLmNiNtBtGvtBOavhorDH2
	Olx6I/gj0M5doYbWxi/Vgj2XuRxgcjRy5cgLB6CbRwKT80gXcB0FwbM8d0cGCg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Jun 2026 16:46:13 +0200
Subject: [PATCH 4/7] ref-manual/classes.rst: document python_uv_build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-master-updates-1-v1-4-ad9b047f9ff0@bootlin.com>
References: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
In-Reply-To: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4Fa1ZEcUgrwaE6E1Hzv0B+jE5rH8fhJdVJqF8Ct0Dbc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQoU4wjVBD/nJr5TsLkAC+i/3E1AXmCWK4kJy8
 6uAB/KYVEyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakKFOAAKCRDRgEFAKaOo
 Nhe7D/wOQgU1MUbba+X3hJ0ewmisYAt/PKWyafEpZgcYvXp53m/bMpCXAeG51EiZZvVItiSabDN
 sfSAt3KbtlpjSobxnKnMbfJQFMlqgK5lnrCcrcSTKOiZFAa7U+DbBnX3vXs6eo5+jK25KohIrmM
 TbmxfzdCdEFOCjhUBjix2UHM4edtVX8MgmREQLEzU6nO/SeLs11KxykN2v5BW/Qd67N4SWqkTUG
 pTTmiUx4NEEp3/KRzuG1gntLiaGsUQyaDwPOjRrMEVmJFz3zgJbJ0DIHzLwhd1ZGFQ6/LPp6KOp
 ek5LkqkHygz9Zs5+P6SlQMjGMB0kz3ky5cZPewQwxoWDjAUw+DphzqnsHqnjH5rKhKb0pXPFcTk
 5i/Tq/H/7FPXsPivLfn02sxLSSJH5Eyu2SYmsFxiPgglOCZmlVqujH3z/DzNJ6Z06Puy5aLjRBY
 cztt2D43NSbRnkVzvzU1JGg93L6NEpIbHlsWwmIgdtGcygDRmRIz3KgRJhHUEotRS2iF5jS5Flq
 0JLdYEZNyy30znLJRaT9vvoYUGcaAtXyum6ssq9H37U/NZjadUNT7oSG87P7ax0iF3iP7FEXa9f
 szUB9gRJ+h8ky93V/Ta7REHfIPkgZnRPFL8s8DOEB6X191JvxLUIJnSDVHuYtrRrXjvA5KhlQQi
 jH1T9FKjdpGpvUw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9977

Added by commit c535a9f5dbdc ("python_uv_build: add PEP-517 backend
class") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 7b220a284..c30871061 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2261,6 +2261,15 @@ environment for cross compilation.
 This class is internal to the :ref:`ref-classes-python-setuptools3_rust` class
 and is not meant to be used directly in recipes.
 
+.. _ref-classes-python_uv_build:
+
+``python_uv_build``
+===================
+
+The :ref:`ref-classes-python_uv_build` class can be inherited in Python recipes
+that are built with ``uv_build`` and which are `PEP-517
+<https://www.python.org/dev/peps/pep-0517/>`__ compliant.
+
 .. _ref-classes-python-setuptools3_rust:
 
 ``python-setuptools3_rust``

-- 
2.54.0


