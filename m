Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA45D1CDBB
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:38:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.13575.1729586302110969090
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 01:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qsi0vAHu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04D7040011;
	Tue, 22 Oct 2024 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729586300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y7L+SLsWb1OtSeNx+0AVl2gytufyoCQXRxQaOS/Ph1o=;
	b=Qsi0vAHumQe4OqT7h+8vOSHlOo1ywUDwH6xlul51J2u2J6szz2MAVysMNfU0Vg6oh/6Q6D
	rbwyNJzjNIqrAXcaGKa3WV8JYkGokFHljBmfROXaYv6nIgXmrMxTGOdnzVaHZ82uN2xlrn
	Y1Zb6ZjM48eWp8BeZfAcCf65hggDWQJDHjVkEP3IusqfZvoLcnd3zeunmImUCwWw7EF1in
	LUCWQEt/gWFkkTrEhQ2ToYnAFavBCopJGs5N+48nLqQmYQhTwizYUmNLPO5P2/lk0SmDd/
	6L/TpCv+sp5rQtGC+RxPvyLw2sy2ZKs7lTY86b4L3njA8VTe6qQ1L3gMDhvX1A==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Update the devtool quick reference document
Date: Tue, 22 Oct 2024 10:37:55 +0200
Message-Id: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNkF2cC/4WNTQ6CMBBGr0JmbQ2tWH5W3sOwoGWQSaBD2qbRE
 O5u5QIu30u+9+0Q0BMG6IodPCYKxC6DuhRg58G9UNCYGVSpKlnKWoyYIvMiaN08J1zRxSB0M9S
 20S0qU0Gebh4nep/ZZ595phDZf86XJH/2TzBJUQplBmv1XU94ax+GOS7krpZX6I/j+AJUNlk9u
 gAAAA==
X-Change-ID: 20241017-devtool-improvements-68a7c869e2b4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QcK2xnbUiuJn7nY5rjDuax4DKcfrWuDx9P1nQD/KQpk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnF2R7ib5C4V8qPpApaIyDkAiZJrwNNSvtPU9Ds
 YCOfGivgJuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxdkewAKCRDRgEFAKaOo
 NssBD/9krxjjzRSwT+YEeYvKYIHg4YJiwYbjQqaIC/64ScoGipJTy9x7yK97h1n6tCXYj34dC+8
 2CU7Z0bD8eOKuyGP0zuBYEgYFAfxOdWYr63g8Ww/RfOzBYZ6hlx0rxtlx81tz+TSFzTWo+TSrpN
 5JDPJcDfA7wjdm4uX+xKrIJTsApyxCs4X8u/6gYrhhtvRhRnWtndK3SI1ArQKDVJowCd+Fp6G06
 6ozwsTZwtYnfUmya9tPZ9hP6lyV3fvJxeGBmrOy9aw7et0WqXjZC0OGaQBSiNfHx7PRUnVzldcI
 lu4XHe+nmOxwb/op2Yt1xLSVy7o11CdyO2emi4426X2e+O+OtzNJJ4O2M8qELWyFXXThWa6z8KN
 aruBX1tfp4u83g0/hVWINW2xK1B11+/8VP7IAWg84jvXkMBYBX6OJHtraRLNVTTNz0bCqtNFNrp
 IBjRn3Vm35PxffROBtQVD3EAoXMdRwAtbs9KIjSnpQME4rk5NshtzfN0zDBpuM/pib/TwSkhMGO
 plPbyI3kj0FBryHVtbjx10KaGy1mxfB7vBrPNEWQTXk4seyMibSL+xoCpvOoePHJhurkUchvd+e
 m13B9aV/3b+2rGv+/jRadVb97LeNI2B4VmHqrknNx9cwpnD04Vwg0AEHTOr6TS5dc3mW0QpgPxz
 N8hRwsbr7SEPcOQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 08:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5548

* Refresh command outputs from `devtool --help` and `devtool add
  --help`.
* Add some brief details on the subcommands that were previously
  undocumented, and the more recent commands that weren't documented
  yet.
* The remaining subcommands are still present in devtool, so leave them
  as-is.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- configure-help: Give an example of what the command will output for.
- ide-sdk: mention that like deploy-target an ssh server must be running
  on the target.
- Link to v1: https://lore.kernel.org/r/20241017-devtool-improvements-v1-0-2bacc656fe39@bootlin.com

---
Antonin Godard (2):
      ref-manual: devtool-reference: refresh example outputs
      ref-manual: devtool-reference: document missing commands

 documentation/ref-manual/devtool-reference.rst | 72 ++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 11 deletions(-)
---
base-commit: e4b64514673471850635a8dbbf62f34e710e276a
change-id: 20241017-devtool-improvements-68a7c869e2b4

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


