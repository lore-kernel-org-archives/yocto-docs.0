Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6285AC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 11:30:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.4703.1753788610771153790
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 04:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VSN0Kc0L;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92DE143868;
	Tue, 29 Jul 2025 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753788608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sY+Ckxm1lIthRU/xxpj8qmetLPL32jvDfeh+g1Hv8o4=;
	b=VSN0Kc0LRrZ+Dul4sTzQdaQ9lMLgKDcWb7hLXq+jEIhQ9W/V2dhk9RqACN5prtgFVeoeEd
	0r2l46Yz9DGt4bHTc9bSI05TmxMf0AfOrKDpl5i+Sp8FRmxLK/a7tgPTYPRD3wFhtWb4R6
	ftgelWdw+kwOpa6WWr3svwoIWzr/uXUtWUD+R8LDo/J2frv9nsLqmTE7OKjN9lcr9uYV35
	Ti6TRTUlML1lyRIwAgLK16l0UbHhMNrbsSF4wWHOnEwtkXq0q+Csu7/HUFrZ9InCB1WS9d
	eLGr2QrdJ0jla1AEZ3I7hjJZX5qb17w0eptXHIzBOLajkrI4pcd3NxoGxy6R7g==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/5] Add checks for glossaries correctness
Date: Tue, 29 Jul 2025 13:30:01 +0200
Message-Id: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmwiGgC/x3MTQqAIBBA4avIrBMmoR+6SrRQG2soLByIQLx70
 vJbvJdBKDEJTCpDooeFr1jRNgr8buNGmtdqMGg67MyoH5vYupNE+538IRrtGkZ0oR8MQs3uRIH
 ffzkvpXxaiu2VYgAAAA==
X-Change-ID: 20250528-variables-checks-0adf80bf6720
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=T6nwNKCausDheIu1s2rvbISdx52TcohiVb8aKcayR/8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiLC/sh7sQV8li5H1UKzChPduK7J56c5swX8i1
 Z6h22b3mx+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIiwvwAKCRDRgEFAKaOo
 NiXED/94naGgDRFyueCJJ2VdMQHrOk79rirlRGwC2lZHYUXeM078HxI9IEQC33P6mqsuJ4Dqtr8
 pUyIZiEFAqtdC58K5SD1ql/tBtnTffyXzftZYr/iOenVGtxEGlZX8sy4Y+5BePLXF4hG4J19Sin
 QElXlJOc/9mOat4H/vdgOpOFo8aXcLCpxRuor0nWS47rY7ZVQXrFJoJaaPiX8iFv0uPA1w7ppve
 z8BSFKBwueo5pq997ogCNs2ee54yJ+gNyyTQ9M1DgDDkw8R+MAuWTkX3y5kq+f2dvYrLoOjq5rp
 XwVs8+4qEnfadD3o7ONVQsCtWlhP1AYVQDsNWhU3UWNrurhSS03IDaUE+ixr4IjqDtqbdljEZRT
 AWHfvo/lvnOJ4N/5sTpvKZxLKmfjsKz+N/5Hlx3xnrkTCX1+SiCzbjaaU2ZNgqZJoDR6jLV0tnX
 zcOxhwuN7kf2ns5T1TV+gYfsukWCrAgQCFXOyOzTBz/VJPZlBncgL+9fhjioG0iVCnmx/rHZmqm
 ASUHPGWNZAYqYdkbdirTumZpnJyIU8KCWLBofUoJaLGoU6Tj4jyFZMkURqetGKZ9VuAINX5EZQH
 iWhIr88hPKyXokBBtv/ub99GV96kIVKqs97IlzHa6DABIMUT8DMIrqNFYjKkS0oobUHvJv4VVA7
 Ig0v6MHd5IG4hDQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdduuefhleevheeuvedufeegvddtffefveelfeeutdejueetleegleevffdtjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepr
 ghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 11:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7415

Instead of having to manually check if the glossary is up-to-date, add a
checks rule to the Makefile that performs basic checks on
documentation/ref-manual/variables.rst and
documentation/ref-manual/terms.rst. The
documentation/scripts/check-glossaries script checks that the glossary
is up-to-date (there's only one in variables.rst), and that the list of
terms/variables are properly sorted.

This series was based on:
https://lore.kernel.org/r/20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com
And so depends on it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (5):
      Add a script to validate documentation glossaries
      Makefile: add a checks rule
      ref-manual/variables.rst: fix the glossary
      ref-manual/variables.rst: sort variables
      ref-manual/terms.rst: sort entries

 documentation/Makefile                 |   5 +-
 documentation/ref-manual/terms.rst     |  26 ++--
 documentation/ref-manual/variables.rst | 268 +++++++++++++++++----------------
 documentation/tools/check-glossaries   |  90 +++++++++++
 4 files changed, 244 insertions(+), 145 deletions(-)
---
base-commit: 31b137092915f23ad25178b2d08845a9a01d6b02
change-id: 20250528-variables-checks-0adf80bf6720

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


