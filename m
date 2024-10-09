Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3328CEDDBB
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19651.1728487497354659758
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xh7l46Al;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5C42240016;
	Wed,  9 Oct 2024 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igqJ0YyDx6gFu51m5NAs/tzUpN/xk1y2PyCKPk+DhRI=;
	b=Xh7l46Alwrt6UFetKfiNg0AD1ayuO5pr6OlTynur/k1Qv/cZ7upv2uI9iFLhC3kzQG85yL
	ugbCqRMYTrKKDF6O7sdjB3SMQEFrZGaOdzacIFL928v1QTQl89ZyAUSTy1H1+MKkmusEeP
	sIgZlp3+TLc5864dBCgx6me6P0eGXlilEpAmUNEQRlyn+hJKl9b75HawvUn0If+wMBF/Kl
	tNeyk2t4i1b1prC7sq3DNiNQETHOX3M45EUa2mOxLAjj4VNgJ59k61COH0OvqAz4U4CWXq
	OICpO4UexFIjqixcZvXb+KZHpBaHRuy6R9PcYBIzKobJYXAP4Fjx/sBYzYTwOQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:17 +0200
Subject: [PATCH v2 09/16] ref-manual: add missing
 EXTERNAL_KERNEL_DEVICETREE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-9-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uE428EbSygLdIto84wRfRVihHybjmxmBYs1sG4le8ag=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBEFNoejDzYzS8la7gh/SmIK+CjNXylnDKeg
 sxJZODL/ViJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagRAAKCRDRgEFAKaOo
 NpMjD/9Ji41JjmCJps4ptHB0GUBiedghwwFE+HRmfl5+BqXdJzhi70q+7+v2dJCcI0/CzabRofY
 aE7WGfEYLIL5QQzG4V3EyqeOZxcOff7vrq7O3LQeKAUcMmLVzdFTNHl4e4zUhiP+lSOErebbauh
 wk0Ecqqw6BbHjHmyAaD0sq2RnPqin/jqvSRkBNfnXx0At8DQJ5KKAC6bzuj6zX0McAaZrHwPqlm
 sguSpfstXmNrckzXcvZii344+R4xrYzmwT2YAUdqgj/SKHo1+ukFp16ZV9N+64vpOq+RUuw6Nj0
 gebovqAjJgheV0eRFTzihFL9E31Q4cch0ucHImAkZYMRTlg4L6Sov1gRixjz07nx1q0gPYpb2CR
 5YslPFtE6YV97y+kCd8s7xzQSTkIWoT9eTsSsH8ZSSqrMpR4m/zntymtvEcbA33+0+vKb5cCcnw
 uMdYOUgKD7MBixOBBflgROGv8tgdLDvECXhipN+AywxEUePkyIWzQ08uP3ktkI1tNpHIN4CGQ9C
 7hKM9ZqY+YqSL93Fl9/zSEAYrfPe2PY2spDJT1sBnHyWbr5i9MoahJP8HG5gBiE+09bF2+qaVNH
 HbThFlh0KYHE3AqXePzvtLuq5Z+nF0mj7Ay/+V3sP7mpT18se2lxTvdhZEpWE3jEaVIkouHwi7l
 bWf1fp6y6q7DR4g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5438

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


