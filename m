Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED907D374A4
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 15:13:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.385.1729178007078333400
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 08:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jZV9sZui;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CC9F1C0008;
	Thu, 17 Oct 2024 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729178005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FKyWAxWn3esjdqH74L7o8XhvQmHVsAKE7fMvphmei6c=;
	b=jZV9sZuieaeOVqbAQqHoyZS9Nj+ZIjaOEpJLiu8qy7piaw8aqGWJq9NAu1a111P97Ika37
	MIZav3jPJw0fI7qsD/jZ5q/PsjD50HBgK15Z9GLPdMEsdZL6VAaoNpOHJjVh4AiDpWXWn4
	zUH7ZwR9R64p+a6xidfJ/ZCjFBytGR9rXJBCMun3fLnrdBjdTInwc2dtRZyiXM30ny1HZD
	1sp2Yb1GomAZiPUUPyinwYZ/xxyWi7K++Z7cO89u6oCKqvj9pHWXRFPHhfV5KLXfXBiRh/
	wFQRuFJYqLVDC/Cocmgbjns7vACSRlgXCA10kl2gY0vcEHgFtQ7/a6wTKyO9IQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Update the devtool quick reference document
Date: Thu, 17 Oct 2024 17:13:07 +0200
Message-Id: <20241017-devtool-improvements-v1-0-2bacc656fe39@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIMpEWcC/x3MSwqAIBRG4a3EHSekhD22Eg3M/upCaWhIEO09a
 fgNznkoIjAi9cVDAYkje5chy4LsZtwKwXM2qUrVspKNmJEu73fBxxl8wgF3RaFb09hWd1BTTTk
 9Axa+/+0wvu8HFDh84mYAAAA=
X-Change-ID: 20241017-devtool-improvements-68a7c869e2b4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=836;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=z/JdolXhM6ckhp7IEIEw/mNRLgyRxX/7/LfOJy5wfsI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnESmUBNR50ggO3TuEEQjnl+vD8h+e3W5dA756h
 CHThbnwEnyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxEplAAKCRDRgEFAKaOo
 NlpcEACRlqOd20CV41hCOf/6Pjz2Qtp1Dx146U/ZgNcBZwNcm98V0huJnCA4hI4YQ6+lPIjbKqk
 iGGTJfYAv0I6zN90ni8Alc6INgMF9n/B53wxaXA9HHe1kxp62t7ILgQ30SmiZ3oaCXw4XRpkg8C
 dvHOHyxiAwxaatcyeGjhg/0AzbLdMb4VzqB/THK4m7z+ytIh6fBxXqOYQTu5iY7gy6f8GnlRhWF
 yt/YxzBEzPYqL/Vrl/R4hqFE+ygkV03kzkzCJPAfRK/vn6C8L/xTeZ3g0VK89lX735+pUdOp9IN
 ThZq92Xp9WMTI9mOrSqWYXcj0yl2oIhuGVmuBTVYaAhLigHEpYikhnU3hco9/wog2tBN2pqzUbm
 brrfVLJOFXhY46nhfFV/ZRndoHtAbTA4Xhmm6n6JuZHK1RUOOEiMgxKcyT/L9p26QpPvhxJVeIq
 +3C3cAxlka5AiVtbtOOiee9hyn2U7O5l7FpkxlKw5XhsG9juUeRa5jomBOXTv0NFh1rVrqmxMJ+
 h8FMrkFuALsc0Nm2dbXYKq/p3m7OCw2E3knS9G95fY3jVLZwLRTo54FUDKHFwhG9WJcgZvPKBvu
 iHIQotLH+ouKTKB9Cgs2GXZI0G9MoLDI0VRnrR23olgo7JyK08dHkeUfR/fhbK7Z0OJ9vUxCdlU
 GzeCd64kF1vnT3A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Oct 2024 15:13:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5527

* Refresh command outputs from `devtool --help` and `devtool add
  --help`.
* Add some brief details on the subcommands that were previously
  undocumented, and the more recent commands that weren't documented
  yet.
* The remaining subcommands are still present in devtool, so leave them
  as-is.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual: devtool-reference: refresh example outputs
      ref-manual: devtool-reference: document missing commands

 documentation/ref-manual/devtool-reference.rst | 70 ++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 11 deletions(-)
---
base-commit: 372b5b4ca55819c294970b20aa8b8d8167144329
change-id: 20241017-devtool-improvements-68a7c869e2b4

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


