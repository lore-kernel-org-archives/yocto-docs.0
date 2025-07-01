Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0BDC8303A
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 11:40:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8531.1751370027214275580
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 04:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PniP8113;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C47543B10;
	Tue,  1 Jul 2025 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751370025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gVUPi6E7/YmLxjqhrPrrd89iQ34PNnpkGH9jgX7xkbY=;
	b=PniP8113Wz64YXDAQMqmVk7ct8ZuWwVzQs8RglEYbEG8THmJsAc4jUNCFkaTw3XjCMklk8
	ibT6QWATG6pkS8GrB2j/JRXqMuFs7K/q38lTGfc35yryOjttz5XkgxG8UgKM6jJQiiR0Lo
	AagqvM0b24+iKBaz3gB6rirzX+9wCkL6uR1JtpfrVRM0XOMjoV7l0K2Y9u1l2ZaSjJf+ET
	d7XWLMYBF5ZzK3vRRD2KOy9LgAuPsPBTX3iKju9Dpl5sQQ7FapxdFhjpkG3qGrjf1bTFt7
	KJRZhbFw/YNRCfPu3NBKFJ+/fk2lkJCyWFU8ppSYwv23uACSPu0Ftc4bdM7oHQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Add a document on limiting host resources
Date: Tue, 01 Jul 2025 13:40:19 +0200
Message-Id: <20250701-resource-limiting-v2-0-827077c4420d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACPJY2gC/22OzQ6CMBAGX4Xs2Zq2gqgn38Nw4GcLm0CL20I0h
 He3gkeP8yU7swt4ZEIPt2QBxpk8ORtBHxKou9K2KKiJDFrqTKYqF4zeTVyj6GmgQLYVShvMc12
 aq0wh3o2Mhl6b81FE7sgHx+8tMavvutvOOv1jm5VQwlxMhk3VlEae7pVzoSd7rN0AxboHGJ9T/
 DX8Kuv6AQwASirJAAAA
X-Change-ID: 20250417-resource-limiting-12fe772af904
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/mawPIzHEp9hQdEJQLu/6F/ChcZ3P3dyd1DZ5Q+brbI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoY8koYgW6d/MKIZnp1uO0muGHifwb8+AVI/ALU
 t/1FBa2X1OJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaGPJKAAKCRDRgEFAKaOo
 NmXUEACy/x53acIcEZxNcj/pQyULTzI8VICs0QO2XZjTXpVV1HBHxRlDYNxMImEgAMONU0ohpYw
 yQ5Iybdz4D3Fm+IfAuAfNYd7WQbO4PjgoY9ihmWXEovhDEDhSIYcYQcyy8k4piEM+pPK8oh5Zyg
 1gvsw6kwswNJxCmtaCG7vXqesxzWqKVpAvtUMOsSiEmExGiv4ZI3DSTZZjsFtpY21p3Q+pCVOqO
 udRLoU0/Fx3pYuP/5DGIm6SOPTenFBY3N31kLbYqFZiR2x97wymevci6d1NH0BoWfZ4pnQS761q
 rZuG6J403DsInAC5SsLaMk2ASwWHB09vYKMdz23fgR5XG3H/aDvqkMNaljtgcrRfK4Jk/YP6ryM
 FRSj0qQ0jcWUdKM3vO/m5f4DvCP3iSXNUNSOM9QKg2jbuj0p+sC6LmMuebG6bV9LloMQd/kRCnH
 Wsk0oM+ZjURvEA+32SWxFJdUCUq2TSA9yy6srM1+RlXx+lbvBgePInl9MW8VdjlCaMK+nnJ7+hE
 F3y282r5zGbIaeU+wcWmhWJzjSPJ1w5pSEC7psrfy4EtdpiAoY79Ntg1NHKcyXZLBc+iUsE81/B
 euYT0CEVslsnOsSS/le1GYBeB1HCHxcoRDvuqWcrHd327Qsk7IkV05+vxSduq4kzSRkLPRZz0L5
 LHQbMEoJBTUC3ow==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdduuefhleevheeuvedufeegvddtffefveelfeeutdejueetleegleevffdtjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepthhhohhmr
 ghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 11:40:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7254

This patch depends on:
https://lore.kernel.org/20250701-pressure-messages-v1-1-bebffe123676@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
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
 documentation/dev-manual/limiting-resources.rst | 120 ++++++++++++++++++++++++
 documentation/ref-manual/variables.rst          |  32 +++++--
 3 files changed, 146 insertions(+), 7 deletions(-)
---
base-commit: 95691fa4e7d30ee27cb1280df20751bf449538a4
change-id: 20250417-resource-limiting-12fe772af904

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


