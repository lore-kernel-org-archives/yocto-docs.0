Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BA8C0218A
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 15:52:31 +0000 (UTC)
Received: from relay0.mail.gandi.net (relay0.mail.gandi.net [217.70.178.220])
 by mx.groups.io with SMTP id smtpd.web10.54966.1737993150546599386
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 07:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N5Dfp/Yx;
 spf=pass (domain: bootlin.com, ip: 217.70.178.220, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5BD34412A;
	Mon, 27 Jan 2025 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737993148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ijAuqiKJvZWz4xLNCXUldXAKq+CmLew8dNkcGA3hM/Q=;
	b=N5Dfp/Yx1UDaSSJRwfmg5GopnVM+joLlYPp398uNc8/SCLOqKqyLZ2N1wGhAq6dnNjpDsd
	v5oYDUh18IDtLKS+sTddTqX2a0Q2S6MzjMye6ZOYXew8ltTobV8fjGwzWFcVoSvrlUaYs+
	gnQHyExs/nC910+U3U+x9fEtsQgx3Eh54LcP1cx/ZRXei9D5eoF+NgJch/ITo08LSb8wdB
	VieklHXMlbMd8R+gjgy5P6TOmcRuZyTtCCcvDF+ImYowcK2S+pzaEqEvQcTAHIN5yvhlH4
	qo9Cp5KlwHt32+ILWqel8RwPZpFhN/JFjviifSYjixgxjFJNd4GdgPmRVDdAbw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Jan 2025 16:52:17 +0100
Subject: [yocto-docs PATCH] ref-manual/faq: add q&a on systemd as default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-faq-no-systemd-v1-1-e9945bb090ef@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALCrl2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyNz3bTEQt28fN3iyuKS1NwUXTPDpNQ0E4tUE8vURCWgpoKi1LTMCrC
 B0bG1tQACwmDJYAAAAA==
X-Change-ID: 20250127-faq-no-systemd-61bef48e49ea
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RJXE7EkDcYmEoElIgncIoDx1SWbfCdntI5+rXZuNDPY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnl6u7B9qNW6Tl+HSKRHg14TD9pmRmrpGTjMGek
 h2xKHZSQQCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5eruwAKCRDRgEFAKaOo
 NoKgEACu/9mvYniic4ZEoG0E/XT7aqKzfwwukNVT9/eIg6ND8CmAE1aZ0T1zyYq+4YvOBXTT3dM
 +axuMhSqEH7rAteoB1Fy50l/EzodyDUWB6DXcNeiriOvEydyUioCd7SBp9z5FidvLmFclFz3/Cl
 OmqwvJ0kYzImivwOBMDuvBKXGEvFiLARpaXnNOlUJqVAMbUjZLtsZEfD5xNiFNlZ0Xsy8Hb0g3T
 H2Ysz38hEKvXnVoLPm0umoChRPKbZng0LhbuXGaUCeCxV+ozhCcGqnIHsS+QR3HYQfTXIsrPbuu
 H4/HSm3XR9dEmBBlCBKlyAtyTSviAh5384KpBEyusWo9xl8M96Mmty5+kx5ROX0rBpWFr7UAa/M
 PNULfuONSfCY9CLpIogqvbP6eVx+z15vzwh/RDE0MHlxaCkDg+ZkNMqjuDy6W6BaaBA7kD9FQ+z
 LxZaj/LMhp0iKzHGpLUqBMxlPT/kKHgGzvxGIz6EcS1hRxiZBPcZnfu54XuESn7YjzcNALicWz2
 e2rLZkmzgjCJZVhquPGrDJ/AUznR4vvbt+6gat+GnvnhEEAgfdx0BygU+MeaiCK/jZKLpwy4fak
 heJ8QuZGxOq4xiJktZTyYNjxaoE3Tvb8/OhIGcIT/8KnXUYxv3NDrdKZqxqCIPuoebUhJ/KcFVc
 fGvl1XnReyfjrbA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudefheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfeetuddtffekueegieduheeufedutdelgfegveejgfeuffffheefudehtdehgfenucffohhmrghinhepshihshhtvghmugdrihhopdhmuhhslhdqlhhisggtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 15:52:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6194

Originally written by Richard Purdie, but formatted in rst syntax and
slight rephrasing.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/faq.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 9e3418e10..827d8d307 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -45,6 +45,28 @@ See :yocto_wiki:`Products that use the Yocto Project
 Wiki. Don't hesitate to contribute to this page if you know other such
 products.
 
+Why isn't systemd the default init system for OpenEmbedded-Core/Yocto Project or in Poky?
+-----------------------------------------------------------------------------------------
+
+`systemd <https://systemd.io/>`__ is a desktop Linux init system with a specific
+focus that is not entirely aligned with a customisable "embedded" build
+system/environment.
+
+It understandably mandates certain layouts and configurations which may
+or may not align with what the objectives and direction :term:`OpenEmbedded-Core
+(OE-Core)` or Yocto Project want to take. It doesn't support all of our targets.
+For example `musl <https://www.musl-libc.org/>`__ support in systemd is
+problematic.
+
+If it were our default, we would have to align with all their choices
+and this doesn't make sense. It is therefore a configuration option and
+available to anyone where the design goals align. But we are clear it
+is not the only way to handle init.
+
+Our automated testing includes it through ``poky-altcfg`` and we
+don't really need it to be the default: it is tested, it works, and people
+can choose to use it.
+
 Building environment
 ====================
 

---
base-commit: caedbca4eced4cf5bc74aaae64e4ad2887c2fc65
change-id: 20250127-faq-no-systemd-61bef48e49ea

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


