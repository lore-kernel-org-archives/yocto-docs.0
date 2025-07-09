Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7D2C83F14
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 07:58:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.10192.1752047874325935312
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 00:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HyoLfkGo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB243443BB;
	Wed,  9 Jul 2025 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752047873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhIPzHFL/pH6oh/ziIlQz5s4IzlxamL8iVmXddOdquQ=;
	b=HyoLfkGo1qdba6fXzpqpRDMZPaTbSjRlSc+yKzJn781T+efaQTosD+GjICw5l+NEMh1yWB
	ktfzFONYvlN/nDc+IX8dpJIe/P44kBKvj8FVbCR60C9+rMG5Wsh3iyN/BG/KhktM9u5TRt
	GWubgJ6/ykxuDGadoYFRbY6Fy4qUIqiwQPSJwdpPoyjwhTWFN+ej9h0VS1buKK8ugAPRXG
	m3w1WDmwMRepa7Vb0QYp0rUKKHOhXvIT5yvPfbVGXHeSSgl0PRFfXRG9VDRfdUmlNp3IET
	TDSVSAg85GORBmA4dqKmn3zfyThurvaNaSZ1bKo+OOooWiVfVUwo1sPt4Bn2sQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Jul 2025 09:57:30 +0200
Subject: [PATCH 4/4] overview-manual/concepts.rst: mention PERSISTENT_DIR
 for user configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-update-sstate-dir-docs-v1-4-9114688f33d1@bootlin.com>
References: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
In-Reply-To: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=844;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZLVT9BF49zHBYRfcce/UJCC7B6RBfbiD1oYVVS+YrcQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBobiD/Hd986IPtHswBAumqYN4AG65fdyzHjG9Sn
 XoRoGzT2UGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaG4g/wAKCRDRgEFAKaOo
 NqqWD/9J2vt6/I9OohTYQC7IgiO/+5DUR/azSw/RILYbtd+0UVVKKNrzDBNg8GdWh1q3J6ZpCmW
 MlfZurNPhK1QNLi1889aVxMXvCPOWYgE5ciatlaH2v6suttXDGZHdYpV7gWymwEWANxuEQD68D9
 cYCXtzORHrkYkiW2D0BnxhbUhM7Jw5eic7suaM5IN//9iYtC9EDNIHqzL3g70Qan9eFkWPUHfI8
 hiwbrovVdfi+TV+Bh3IW00D+zTtJU58KGTSUN88BuUbmfvoEcu46znTYpxvPdpUHwIus4KyCHUS
 eAKOBY/pcy6Q8Iro3nUX4JFWuHiKWo1/MBXjkihlNeY6zqjNuOsxhc+6a05DEYD5r02iLiitcc1
 X+iMihScqC6yTI0719kiBVPt3DWKbodOcJ8wzz4XL1gsrJk7UW0Jpn5TQpQHSLA3xqOA2tUXG3T
 Dz+KplCR/SJskqqY9SJvlVeKQ6chm1vvtlJnc/3lbSrGZZ0R5p7lTHAZfNVTwGLonwqzLXSEJJa
 w2fIkQR3J2OTd1M4qOpsyDoHYfLpePJqSvLamZS+WO5H5CPE9/TH7VjaWsahy7e7/8/h8sLjuN3
 Adv4KsTBpAf2F383Gm9yRHjeCf8HDqhkdt6c6BoiGFgatDuaah0MieNjY1p/XMu6SbmjuHu0+w5
 9KLZlK1pJDvn8UQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhro
 hhjvggtthdrohhrghdprhgtphhtthhopehmrghtthhhihgrshdrshgthhhifhhfvghrsegvfidrthhqqdhgrhhouhhprdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 07:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7286

The PERSISTENT_DIR directory can also be customized to be shared, so
mention it in the list of configuration variables in local.conf.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index b34de4d36..99a8f02a0 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -277,6 +277,9 @@ in the ``meta-poky`` layer:
 -  *Shared State Directory:* Controlled by the
    :term:`SSTATE_DIR` variable.
 
+-  *Persistent Data Directory:* Controlled by the
+   :term:`PERSISTENT_DIR` variable.
+
 -  *Build Output:* Controlled by the
    :term:`TMPDIR` variable.
 

-- 
2.50.0


