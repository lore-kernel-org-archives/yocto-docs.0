Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37768CED61E
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10676.1728459696718003580
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BXfOmf8x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 439131BF208;
	Wed,  9 Oct 2024 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BT7p07f6qzp1zznTX8i5hsTi9ZxYm4/WbiJyG8nnb4=;
	b=BXfOmf8x8jp+JyKoX2mORCFF2PA62ZnEMqLLUCYGmh4i+xqc/LTIZqJPIKhGPxAkI2Zjol
	W238Rm8u5cmyumQEunZtMg8pEhEe/EIj+Ohgnh6dfucVHPKNE+GbcOvBCth29WjuuujIlA
	bPM8pW+3j2/Ysyb9Y6dX95NxTczQaqIVopFGEe/LbTfAmQPLFOFxVzaJClMRgSxHXXfnG+
	QqMgdIjaIPnItCnGXDAF+WYUNmVuDTtqPtV2Rr7ViBSgRnZJ6H+RRHiPgKlftRO+yv1udu
	rBjysgnCVTTeuuNelVJUywOXGjxKpfenYCk92zY2Iytg4UBVqmVh6mbqv/iesQ==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 14/16] ref-manual: add mission pep517-backend sanity check
Date: Wed,  9 Oct 2024 09:41:12 +0200
Message-ID: <20241009074120.866786-15-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5421

From: Antonin Godard <antonin.godard@bootlin.com>

New sanity check to check for PEP517-backend compliance.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 0fce37cfa..f3874326d 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1478,6 +1478,9 @@ The tests you can list with the :term:`WARN_QA` and
 
 -  ``perms:`` Currently, this check is unused but reserved.
 
+-  ``pep517-backend:`` checks that a recipe inheriting
+   :ref:`ref-classes-setuptools3` has a PEP517-compliant backend.
+
 -  ``pkgconfig:`` Checks ``.pc`` files for any
    :term:`TMPDIR`/:term:`WORKDIR` paths.
    Any ``.pc`` file containing these paths is incorrect since
-- 
2.46.0


