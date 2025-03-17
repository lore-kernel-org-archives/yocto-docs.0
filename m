Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C70FC35FF8
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.47918.1742202394376182801
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PLKCHzXv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E21854329D;
	Mon, 17 Mar 2025 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyH3rzqH/wl+AsloAFwJSqmU8Mtr26NlHDHUp6BsiJY=;
	b=PLKCHzXvp/K5qfOqqCcSmn5UrceCYG5Cp49+WP6YFq1r7q0VhAKaU6RWhIBYQSLUKyK4iZ
	+pW2CVTLpR1MEE7nDGJFdxWkzTldK8irrXRr4Lf/UhfrMIW2s40oM2scQTK+8q/k910Dna
	Zd/ZsN5er5Yna87AODfUjMPjOM3EiOaNKz9dfk548M0ie4OQWovdmU9zunlzHc8y5VizpM
	JHIkOF/0FaRvzkHEEYCLbzq/8JQKIfE6AoQ6uX0Sbmctzi7yorCyKaSzyAuA9QGdO6tkIW
	HiyXBDOw8kaSivaoLey6VJzZXmSzPBMwENiDpaLR4AxlULvE+f3cagpVZnYvrw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:13 +0100
Subject: [PATCH 07/11] ref-manual/variables.rst: document the
 NVD_DB_VERSION variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-7-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lHX0Km5U15kY2wGeMiUJWzgnU2ZMXXKTUk2Kdi4cq/o=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YWKZDbWEpXTfkhNb1Ajjbqx8/EOJ+HXyp74
 f5zQUMjQsuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFgAKCRDRgEFAKaOo
 NtSAD/9wrU6GgeRNskXrd64IufrtHTt519aNY3LYvkScRFYIdRnZCCykOYzoMJ4ukVoOpW2fYOG
 pWoKbtMyrge4mPISMJSws2WIgHjm73nR6LW1XaEvo4CYVyPhc22dsDXhotC7MJ3HAPYrUUCfFNG
 FwXn3ihIlIvRas7IF7qaQU/PvIYIxqA+TIBD14RgQ6GBpdgofUaSI9hgvFZ0oxMpxv9H5Kl5GVR
 Lv2gOv9p358b8C4hm7H29FeRXb6nAx6SEiKaFK0x6trPWEajsq2HGH9/0mc5jhXtGzMOQL6nTnW
 lGBUQHyTTXaD6hlAip3rCf11gCONzhqtipaTkYs797DJlLkFY1mc0n+Wghb3x2wKvl+4nc+1o8R
 z/iEgu8qYDIJ9oOF9uwnODP5UsWiFC5kvy/esnjFtRuuSjZzndyhTtKYa4LgLglSx62FyjY9aoe
 DzXdhwVxytIluym8mSnaefcAZ63PmjHiBsxt58yF3cVKG18/LasAQ33/jyZ4zUaV1U5cxEstig/
 z0ZV1l74mYJD2iaUhI0MJPd51WT8C+KIHyFJCJp4TsCGEQwxGTaLj4Z7rGbUVjxUORKppczzX3h
 MK8UlnsXHgBTXtkRebCC4jmoCY0nPgi6wrsGa6kLFige9VSu6+K0yd0AbhDV+s+LBMQChPnlzn2
 YHM0hVbOrBBQk+g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekuedvffektedugeduhefhgeelieeifeekheekueeltddvffeufeekffehveeukeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 ehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6568

This variable allows choosing the CVE feed when using the cve-check
class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0aa3a9b11..117893fcc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5831,6 +5831,18 @@ system and gives an overview of their function and contents.
 
          NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
 
+   :term:`NVD_DB_VERSION`
+      The :term:`NVD_DB_VERSION` variable allows choosing the CVE feed when
+      using the :ref:`ref-classes-cve-check` class. It can be one of:
+
+      -  ``NVD2`` (default): the NVD feed with API version 2
+      -  ``FKIE``: the `FKIE-CAD <https://github.com/fkie-cad/nvd-json-data-feeds>`__
+         feed reconstruction
+      -  ``NVD1``: the NVD JSON feed (deprecated)
+
+      In case of a malformed feed name, the ``NVD2`` feed is selected and an
+      error is printed.
+
    :term:`NVDCVE_API_KEY`
       The NVD API key used to retrieve data from the CVE database when
       using :ref:`ref-classes-cve-check`.

-- 
2.47.0


