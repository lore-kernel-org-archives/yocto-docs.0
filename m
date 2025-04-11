Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759EAC369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 08:01:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.20323.1744358466542589370
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 01:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FhRh8bh3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FE6F44197;
	Fri, 11 Apr 2025 08:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744358464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/oHhK9XAueSSio2AxrawNpcEOngei/fj48IB61yFETU=;
	b=FhRh8bh38jQ6cx8KB1+epMethFzYHFBswQm6Im9RiGmz3tS8i9oNthaVYQaumBx4romTSu
	6H0cOCDg9hjVIbMijth2dC7KqRGDAPbe0Aq8EEd0b12mqf0k4BsNAwYJJXoz0xNbSD3bJJ
	itKQ8tH3csZ8nGSMZUHSl2JclXUqJqB6/yHlFoHvRqQ1mahNlx+hfEovK27a0r9Ncm8A9e
	bWg+N5SPM21wtLP600h31clB5AmJEoU0dOV3489F2b1YTODn5vXqi3tG7GPJ4vLPo2aJtX
	qlP+Wz9iL2hJg7RVm3HWyhu+6N8MzoXZ5m0qOl0jaLCbjY63/TxeNAPLsloYIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [scarthgap/kirkstone] SPDX doc fixes
Date: Fri, 11 Apr 2025 09:17:49 +0200
Message-ID: <20250411080006.3071665-3-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeffueefgedtgedugefhueevudduieelvdekffetfeelhfegteeviedvhfevveefnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtl
 hhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 08:01:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6731

There is currently confusion in the SPDX documentation because it was presumably
written with SPDX >3.0 in mind. The scarthgap and kirkstone branch do not
support SPDX 3.0.

These two patches for scarthgap and kirkstone fix the wrong descriptions of the
build outputs of the create-spdx (2.2) class.

Antonin Godard (1):
  dev-manual/sbom.rst: fix wrong build outputs

 documentation/dev-manual/sbom.rst | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)


