Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C59C35FF8
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 16:03:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.56738.1742227418511148496
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 09:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M6JfEur2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 822ED44292;
	Mon, 17 Mar 2025 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742227416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E4IkcPZJ0StasVNKdxJMBlQCwt5nyS9+/6WBifZQlZ0=;
	b=M6JfEur2b1/Ndma6sLUT5F7Qj+Mb6CmkR+HBLYW+9KP/BT+09fPQQMSdcnQEerRBygjJg7
	bQ2eRgo8HHxA2/ORc+gnQ9Bs3wBT7IMUXrk/e32K+M40IysUKOz5ITFuIe6OvNLU9yRrlb
	MQiS6Jm2aE191JwIvk0XNFBt6uGo9x1hhJUsV8uIXNmixyfO2hwd9w34JWd8HLCQW3e068
	TuVtSaAcQUJs+WmBiZARsJ86lXUBC0f+hfw6f/Lrf/M9bMELesO8d+MsCnAIg2HHBgz4NZ
	g2Km9g8bgwQzqTqXfEstGHTkpFej6Hwye7x2WHx8vXV8m9Y2Ol759bKUI8xFmQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/4] Document missing toolchain related variables
Date: Mon, 17 Mar 2025 17:03:27 +0100
Message-Id: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM9H2GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Nz3eRk3bLEomLdVKPkFCMDc7NE40QzJaDqgqLUtMwKsEnRsbW1AId
 5l3JZAAAA
X-Change-ID: 20250317-cc-vars-e2cd2076a3a6
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=929;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cksY0TA5q3bZ/moC97at5dlij00Dlo0sfkZqkIM6zcU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2EfXhvEjgNOFzuplin0E1LoF8zcq8K+y4Z9Q2
 RLofUNZ3FqJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9hH1wAKCRDRgEFAKaOo
 NkcgEACNK2Lu6msavgS/3e3tDJLqtygP7jPrfBTYYj8omsJ5W+W9cL21OVJNaIr0Vrh0z3Gjnpw
 1frjUbPzJMUMoz+XzdBLFI6ZMGYMCGvg1yq9+hLo0DUTJq4WBeOjhG2sHmEMGL7jq5YUPMjgyrm
 j484lrlvlp8m0PJjzNkb2q8yDzlffS/Ujfv9zPP1FTVvD0idGSDRGWh6s1EaFf6fJik9+FKt5KV
 rOPnO3p0/nvbznOx3fqAkd48nXyqtKOGu2xIfWU5LWyAG5+738A/fIjsDFsAjhK2C+24qKdl4Ut
 O1TGTxW+QK37K/6mu9L78JfIrjT2+q3zXhFDBMPa5gyRtIJ8SnTbaEEz/PJ3J0449YSVnJW3MBe
 s7hvoPVDcENs2r1CF/XlPm10Bmxq8USdPvhwDJpjYaZJ3YMNZviwSrpCi5oaxQp4nHKgLoIg2cN
 RbvgYT//LyPhePqbjdkJwi+z/s37q8dluhEI9MJi7eV3/HDliyiXyMOtqKRxUAFSB3hyJTAMIEu
 E2tEjwFDWUw/kwuEh8/wL2f2y+Wo9S/yLVc2WlY/7iOv3JRw2veyGk7Vj0mXGOgsPGu7qeQN9c3
 DAyJ05lCiBo0GihvXDtD3vgUgqvJQxwGf5x1jpfFnHt2mAoXEe1jeKdhNXovMtxxxbSLL8WmnBv
 HNHd8mCPyVbBvRQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdekgeevffetteffffdtgfelgefhfffggfeghfekffduhfevfefggefggeffvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 16:03:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6581

Document a bunch a toolchain related variables. These follow a naming
scheme to make them easier to deduce from the name. Try clearing this
out for users reading the documentation.

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=15719.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (4):
      ref-manual/variables.rst: add missing documentation for BUILD_* variables
      ref-manual/variables.rst: document missing SDK_*_ARCH variables
      ref-manual/variables.rst: document HOST_*_ARCH variables
      ref-manual/variables.rst: HOST_CC_ARCH: fix wrong SDK reference

 documentation/ref-manual/variables.rst | 152 ++++++++++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 2 deletions(-)
---
base-commit: e608902ffae3af5ab0c5308b0550e49a790482f0
change-id: 20250317-cc-vars-e2cd2076a3a6

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


