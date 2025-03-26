Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D82DC36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 13:21:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.22219.1742995308302472686
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 06:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DmMs9waV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1195C44399;
	Wed, 26 Mar 2025 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742995306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kwfxSlAP8V+QrkgY5UgjyjZkzy49weH2YfJ9oRAYFTM=;
	b=DmMs9waVGjAm0/SidpbauAXUpk+vVeyfZRh6sQwTHQdlenUya8riNVXTD3VoIpdcTDeF3B
	qKxSiE5Hs9ZV0Y5BespNFA47a1ZsXvHp5rmtB56QtxM2/yJykz4r90pL7LMLPWMylXeVCh
	wyJb8/jzSDDALLbdAXUjXYiXtbGKUNsEP61BDRE6rsurqhdTy9FWP1erWYf/OgBOJ+yjBx
	Hy6CbOdLBSCGxRZLHty88VqMzBCKgqDCH/NIH89INnJASwuz5/X7k9Tp+Zq4MWsQ1PYfFR
	+geClLmrdyv9qkhUWxgUosBua0eoe+Fy/LM3ZcIzfbmDRtboE2yRyu3E5inaaA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/6] Document missing toolchain related variables
Date: Wed, 26 Mar 2025 14:21:36 +0100
Message-Id: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGD/42cC/2XMQQrCMBCF4auUWTuSTk0LrrxH6SJNpnZAE0lKU
 ErubuzW5f94fDskjsIJrs0OkbMkCb4GnRqwq/F3RnG1gRRp1bUDWovZxIRM1pEaetOZHur7FXm
 R9yGNU+1V0hbi54Bz+1v/jdyiQtLsZuMWp/TlNoewPcSfbXjCVEr5AlNETk+gAAAA
X-Change-ID: 20250317-cc-vars-e2cd2076a3a6
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=K9IJX7v9VTmcNEPzT/ymFsC49Nyz+CsQYQVcMqUTPRg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4/9px5MlcY80aQuZuBkmB4ju2zSPhEOCiAg+F
 ZJ8ykWJjyOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+P/aQAKCRDRgEFAKaOo
 NmmZD/41ce5Pu1bZHuag7+RXGTTJYYcoSafFF1/4gY0GOlhR0Z1LRG40hshqH7wI8tJ+JLrTki7
 JBUWqGjhWr5unEvqufLmDs1SCV1e7nyzr18P6Lo/wuwrCvnuzjKX71RpbmpU4MEcTudvNU3Mh/7
 ywxL9I3hmZg/iVgjkKlEJ5wX1RPiLgBe2yofnMIv86v8lBhzUDjeeaGVWL/+B4t9VOE49uoJwqW
 mhcA5Ob7+0EkE08zQoz+v83D3fIUIEyWvSobszL5MFnFA8KXL74U0yFTb57QWW30FUn5p3aJwIE
 PXp3/HCsUCaRnjR27pB1OlEzZgzWg3rv9cHYBLydm+EbJLOA7Q5qYjQWypMt/01b143Wt0EDLwM
 Kb0E1ucEajTBPJteFRMYI4iy809Rp080l32maxISCdCdyfvvBkIfVsxBfrmuZ8+EuuErKE6m8rM
 BzAn4HyOQhoQzRjEjPQEit9+mH2h0r2PRDzIeqwwqYKY/CvO7Z9bFUELcswRocGBSAZgzQRy4JF
 BPUqzkh3aY1GBw8xLwWjKVF1OrH0dzVwZMnvSaPM6xH1TKe8xPLbl/3qzdgjFGxNybYkm0cUbzJ
 euCpiYw8SgYPhC8/jrvsc5vTvtcSYIBA7q9By3SLkSchzIcxpEnWvjev2eRb1uPANU5Sgj/9N87
 i5GeWgNksSSzugA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetieefveejtefhgeekkeefteejgfetvdevgfejudfgveelfeffjeehkeefffehieenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrr
 hihrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6634

Document a bunch a toolchain related variables. These follow a naming
scheme to make them easier to deduce from the name. Try clearing this
out for users reading the documentation.

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=15719.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
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
 documentation/ref-manual/variables.rst     | 288 +++++++++++++++++++++++++----
 4 files changed, 260 insertions(+), 35 deletions(-)
---
base-commit: ee6b3698da044e290dbc4fbb852f3cc37638e689
change-id: 20250317-cc-vars-e2cd2076a3a6

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


