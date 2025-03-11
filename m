Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD61C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:31:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.9094.1741699882471182025
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 06:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D7ebDKp/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9228944190;
	Tue, 11 Mar 2025 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741699880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XRiBWdqQqPlYp64cpi6h//twIe2AvDLaAOZqZADXu+c=;
	b=D7ebDKp/QIFDRltY5w3voQ2S9s964/2JOEKzqhwVd47VltWQ+l3XH2ArgQc1+cihEZwNvX
	PlrR+6ICDjjN9fohLRJTnEpwGC8h9q255Bvd7luYVyZIDVgYLabYZcFZZ+33CNr9tobKOB
	LZguc+7B60NZAQ2fTqXII/nY588hA+QFnElcDibzhNSa9Z2gwuwq1YuODe7R4FbBiC8pMb
	QqUQm9ARXPwdFp7wgjPtVd9R8uQGIZVjRA76oWV+6lktJMdr7SIy4WfZsImSAj4Ty0Ogxb
	m4hKYuLkCLB7umhREm+6XIffxriFhBhMcgGk1PYZCQiDcNpkEtdZbIQ2czGCJw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/6] Updates around the UNPACKDIR variable
Date: Tue, 11 Mar 2025 14:31:01 +0100
Message-Id: <20250311-overview-figures-v2-0-63f0c89fab98@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABY70GcC/2WNwQ7CIBAFf6XZsxjAkBJP/ofpAcrSbqJgoEVNw
 7+LTTx5nEnevA0yJsIM526DhIUyxdBAHjoYZxMmZOQag+RScSl6FgumQvhknqY1YWZoHBfWGET
 roc0eCT299uR1aDxTXmJ67w9FfO0vpv9jRTDOeuXkySrsjdYXG+Nyo3Ac4x2GWusHXwrwO7IAA
 AA=
X-Change-ID: 20250217-overview-figures-ead01baaeebf
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2861;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Mxf/NQBuUA0+rDKP283MteCyz0k6ZLlaoTy3iOmt9LE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn0Dsn0oivSBY7QgQWShAzwepDyD+BSqrYbkX2S
 v/0aXTZuNCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9A7JwAKCRDRgEFAKaOo
 NqvtEACuiGtWYlc86KNfl7DKsHDKs1I+FNvIB53hXHHA4DnhP0RXofgT+eoIiSHM6rijuQMxabZ
 ZFJFzT/qIu11PFRg/zzwrLyEhSqG8XIAnCuqo7oyyZ2a7K+Td/aJSdAb1a3Yv7Pveq9DjfY0+TX
 +Q8/S2xDRRwpzyGW2X2LXTns5V31XW3EBDmcAFNYc3R1510kb/23IDRH/p0b7b4ls3+lgSWObyY
 RgS70foNTNi71rk3Tx1I+p6jf+o5HJpAIbitcfCVyOdwH9vjAQuvqGlyuilPf+HvmR9VF7L9LzZ
 Hz6mlykh0UbOOgP+PdefPtH+UwY4Fp/fQqCCyoHQ1NVyoMhIePy5H36YstKebwlkAvF/iFK8Gw4
 b+U0/yAvsetxrQ6EClNk8Y4XBr8EVM118EPMHSRoMDmVdHlsb+SBAEmQuj6+qoQvAcfkNHNW7Mp
 j7PZfX3adxwyj0TsN+nJyuTpa+DWzOVUcn9qlEQtusYNHTs4oPBbSxgzZ3wrs2ZVrNRtwLdpC3x
 fKocrdNEPqzkcC8dYvuFjJTaIoQeb0DEXYItGTAUBYmAybT07W/+7SgjtrWMGFIH0I6d3fgMiFV
 xGeQ4SgqNAlTULyN+0AJ8aNMedXF5fNnXTllZDZ9ZTD5Lm/t0/PNGmvCyBCxoZ7at5d4oo6U22v
 w0UL5xtq83aIB1Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefteetgffgkeegffejheelffejueetveevleefgefhfeegffelveeivdffgeefvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 13:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6534

In the overview manual, for images that should mention UNPACKDIR, update
them to SVGs. Using SVGs will allow maintainers to grep for variables
and find it in SVGs images, since they are text. It also renders them
much better in the doc.

Preview the files here:
https://lufi.bootlin.com/r/xvEBFSSCQH#havO3Q0FE2iwosN18yBE2NLy3jOsN+N9PcY34+Yj96Q=
https://lufi.bootlin.com/r/XXzoY9Pqym#dtnlf3eRPXJLkc8eElsdhaIhuzaMLs91vtqEJqcip1w=
https://lufi.bootlin.com/r/MpJfxZVBKY#F922qn9mRFKqtVMsQRCDYlDEv/qGOXDQstedRtM2F84=
https://lufi.bootlin.com/r/QTT_WFgD49#zs8s9pgYGbogUZR/7q8KHVV2jTwrEuSR1Z0wxqM0Yao=

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- The converted SVG were a bit off because of all of the multiple arrows
  that were misaligned with the text. Instead of using extra objects to
  do this, use characters that act as arrows and are never misaligned to
  the text.
- Drop the UNPACKDIR description patch. I'll send it separately as it
  needs more reviews and I don't want it to block this series.
- Reviews from Quentin (thanks!):
  - Be more precise about what changed in the figures in the commit log.
  - Fix the arrow direction in configuration-compile-autoreconf.png,
    where is also used in configure/compile/install in different ways.
  - Split commit for PR removal and UNPACKDIR addition in the build dir
    description list.
- Link to v1: https://lore.kernel.org/r/20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com

---
Antonin Godard (6):
      overview-manual: convert source-fetching.png to svg and fix UNPACKDIR
      overview-manual: convert patching.png to svg
      overview-manual: convert configuration-compile-autoreconf.png to svg
      overview-manual: convert analysis-for-package-splitting.png to svg
      overview-manual/concepts: remove PR from the build dir list
      overview-manual/concepts: add UNPACKDIR in the directory description

 documentation/overview-manual/concepts.rst         |   24 +-
 .../figures/analysis-for-package-splitting.png     |  Bin 68434 -> 0 bytes
 .../figures/configuration-compile-autoreconf.png   |  Bin 70877 -> 0 bytes
 documentation/overview-manual/figures/patching.png |  Bin 57414 -> 0 bytes
 .../overview-manual/figures/source-fetching.png    |  Bin 46896 -> 0 bytes
 .../svg/analysis-for-package-splitting.svg         | 1862 ++++++++++++++++++++
 .../svg/configuration-compile-autoreconf.svg       | 1497 ++++++++++++++++
 documentation/overview-manual/svg/patching.svg     | 1224 +++++++++++++
 .../overview-manual/svg/source-fetching.svg        | 1094 ++++++++++++
 9 files changed, 5689 insertions(+), 12 deletions(-)
---
base-commit: e608902ffae3af5ab0c5308b0550e49a790482f0
change-id: 20250217-overview-figures-ead01baaeebf

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


