Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CC1C3601E
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10719.1743167256754295468
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nnX3uGcn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5238C441AC;
	Fri, 28 Mar 2025 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nhL3ex8p8tO/IN+9jxkjJUcpoHfWhvVwTUrOSSuuiNI=;
	b=nnX3uGcn1HS9J0eYb1OxEJwjN552nj0Hmxnwa/yTIEEzKqUO7BJhXV9KrqVSE6xAqgaptX
	Aw6MTZOjXdyOkQAqkG3K6NeJ9+FotOvRaHi4X3fTNbPhyLNpNNITPEYJmsZxraAcsesosB
	/Aj95nszAZHPiDVj018enz9sk3u6SvBP1otMkqoKZxYA45XPmFQnt1gMu/YKglrJcFraZ9
	7FCEPIoroOsB+xT2201+jOr64yjisltwK6Vuc9OQGDKmQ3HwARVHeaL1yt+Ih09zyrrBAl
	xzq06bmNOhxIAB9EL+ePK7VJk4j15GTdbH2UMlXqE5tKQrn1Qp63204QcU9dmQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:09 +0100
Subject: [PATCH 06/11] migration-guides/migration-5.2.rst: final update for
 5.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-6-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rZcgx8bVICm1utvTx7ZHyLUQ0w0QJwvbCSZdJRCrQ04=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8Vru6sEpVbrFd+WbA3tDNsa8aXdi6UWOnuy
 2XjZmApiXaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFQAKCRDRgEFAKaOo
 NgppD/0Zkpk39GkaIccFWHR3KtjSSCFyGyFfuzXphHq9I8NZKKr+IYAURD55Jay98cxjj6VwoH4
 ERprlBx+/4d2Ek7GXa+KW6d6QOOlyf2Uo19JvDInxyRg0zN8/gvmFM/2Gb5etacJwDKFrusmrm+
 39GmW/l/ZzicG9UhsEZjUF4y3YhxXmHHhA0v8fdQ1ShRINHpN9fRbcL3KHjNYbvUXdg81KTV7eD
 ymZ4Ec+lROJid244C27K4vTJ0cPE2WIdEzAIixu68Q9T1NdIcSwOHyO7r4HftOaPkBskkyQAg58
 pli8ecz/HA+p6NcZ1zY5Bfsm1dWJhtFkBtjPbHyb3ipSi5I84r5lnGEUG0+umbzmYD8Wgb/zKn4
 XHMT4ZjRGIn0Y5ai16sKElGnJfi0XsHZ8BudMiCHJtPNrvahf9tzPeYJKchY5w7+nN0UBuIwsp5
 74Ga3I41SfC4P7+6BLsrwf3Rs1R7Em2UmSCUCVs1oRihmc2X7DQdUdnZLXOaxcHjT8lY+KT+hPz
 8/kQsOwS/gqn/hUVkOnCzGcbPP9RCNAnfU4MFKkYkIThXG0J83lfGYlqVzIcpPDLL72+Cj9mXrk
 jo7StEOqnKt7Qc5EfZzlIR+WQtLuZpGkPTgql4sotSxPL8bF4rcMztI5ef218UjwPHgHf5+NV3m
 dq9+MgF8rw90q+Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6661

- Add new/removed supported distributions.
- Set the oldest supported kernel.
- Remove empty sections.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index b5df4412e..59a2782f2 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -39,7 +39,7 @@ section of the Yocto Project Reference Manual.
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
+The :term:`OLDEST_KERNEL` setting is 5.15 in this release, meaning that
 out the box, older kernels are not supported. See :ref:`4.3 migration notes
 <migration-4.3-supported-kernel-versions>` for details.
 
@@ -49,12 +49,17 @@ Supported distributions
 Compared to the previous releases, running BitBake is supported on new
 GNU/Linux distributions:
 
+-  Fedora 41
+-  CentOS Stream 9
+
 On the other hand, some earlier distributions are no longer supported:
 
-See :ref:`all supported distributions <system-requirements-supported-distros>`.
+-  CentOS Stream 8
+-  Fedora 38
+-  OpenSUSE Leap 15.4
+-  Ubuntu 20.04
 
-Go language changes
-~~~~~~~~~~~~~~~~~~~
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
 
 Rust language changes
 ~~~~~~~~~~~~~~~~~~~~~

-- 
2.47.0


