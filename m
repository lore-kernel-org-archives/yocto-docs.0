Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCADC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:56:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.4581.1744192565685883068
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 02:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YYY7BQSt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8009D442ED;
	Wed,  9 Apr 2025 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744192563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b2mc8P4KYlKGY9WMvZ8sMSn4oRMzj0nfVcKVSILa1rU=;
	b=YYY7BQStIfpOT96a6mxHUoVR01Vfd6DBsudUpjw9R1gt3WS2dePeaSncXW8yONbJvWmi3n
	1crMJ7vvK1rLaLdIT4eyn1eKjT2pV7hzQ+r2GhV8x9uAsmrysTiqC2RVmmeS31u2NEcezd
	pdrouV3mWjp1U9rm44lh2lJWOFFKPxXvQW1swP/lqoBzr7fH0vhzGH6w1+8pfiMcp+J6NP
	xoxQ6+tVmdAvXf2gPvc0QVrEwuyDG/8sgsrmLUAECUIeU/VlVz7C30022CKIDdpOU1NxAz
	bVlCx16bjtErKuluAQycP07p/P2N6yAA/4zaSXZCcr7mQRlH1rHM/Z+FrEWB1A==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Fix broken links when building on branch tip
Date: Wed, 09 Apr 2025 11:55:40 +0200
Message-Id: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxE9mcC/x2M2wpAQBBAf0XzbGqxcvkVeVhmMNHSjqTk320eT
 51zHlAOwgpt8kDgS1R2HyFLExgX52dGociQm7w01jQ4yY0keoYdiR3hJn5VtENRDVRTad0IsT0
 CR/H/dv37frOCFCBnAAAA
X-Change-ID: 20250409-fix-distro-dead-links-4b37bd8d54ac
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=74NoQy60Ww7roJDfHlcU0LRDXSk0TFz2uKL789QUEWI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn9kQzOvMFOrVHtff1v+Vg4tCBaYLLgRSpV1mwO
 R+koFTZYGOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ/ZEMwAKCRDRgEFAKaOo
 NtIrD/4ydE82pPw+ANsnIRvfvhLsE9cfChWlFPVB98eY23Fp6qb61MQ/t8QC0TTJ4l98CqdNehd
 SdYyD0OvUp6TscABFYLVQ7MVDGNrRXW2vwCSyriAgk0zCERS1gSgqHqIQf+j4ZP+3uHTnBsezug
 tqvwTI0n0f34oVxxoYFX4AP2/BDkPtWYLGik9hdvpuh67cxe+SSrye1v0ZxSec3KetATlanz5LD
 K2xGT/hM54zGTvHAB+mi0Vmlmpcx+PlrVU99c/PX6cUKOjn1vO4JjBHI6pjzNZwtUawS4mpw9pr
 qd9emEuJrdfYaVB6NGsH7jNT9crgwoaAjd9khmInt0bK0XyqJH79hcwQ3tOYBGfA0wEhgcTosR8
 VLz0wiRCY73gxmOv7MDszfJ9ZL46Ozd1D8drdnNhThEAQBY6eBghW7kNxd7nFmYuZHsTbO1WErK
 UJZc9CJL5U6GCMtMRVUNMG4T/DjTgARaJebMDWmMHR8dRE9EGPZ6gBttv7SKRKhzu5TnmAgcOqt
 MVY3d6Aojs7rA0y5qCPsiZ2wwE//4epzeeMaIBmsMoxllt8Phlrvs7E9fhbcjhCeQ4ud87MGfmM
 D8w/iGzYTxaQqOuxh0WeUGgtuGCZfxbt+BDbLthrFBlKZUaCqfKhLqawlr0yyU1bxy3ty4fweuR
 sEXvocOnwBvlxPQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefgfdvvdegveffhfffueeivefgleeljeeukeegveelgfejvdehheevkedtveeiheenucffohhmrghinhephigrmhhlrdhinhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtshesl
 hhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Apr 2025 09:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6721

When building on a branch tip, some generated links are created with the
A.B.999 version inside them. Fix this by adding the DISTRO_LATEST_TAG
macro and using this instead in the existing links.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      poky.yaml: introduce DISTRO_LATEST_TAG
      Fix dead links that use the DISTRO macro

 documentation/bsp-guide/bsp.rst                  |  2 +-
 documentation/dev-manual/qemu.rst                |  2 +-
 documentation/dev-manual/start.rst               |  2 +-
 documentation/poky.yaml.in                       | 11 ++++++++++-
 documentation/ref-manual/system-requirements.rst |  2 +-
 documentation/ref-manual/terms.rst               |  2 +-
 documentation/sdk-manual/appendix-obtain.rst     |  6 +++---
 documentation/sdk-manual/extensible.rst          |  2 +-
 documentation/sdk-manual/intro.rst               |  4 ++--
 documentation/sdk-manual/using.rst               |  2 +-
 documentation/set_versions.py                    | 16 +++++++++++++++-
 11 files changed, 37 insertions(+), 14 deletions(-)
---
base-commit: 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef
change-id: 20250409-fix-distro-dead-links-4b37bd8d54ac

Best regards,
--
Antonin Godard <antonin.godard@bootlin.com>


