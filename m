Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74009CED628
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10718.1728459695471092531
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ChDi5zex;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F19DD1BF205;
	Wed,  9 Oct 2024 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17ls9VnUK/fJgHBda6huXXb/Qdm/KTAcvjZEbPNY7Aw=;
	b=ChDi5zexPcadt7CCm9wLN40gAm4tOe9C/fof0wiy6FaaG/BwvLSN4RCbm6JHomnqJXeYK/
	qHQBtdO0E02UrQmGOXV+VWxHGyFseE7imdAv7eCI6a8Nghq3ttguOuVjE9uFqX5x34rlPi
	/nitgCvG6uT6apJmFpK7s3OxmUDHCB19j0WYSK6L3WcHdzJPkAcyjzU7URCpoYnHQE7KdX
	27jamHYqEzHGuiKuLgmznhkhR1OTZCRDeh/zVZp9LnukRNRFmwjm8hWMNwy+Pc9BGvKb6T
	s+WSmNhwbRwqsYxJ3VYTXPUbTfrUvEt1IG78UtrlRtBaYNaPwnchmRaKVZPYbg==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 09/16] ref-manual: add missing EXTERNAL_KERNEL_DEVICETREE variable
Date: Wed,  9 Oct 2024 09:41:07 +0200
Message-ID: <20241009074120.866786-10-antonin.godard@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5416

From: Antonin Godard <antonin.godard@bootlin.com>

This variable can be used to specify one or more compiled device tree or
device tree overlays to use in addition to the one compiled by the
kernel.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cad626317..5744eeb9e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2526,6 +2526,13 @@ system and gives an overview of their function and contents.
       external tools. See the :ref:`ref-classes-kernel-yocto` class in
       ``meta/classes-recipe`` to see how the variable is used.
 
+   :term:`EXTERNAL_KERNEL_DEVICETREE`
+      When inheriting :ref:`ref-classes-kernel-fitimage` and a
+      :term:`PREFERRED_PROVIDER` for ``virtual/dtb`` set to ``devicetree``, the
+      variable :term:`EXTERNAL_KERNEL_DEVICETREE` can be used to specify a
+      directory containing one or more compiled device tree or device tree
+      overlays to use.
+
    :term:`KERNEL_LOCALVERSION`
       This variable allows to append a string to the version
       of the kernel image. This corresponds to the ``CONFIG_LOCALVERSION``
-- 
2.46.0


