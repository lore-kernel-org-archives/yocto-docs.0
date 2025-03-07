Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA1FC282D0
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:37:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.15690.1741365452121556325
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Mar 2025 08:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IlpfeXAC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C1A5442A5;
	Fri,  7 Mar 2025 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741365450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FjjZmn+zXrr8LwPcKJxQpRPO7ApHP2sG3rcvwsEGmDE=;
	b=IlpfeXACDPo5qn7Qvj5TCiVttNy24lTHbohyUjEOpBqcHZb/ofdv584981ZjlBUPp7isZC
	Gj9LCsLB5nJOsW5LjWqxlUWYmz/LVNayuXUdY/QpVim+Q9wQ3FY9VnRjJ8f1l9C2Op4IVc
	tr+GNW2AdEIpX2icMFqCRziACgRVIx1gMWlkKp+xNlz0gWlfb56gBeCwrCrmBhH5aBkcFZ
	WfiqnNE3b1XsKS7rKeS9kkZRh0syaFogvjVvqznZ+P36tDEGaBSyw+VeVcsvb8aGr07NHZ
	iOAQeh/ALpOCWUlguQJSaikzdJQ6l9WIHHNI0AwjnHt6DLfipfWzdDytZHOUFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Mar 2025 17:37:29 +0100
Message-Id: <D8A6J7U2HTA0.37HLPSVHS169Y@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Mar 2025 16:37:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6514

The following changes since commit 3757ace0581e6279aa7c065b21cee56edfe985dd=
:

  vulnerabilities/classes: remove references to cve-check text format (2025=
-02-25 17:26:59 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 7d3cce5b962ca9f73b29affceb7ebc6710627739:

  ref-manual: remove OE_IMPORTS (2025-03-07 11:53:30 +0100)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.25

Ross Burton (3):
      Remove all mention of core-image-lsb
      ref-manual: don't refer to poky-lsb
      ref-manual: remove OE_IMPORTS

 documentation/dev-manual/customizing-images.rst    |  17 +--
 documentation/dev-manual/qemu.rst                  |  11 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.25.rst      | 167 +++++++++++++++++=
++++
 documentation/ref-manual/features.rst              |   2 +-
 documentation/ref-manual/images.rst                |  21 ---
 documentation/ref-manual/variables.rst             |   8 -
 7 files changed, 182 insertions(+), 45 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.25.rst

