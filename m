Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9ABE77186
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.77667.1734427635945355048
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DFtCGan8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DF651C0015;
	Tue, 17 Dec 2024 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u3eS06kraXy8kJ8lTjb1CVQMBUiVB1u7uxe2OP/3pGU=;
	b=DFtCGan8ZUFK7s7ciFL3N5pQRGYbWP557A5uosgTgCa16+ep743tI614VVMRvUXtS96RLA
	0jqAgqv2LHDGWbzlRCSEa9uzverlzxjtxzGeflLIGcFiXQJKhw4kb5aal5KVveg8ShzQ2N
	zJY4fseUmh1BfyT4BBc75IOajDw9tQ7sk02xMkR4Nq6XnDkXbuI5CQUnm8cBK05eMVFqni
	MRNMztsosZGKkx5/56N41ht/V3BZ4Kv5CENmvpRdfg7R/AKhZZptCvHkK8hSmFJfj19stT
	+oea1D1hy+mfhEgYeU8rsubUer5tsrnO+40icyHd/09xo5FuM4qnej+9GUOfAA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:04 +0100
Subject: [yocto-docs PATCH 05/14] ref-manual/variables: document the
 WIC_SECTOR_SIZE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-5-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KPUXgzko1GSw9KbjmZ7bBs9d+nN3Ut3PO9sHEuf9mkg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPwmxNwtZQo0PyaaaDu6pp7ul9T38iam/DI7
 KQaQg4Dn/CJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8AAKCRDRgEFAKaOo
 NhGDEACcYFVtDmGgqRJTAPZRG0sS1+t+KhDaZ+5+IRqZYZ8KtOlIOQcxwlyt43gekWBG8DoymWL
 +NJ7ZR8LEuuIbSfJgJqJ7FxfMOpc9zj1Dx2Ied+BaypHF/nyRscweNBBN801YoWgIqZX2ZAkJsC
 dTi2dZDXYmLwqUdXpPCQSbNBAluriDNG5/8BnkGPrN7yuJs2ZK3lsnaYh0WGZyITHbmbp6hqjh1
 Yf1awzU6Om0XkuCOCx+eu6yvTRcieorCGJbFvtd4flBM9sHnH+Y8LzLB2Za4jMmfgTT7MgCPRJn
 xMUtVgf/zKp+m1W3BmWKH4lehkmULcNteTvg4yF0yNng01UqomXupAtmutqcItr66bZLvPG/CRO
 kxPYux8Bzfu/UWSnV5qvncS8lxYEB2eUly+PwwACPcemGswBfv1y4XEIEZf6di/dpHj7iQVPoPx
 Ob8OaOnnfHGiASCtrdZAsL7seQ6KdafP2qXVlp4kScx5cHg4QK1dkokQsfV2ChlN28MZ4qxqvoA
 zTHZQPGiRU9t9atZJHSH+Ke3ZXzHompzTg8Q4dBfD/tEoBk1tyDX86gUZPE0lDl73irqLfgj61F
 RVShVmtno8fAo98dS/JU7DT4drxzercKc8Yyq3v+GGo6L4wcgmyFfUBINv+kBPsdDzSQlvrNF1q
 JMv9icT6Jduk0DA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5938

Added recently in oecore to control the sector size of wic images.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ada761045e9bf37cb294c0b66007a9faab995ec3..bce8a1c7ed3af7115655f51aa0a6c558478d8c86 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10194,6 +10194,17 @@ system and gives an overview of their function and contents.
       Specifies the timeout in seconds used by the ``watchdog`` recipe and
       also by ``systemd`` during reboot. The default is 60 seconds.
 
+   :term:`WIC_SECTOR_SIZE`
+      The variable :term:`WIC_SECTOR_SIZE` controls the sector size of Wic
+      images. In the background, this controls the value of the
+      ``PARTED_SECTOR_SIZE`` environment variable passed to the ``parted``
+      command-line utility, used to generated the images. The default value is
+      ``512``.
+
+      For more information on how to create Wic images, see the
+      ":ref:`dev-manual/wic:creating partitioned images using wic`" section in
+      the Yocto Project Development Tasks Manual.
+
    :term:`WIRELESS_DAEMON`
       For ``connman`` and ``packagegroup-base``, specifies the wireless
       daemon to use. The default is "wpa-supplicant" (note that the value

-- 
2.47.1


