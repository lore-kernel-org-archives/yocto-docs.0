Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3D5C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 09:33:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.11465.1752053622933597835
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 02:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OJg0MK6Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC602433C9;
	Wed,  9 Jul 2025 09:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752053621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vCZJymTJk/VQJscgvg4IUFRFNgzafkfIHnM4vBlbNHY=;
	b=OJg0MK6ZlXhOolH4x4Y+VjDoXl/g6oeUqpejbBBglCDQuaoRPYbfQEAaiHHxVboSLkU7ku
	lsmxhdDJupFy2G85ytA7U0WljITJy5LdC08c4d6t8WeuH4vjxsoDb+/zFDEP/McCSnh/Da
	u2qX83InDRF5p+D6iyG6HfTJUDNSGmjg2JRtienOfqtvBfwIojDfYbo6WtM+YwcCkuTCXA
	YYgsgu/xVgSeQe/7cPXrKh4FiDbnd6y5lAz1mK7MfXt2VNjECIndy2+BTSnBLTbhNP9aYn
	XkKGrUstxQZC418Wxu5QNK6WwFGy1cxIB2L54Ks3tuckW+4pESFRzd+x4OteHw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4 0/2] Add a document on limiting host resources
Date: Wed, 09 Jul 2025 11:33:30 +0200
Message-Id: <20250709-resource-limiting-v4-0-c35cbc4c7d14@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGs3bmgC/23QSw6CMBAG4KuYrq1ph0LVlfcwLgpMYRKk2iLRG
 O5uARM1svwnmW8eTxbQEwa2Xz2Zx54CuTYGtV6xojZthZzKmBkISIWSmnsM7uYL5A2dqaO24hI
 sag3G7oRise/i0dJ9Mo+nmGsKnfOPaUQvx+qsZaAWtF5yye3WpljmpbEiOeTOdQ21m8Kd2ej18
 DG0kEsGcMG3oIXWhVIgyn8j+TYW90iioSzmKWY6MSb7NYb5UI/XW/xZ9752GF7EeB9IUQEAAA=
 =
X-Change-ID: 20250417-resource-limiting-12fe772af904
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RniNJRI/kQ6AQrpeHtsoarFO9x7NirmLHlKoZiQWvSc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBobjdzbWl2cDQKwBH80yHz7PQEE6lQAEGEhpCIC
 Z6Qt1FSbH6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaG43cwAKCRDRgEFAKaOo
 Nv8mEACIY6YHcEL/FyXpN2w0p0v9sC3vm4mZQWcfYI9Zu8xqyzTCc3mtXGBNc7YkUI+4xrkSXCg
 xQZRq8YGDBqunzBbUZjN+G8WtsVyKuRzqSxKV3LNCdpDWp9VeLnD9PEl8D6E8wxvb9eKhZR7I8v
 2RfnJ12SO4FgHnnsz4MTDTtKWgXMpFNWbNBn0nbtZx0H8i8AkadB6xwLU91ll8cLGRgVdsb6XRM
 jEBmFBqrbJBciBfbgmXkx1h4tdgYGDGaE9WqZkMlZHypALh0WfzZPBQT3f8KB+kYJgngwN975EA
 mmvZj5coeEgJ/XYnxlDs11nQkarmiHssGNrriEuzbt4QybvT7rmNJDHJg4S1hCpdgmNhHuM28Nd
 /hRLFMqjEF54SiCL0xy1K3oJioLHbZWquntFLTZ62YiYmZ4Ir5GI4nBmXY1ii9GkVU0Oazct2sL
 Z/R/K2RyFU+r58H3gJXIVVsAlbBwN+06LkglO/C6S/v7pNhsudgYsasyU5W2HLC5LH4M5uY+oTL
 5YnwU1bRitVpw3nsB3c3l+MQmsdSD7x6c+fxfucJNVdMb80WTsIiXzLstrA+wPXwXg2jY1TWl9g
 Ak3uq38wz0bYN2TY4wfsftwiQaJ6xtvffjWxwW6hbIUHEig6ovAI8xElFg4Q0DtMzIw2lrqISkq
 NDPFeQ/KaOrUpiA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdduuefhleevheeuvedufeegvddtffefveelfeeutdejueetleegleevffdtjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgts
 heslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 09:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7290

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v4:
- Remove the reference to Bitbake printing debug messages and replace
  that by a simple script, which does the same. This avoid having to add
  debug messages to Bitbake.
- Link to v3: https://lore.kernel.org/r/20250704-resource-limiting-v3-0-4feb5e673aa6@bootlin.com

Changes in v3:
- Add a note on the out-of-memory killer and odd looking failures
  (suggested by Mikko, thanks!)
- Link to v2: https://lore.kernel.org/r/20250701-resource-limiting-v2-0-827077c4420d@bootlin.com

Changes in v2:
- Fix typos and add suggestions from Quentin Schulz (thanks!).
- Add a better section on how to determine what the best pressure for a
  given host is.
- Link to v1: https://lore.kernel.org/r/20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com

---
Antonin Godard (2):
      Add a document on limiting host resources
      ref-manual/variables.rst: make reference to new limiting-resources doc

 documentation/dev-manual/index.rst              |   1 +
 documentation/dev-manual/limiting-resources.rst | 138 ++++++++++++++++++++++++
 documentation/ref-manual/variables.rst          |  32 ++++--
 3 files changed, 164 insertions(+), 7 deletions(-)
---
base-commit: 80084a4cabdf7f61c7e93eda8ddbd5bc7d54e041
change-id: 20250417-resource-limiting-12fe772af904

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


