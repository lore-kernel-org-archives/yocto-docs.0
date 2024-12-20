Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE1FC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.150621.1734697027663586383
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DoKW9PDA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28A5140012;
	Fri, 20 Dec 2024 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vIavEUL3zPLgvzNlnpAzCXMPRDDCgMrhPHMcCuTFh5s=;
	b=DoKW9PDAhdukA6wDlxW47/vgdfoBhnP3UJ7FGTUCtygSV4noakmihLLdbW0SPVGfg+JIyP
	GnboDezwLOuBSsK11bTSfdeshNJhDYeox9ardsngfS1aqPXvljVGM8t8caNcIJxGmmdKR7
	+9ewtC+Ud6hFhzUOZvjp40h6e1IWN+o/Km5IRyO6qvC4Q6RkynCz3RAtuporl4S9PKyLSy
	RkH49THzlKPUgMfAADpeap4wE5hB98AZn8YQQqfCYc+V7Qd/eiKrxZY4KJNnlTf+jOTaYG
	8XAEspiV41QCBJ4EfT6kwhE/SC0c9xlHRj/QBWq24V/87mold1Z7l+aCsShx/Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:37 +0100
Subject: [yocto-docs PATCH v2 10/14] ref-manual/variables: document the
 CHECKLAYER_REQUIRED_TESTS variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-10-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=GjHg/MTU0FmqwIJA63IESL2xicp+WVEb4GhBM/WjPpg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA/9uQ7DmE6zhuNm6oaPlTAOWgkHNJFgASN7
 +cBcnESL5CJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPwAKCRDRgEFAKaOo
 Nv6cD/9oEzX3XGtlHC0aj59fxCk8LPTlRalfZVC214WD9r3t8RbVTeBTeSfnxeWOGxSHSIAiWm3
 vN+0eVP0/jz0AyKM9q75jV4AAG+YeXadZ47GmLdcpYqNRMTZLv/DwBoK61tdJ2w2u/b1fky+dU8
 uQOUvYA2fUkoVg6JAe4HNogL1aSHlj1qhc+N0Qq9lE9YvFlXvkjdi73EbQ3C1sDk7oDWe6uW0JY
 PVUil2K7UZ6a/pBde7hJibslxCT/Egl4TtrfkiyNZ+dYdoustfbozzWbgC0YloBQsqQ0iPeTLyp
 UJHZkifYvzXROZzMXXzPUF9r4CgpUDfZDzMMFY/mGYOZY/aOvBPVC3uzh42DvazSq3QK/wucupQ
 hgza95RXQ77HJTihkdibIve4ofQT/j8HfmER7170QyknYQhYptoNBVITIcWkJINXIs7j8VJKvKE
 gzYpcWrSDxEYfCELuQFAMonBXMsQNkBO9lAQgpHdoz2enasIW4zmUFvhdE5/YntEnZO7rl6TAat
 XKOncbws+VPoP1ot2oJRNCmd5oE7nUKHzeaq1z/HB1H3aK0V6zVq5ukqOsPydwGgZTIDE/yf1HY
 FRMGz636JP9EQDn1FsSt790Jw89YM+BUq3XN45XBn/fFWx3zY/9E4vzI4vlLeOAzSTn2fyJUCEY
 qlCn2vcURMkqdIA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6008

This was introduced in oecore by commit
ce2e42ace2d15fb6745437cf0a7f07d28398ca12 ("insane: Split ERROR_QA into
CHECKLAYER_REQUIRED_TESTS").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5c2920603fbf12657ab8f84dda027b8f26a75ce2..2a97ff98d3f0cb178ab2b6463980cf5a354acfc5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1250,6 +1250,17 @@ system and gives an overview of their function and contents.
       -  :term:`BUILDSDK_CFLAGS` when building for
          an SDK (i.e. ``nativesdk-``)
 
+   :term:`CHECKLAYER_REQUIRED_TESTS`
+      The :term:`CHECKLAYER_REQUIRED_TESTS` variable lists the QA tests that are
+      required to be enabled to pass the Yocto Project Compatible status for a
+      layer. It is meant to be a read-only variable and any change to the
+      variable may be done with the approval of the :oe_wiki:`Technical Steering
+      Committee (TSC) </TSC>`.
+
+      For more information on the Yocto Project Compatible status, see
+      the :ref:`dev-manual/layers:Making Sure Your Layer is Compatible With
+      Yocto Project` section of the Yocto Project Development Manual.
+
    :term:`CLASSOVERRIDE`
       An internal variable specifying the special class override that
       should currently apply (e.g. "class-target", "class-native", and so

-- 
2.47.1


