Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80C3C3600E
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:07:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.45523.1743066476462893166
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 02:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ISJ+QjuI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47AD8432F9;
	Thu, 27 Mar 2025 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743066474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P/EVbynh9qwsKubGUdL0mK9lF//Wg9Iy07tc+LCvyZs=;
	b=ISJ+QjuIYLkZNkwh71Ejp5nIXD0Nmwu54vTGwlwQ/9Ak6vhXHxrUTPOeeBFXDM4CdlqX1K
	I59EwWHyoi7ZCFXue8yOHJLM4F8KtkRPmWEHISWeAxvEzx+k0IGUbBFy6YLIF4IW/XcruL
	2uSIQLHZL018jkVMhSonZ9QSOBZqKmKOdKiRrY2BDLywnSFi87nnCEeU66Ax/ffZCkrGBf
	4ZW/mxofsMOPD+zuEfMarJoC4eA6iUy6olDa4GdBecQ2rcU7MkSQreo90SfdnEibZIBuxG
	NZlQmOA5jD5/hxKIOt/bOWuEfyZKkF9zOMJM0o/Zn5YWaZP+zOxQz340aydUYA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/6] Document missing toolchain related variables
Date: Thu, 27 Mar 2025 10:07:25 +0100
Message-Id: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4V5WcC/2WMQQ6CMBBFr0K6tqZMoagr72FclOkgkyglLWk0h
 Ltb2Khx+X7+e7OIFJiiOBWzCJQ4sh8y6F0hsLfDjSS7zAIU1EqXjUSUyYYoCdCBaozV1oj8HgN
 1/NxKl2vmnuPkw2sLp3Jd/xuplEpCTa61rnOqrs6t99Odhz36h1grCb5MMB8TsqlNe1BoKqzs8
 ddcluUNi0wgBdoAAAA=
X-Change-ID: 20250317-cc-vars-e2cd2076a3a6
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kdFL+VcKW9LRlBCsBBhKlelCVqYtae9XzygwQCqrBMs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5RVp1rhbtztAJzhTSHbhdLZlpT1D1HHS0pzHQ
 I3EIz7jGaKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+UVaQAKCRDRgEFAKaOo
 NjswD/9+eaqQ0TdYIC+wANqwhfQBRfkelQ13GesmbnTCKz5L9WRVnDB48f44aj25vrBQeYWG9bX
 1M/nRMQvxhu8OurOmQIugTWGuuP6aUgkN2T6epjKTwOzBgVNYcw/54FCW6P6wLkdJGS34h4Pf1s
 cb5OHCJDxG8wiqEQFHHelzs82n5XHiw/wq+0QGkAa6IGYmcf2UGapkf+z1aI7l/upCruzIQAAbM
 p2zYmU/wzHOHUqA2W4+xI1SxBISfxnDr8URGMn7nwSiJShsDzBNagyzak+hIO4mw0wXTqYFYgK7
 8oVT57v9b9sXFoKm8OgUX1WSb6zAcoaFfSHb6fYvbHnCbUwR/wpEdYrxqhFpyeoFlMvgu6+/wP2
 mPG+jAdFoNTOPHwAQ1ZlvHVT79XnrMnWP7/d21wgQSqWlDFU6+ef+2zVKSRJ/9Qc5shx0rVm9TG
 FI4Sj1nR/s3VDIl/bsDlV6CLNmot9/tqk91mkdt0s9ZJR/ypA3bE1rwADwe+rGd2ZGFfQYJad1t
 tQYpvpTFvBZmGphR43tjIhF5GSZd1ek+P8urI4A+WR48kGzJEJYp0W7D7py1dYHM5SI3UxWGW24
 Z5+MmErOLgE2adT/NfDmx+b7XpwNJnu6WAOFI5X9RFYwxAH4JIdtGD30uh6vVvJHH4PXNWfEyLi
 SSrhK+akaFaD6PQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieektddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetieefveejtefhgeekkeefteejgfetvdevgfejudfgveelfeffjeehkeefffehieenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvt
 ghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Mar 2025 09:07:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6648

Document a bunch a toolchain related variables. These follow a naming
scheme to make them easier to deduce from the name. Try clearing this
out for users reading the documentation.

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=15719.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
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
 documentation/ref-manual/variables.rst     | 319 ++++++++++++++++++++++++++---
 4 files changed, 291 insertions(+), 35 deletions(-)
---
base-commit: ee6b3698da044e290dbc4fbb852f3cc37638e689
change-id: 20250317-cc-vars-e2cd2076a3a6

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


