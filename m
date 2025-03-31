Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB0DC36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 15:05:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.54558.1743433497227203130
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 08:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bYTmOAQh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 252F04452C;
	Mon, 31 Mar 2025 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743433495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=75P2MV0tmG9VRrTkJzPIbmLW1NEtYlDVli1GrOHhYQY=;
	b=bYTmOAQhdTekvoFndrN2pKvCFXD8yZDW4/CDzBy5oLwOHm5wIgI2mkbz+04E42vE/Ynur1
	cJTM3o0svHwhPHq5Z2dTCWBzupH2D7ic4QbZLTh2V0kgYtTBSD0tmfd9Iql2CBVDdxI1eD
	xnmwdsAeSiE0Ryu5NzQvSJa//9G2x3VszRZQA/za77/JxPJ7mC+ygc6jwMxFudWI5aiQQD
	S7i70bA08CYqVIkQ+k5a0jzbjL2Zc6DTogL6DGO/pAMb7d7n5BO9TT1uQp3g7pSz+Ygp5M
	2Vn6iU/Oy3KHuVB0jvvWhamakxopTm8/lbDlwRHq2N1Be/C589NJB9ykhJwhaQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4 0/6] Document missing toolchain related variables
Date: Mon, 31 Mar 2025 17:04:44 +0200
Message-Id: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAyv6mcC/2XN0Q6CIBTG8VdxXEfDA6J11Xu0LvBwTLaSBo7Vn
 O8eepPNy++M35+JRQqOIjsXEwuUXHR+yEMdCoa9Ge7Enc2bgYBKyLLmiDyZEDkBWhC1NtJoll+
 /AnXuvZaut7x7F0cfPms4lct130glFxwqsq2xnRWVurTejw83HNE/2VJJsJGgfxKylLptBGqFy
 pz2Um7l5k+ZZa3AttYiCdH8y3mev/Lfkz0UAQAA
X-Change-ID: 20250317-cc-vars-e2cd2076a3a6
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Nql0yoj6zuqdrdHvB6c29e5bqD1MtTm2E9RMfyVmKBs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn6q8WkMHgbYaVBfCsGV6YJ9Ai6lQAsVe497ijb
 hB/q5yfHW6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+qvFgAKCRDRgEFAKaOo
 NrBzD/4jPgmO4sUGgGIlqm4pObMt6Bjko0AldFUrSZXJdwtuiJhB2kh6Ji3PL4CkqaiQYREp/Qv
 hnsohUZnKDIb2UEFJbtJC5WEnhIexF1rH4di6HmlX7diXoHXVTN8aSm2yv+OhZsEc796qgKdEFd
 pCVeuDRYPHy52Hbrw0dc4E2pJs1vy/UerZh6En9BbyHVvlf5pT/qBvMw0Drcrsudd/exTFTpM49
 XeZ/vfq881nDWuU1/KnUkTY7rAmLZzw/hZw0cC3LKDUwCgnarXB0oKTCC7mD6pu//b/iH2xa5CE
 lz1dVF4wUYSoX+HlPbhR1TyMXiupm7LbsZATJ5ZfV8JEpZTx34Z72ByZgxALOZnhn0xgolsgADe
 er/RbwrwqkSU+GL1wlOS82+7kPWuMjlly+euo9DnaLO0et51qjwtjNT+JZoTSZu93ZkXjupY1sK
 1b1MD19l6yNmDFiShjFoQRZXbWminNc1JKfKPByUeVu88ThoVfnIU5uWzSAr0jL9kP90ReZCGzP
 gIefc+FqllI1FCSrLPvHuwK9SlKDBx1XO0bJsA5tQZdEsZItu7OgQQarOf+FeNiEg2wt4ZYTPOP
 t3zzvEelPfwAfNNT3yv65xCzWFriWtqcqYKFGs3GP3XWVb0dV7hrnauvW54J6f5RO4e01dietK1
 7bwb4q4iLZnTFag==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetieefveejtefhgeekkeefteejgfetvdevgfejudfgveelfeffjeehkeefffehieenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Mar 2025 15:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6686

Document a bunch a toolchain related variables. These follow a naming
scheme to make them easier to deduce from the name. Try clearing this
out for users reading the documentation.

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=15719.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v4:
- Reviews by Quentin (thanks!):
  - Rephrase link to update-rc.d.
  - Typo in conf.py.
  - Bad definition of BUILD_AS fixed.
- Link to v3: https://lore.kernel.org/r/20250327-cc-vars-v3-0-742dbddce008@bootlin.com

Changes in v3:
- Review by Quentin (thank you!):
  - Include section number for manpage links.
  - For BUILD_* variables, be more precise about the fact that we should
    not override it from recipes but we can sometimes use them to refer
    to a host tool from a target recipe context.
- Link to v2: https://lore.kernel.org/r/20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com

Changes in v2:
- Add a patch to define a manpage url, for giving manpage links in the
  docs.
- Reformulate the BUILD_* definitions to explicitely say that we are not
  supposed to set these variables or use them directly in recipes.
- Link to v1: https://lore.kernel.org/r/20250317-cc-vars-v1-0-25edbadfd054@bootlin.com

---
Antonin Godard (6):
      documentation/conf.py: define a manpage url
      ref-manual/variables.rst: add manpage links for toolchain variables
      ref-manual/variables.rst: add missing documentation for BUILD_* variables
      ref-manual/variables.rst: document missing SDK_*_ARCH variables
      ref-manual/variables.rst: document HOST_*_ARCH variables
      ref-manual/variables.rst: HOST_CC_ARCH: fix wrong SDK reference

 documentation/conf.py                      |   3 +
 documentation/overview-manual/concepts.rst |   2 +-
 documentation/overview-manual/yp-intro.rst |   2 +-
 documentation/ref-manual/variables.rst     | 318 ++++++++++++++++++++++++++---
 4 files changed, 290 insertions(+), 35 deletions(-)
---
base-commit: 0e538c102bfcb7184c76c2401e8cb878168c4434
change-id: 20250317-cc-vars-e2cd2076a3a6

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


