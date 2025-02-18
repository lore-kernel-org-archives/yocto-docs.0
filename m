Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0713C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 09:12:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.15637.1739869926580144376
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 01:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BYky+Q6/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F39294327E;
	Tue, 18 Feb 2025 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739869924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7IecfR+9fznRcc0IDrcv2wuVuMO80t6YdCgWoW5YGAk=;
	b=BYky+Q6/fl22YfSBbq3HDmm+WB+agwTi1ovIwoMeT1HyZRRXAl1HOL2jA8MWw6WcDvHeOl
	r7A3DSrczggyiJqjzSvq0sd94UdxvvWAkiH/V7tYghJ3yFiUB7pbD+k9OdF+xcTuFEHRy3
	J5kaTNXxmjo0bgonauNJ/8Fd/Cki5VEP1QvDNHoIriGQTt0b2YP0ObkbELhkNZR/Ru7MK+
	yk7bfMVE3/sWIJuU0aBjzg0wP5XkJRDhQU/U5kszKaXm5X4LD3QpQ73XPhhsdLe+p0ZEUg
	NGlVU9QgUxciL+V2S++ucpsuNBI1NiEwELFkKCOidKb8vKhEIUXOOFgK2nf7Ng==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/6] Updates around the UNPACKDIR variable
Date: Tue, 18 Feb 2025 10:11:55 +0100
Message-Id: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANtOtGcC/x3MQQqAIBBG4avIrBNUiKCrRAurX5tNxUgWiHdPW
 n6L9wolCCPRqAoJMic+jwbbKVp3f0Ro3prJGdcbZwd9ZkhmPDpwvAVJw2/GLt4DS6CWXYLA77+
 c5lo/O/kXEmIAAAA=
X-Change-ID: 20250217-overview-figures-ead01baaeebf
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2477;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=eqFaozApvrLVBJWPJdnu80lzagApE0cDit7JpG9RkuY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBntE7jEfU7mhYUumjVxgNOXs4fGPQp/r1147CHm
 Hc3UvpGu52JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7RO4wAKCRDRgEFAKaOo
 NqShD/9gZhHOYPA2dGmjXGibZ/fpebT6+IvpFzOYLSiX/I1mJHx0uvPfni4ts4Y7a25dUpf2joQ
 jqMQz4CYOj9CXDt0tRkW3D3OPDv4/+FBMzvr/T5UfQskoClmwaW/8hTScBOMzCepQ7NTZ7s+sjP
 ItOvVQux6E/71GhbIwNpRWPd3RYXOS/8u9FnHjKiaXWDY1TWWaxe96g+WANOo/DzZuGzmFz/aNX
 zOrpdTNp6roL5jSf3slhfn3/SG1f2SSLBiDaCiSJSAZqGTXzdoh2qtaqCIzhJctzHcv8iyF4EEN
 9Uy9qeWyH5wgNgV2rzlwrMb3hStwaU+44LLbYAwQZ5Qvs0SOCX/2hg5nodIbNxkZjw1npk4sMH0
 upd9DvXcYAuVb8XmCqZgvD62Gz3DupG83A+I3HI7LP6/HIr9pfsMEEs0x3vySnAMB0nR3quDEYK
 bsw09KjTOYCCmQg05wv/D7Xr9phey7A1IcCK85bascnbc+UkSCOBYS9Jmka7ye7WH5fzCY+NhEF
 rleuMYWYMRZWs80JgFbvtsDB7LDPc8fyi2kFyqTf22DsZFRGVIYshxhldrGxHglVkd9MTNa9XUb
 3KR/E5MXAd4ToY5gSsv2Qamj4L3SQNx3qxfFoZt45T02dlz//jdvHqISOe5ILuant4DoioqGiFE
 vpdyrH1tzokDX1w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdegfedtheejueetvdduueefhedvtdetiedtveeihfdukeehteehvdekudejvdfhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhop
 egrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Feb 2025 09:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6410

In the overview manual, for images that should mention UNPACKDIR, update
them to SVGs. Using SVGs will allow maintainers to grep for variables
and find it in SVGs images, since they are text. It also renders them
much better in the doc.

Preview the files here:

https://lufi.bootlin.com/r/wRQmbAvsew#U/AfVq1d88D9hE7Dp2jPHoRzSY6NN5F/2ar+Bki5u3U=
https://lufi.bootlin.com/r/fG3m9UF9DH#6cs07TfeggRurNR/ohUd8y7hGQ3McD0rBV1ip13XWKI=
https://lufi.bootlin.com/r/MJzY5kNWA4#+tBsGlCLQpx9tFB33wJtCbdXjO06TTAzlIDM9OgLm+Y=
https://lufi.bootlin.com/r/xjExs3h2Ht#98BQnm2Tj0ZVoS9NZdCOGbV8KqdTNGt19QRcIZ+UVZU=

The last patches attempt at clarifying the purpose of the UNPACKDIR
variable. The overview manual being an overview, I've phrased the
paragraph to remain simple and straightforward.

The last patch modifies the reference manual so that:

1. It gives advice on how S and UNPACKDIR should be set.
2. Explain the directory move behavior when a subdirectory of S matched
   one in UNPACKDIR.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (6):
      overview-manual: convert source-fetching.png to svg and fix UNPACKDIR
      overview-manual: convert patching.png to svg
      overview-manual: convert configuration-compile-autoreconf.png to svg
      overview-manual: convert analysis-for-package-splitting.png to svg
      overview-manual: add UNPACKDIR in the directory description
      ref-manual/variables: improve the UNPACKDIR documentation

 documentation/overview-manual/concepts.rst         |   24 +-
 .../figures/analysis-for-package-splitting.png     |  Bin 68434 -> 0 bytes
 .../figures/configuration-compile-autoreconf.png   |  Bin 70877 -> 0 bytes
 documentation/overview-manual/figures/patching.png |  Bin 57414 -> 0 bytes
 .../overview-manual/figures/source-fetching.png    |  Bin 46896 -> 0 bytes
 .../svg/analysis-for-package-splitting.svg         | 2111 ++++++++++++++++++++
 .../svg/configuration-compile-autoreconf.svg       | 1561 +++++++++++++++
 documentation/overview-manual/svg/patching.svg     | 1350 +++++++++++++
 .../overview-manual/svg/source-fetching.svg        | 1220 +++++++++++
 documentation/ref-manual/variables.rst             |   39 +-
 10 files changed, 6292 insertions(+), 13 deletions(-)
---
base-commit: 6eda443c7fcfeecebd6b44b96a1587c4bb093a34
change-id: 20250217-overview-figures-ead01baaeebf

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


