Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2CAC021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 09:12:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.15639.1739869927397220929
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 01:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L84YuSLB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBEE3432A2;
	Tue, 18 Feb 2025 09:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739869925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJmIhoN5oHHWX+g64p+nqFpBeH7um24mKDpEHuK1Fsg=;
	b=L84YuSLBUUJjC3txmddODZfL5ptDn3/VAOUMAVU9RpPNrwHTbRyKm/mHKonbSapZqtA+0P
	6mSyip32vH5XH0zXIpFJWqE4CBEkpBby9OogW8FgvzjFR320+K1F/E2OJAOXIMb0tMorMw
	MJrRXLzj0bYOB72Zc/ulKEuz3+RRtA4ppL8vNcp+RVC0WuOLd87jA9D1cTk6RFcwEIXRRC
	C9ImYSsm9OKFV/Mpf8xvtJQFtWwEonjkKl4hYT6WIfyNMFpfzBsx7hgYgUxXIh9SfnHiNK
	vi86gRPocfqe/QlW0WB2gy3R/9ArLS13wult5TyHi8l9tLqjpKgjdNESbU2NYQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Feb 2025 10:12:00 +0100
Subject: [PATCH 5/6] overview-manual: add UNPACKDIR in the directory
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-overview-figures-v1-5-75d23b5e7a88@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
In-Reply-To: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=64W1kVfzZMYXbei3yMxmpgdNAF4ZXGwF94RkCEsOQp0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBntE7jDhxb+9o6Zdm1ES9HiBlNuuxnj61kTajTH
 a9rUD1D9o6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7RO4wAKCRDRgEFAKaOo
 Nka7D/441LwqUgXVsptjqdzirPPuYLkjM3hYFMtA6tNEqWybPCVVoGknP9oxLrhDh0x+0sZiqBK
 wsX/sRWYnvX8N7Uv3MCDFKifce4QoHKI3LeA+BJrtJYnW5gmLRSuQOw+sThnx2qZ5Yzt+zyRFKC
 MtJH3n6F1r7Uehv34Hv1PvI9GqouSmbTcqRZV4485jJgoO/BtZtXJ/M1BWhrHPba1fXxEkxWC4O
 35pVlNqm86eDS+27EzaQVskxgqablUpeWm0+JU9Dc6K6WLaUnxU5FmIaWQzfZUhNClTjMQ+5U1b
 WlWh1F6AEgDFRlbsusHkft9LXJZuwBcLCywwsJaa/6VKo68mvG1q4a+C4MvpJNeG6n00Bsfls7/
 glU/0YcOLHV/SIt3RoW8xce/DvPqlcl5lSKMzF1QlDLnD2bx+WrIIC4Ssge/qwBuT1E5/J5LVhH
 YlcvQnRm9Ml8SHOHOlvQX0oEapJdLB+DuYKObEk0dfDBHsQHLEqbojr9k4UZjY3msrZbFIZ7nkU
 zNKm6xC1wzBqd1OBWc2U9uPK0H2KYh2myR7Eq6OVkO/4nvLFfhjfeDwM6guGSeu3fnSugi7B2nP
 sIBKXoaE/F6SwtunIb3DXse/P0Lpfp2YVeXtKRL6rH2H2/O/zrSrwyNdd2Wiatvu9Ff0TtHe4io
 7ATiwCVIVEzvtCg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Feb 2025 09:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6414

Mention that UNPACKDIR is used as a location to unpack the source code,
and that S is the final location of the source code. This is
deliberately vague, because as there are multiple instances of how these
directories can be defined and used.

The proper explanation of how the UNPACKDIR and S directories interact
is left to the reference manual, under the UNPACKDIR variable
description.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index f0e2eb224908c149aaeada209af99e1477ea1cdd..e4d806f98ff2c8a9aca1b7c22ba0e0940a98acbc 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -704,10 +704,10 @@ a defined structure. For additional general information on the
 the Yocto Project Reference Manual.
 
 Each recipe has an area in the :term:`Build Directory` where the unpacked
-source code resides. The :term:`S` variable points to this area for a recipe's
-unpacked source code. The name of that directory for any given recipe is
-defined from several different variables. The preceding figure and the
-following list describe the :term:`Build Directory`'s hierarchy:
+source code resides. The :term:`UNPACKDIR` variable points to this area for a
+recipe's unpacked source code, and has the default ``sources-unpack`` name. The
+preceding figure and the following list describe the :term:`Build Directory`'s
+hierarchy:
 
 -  :term:`TMPDIR`: The base directory
    where the OpenEmbedded build system performs all its work during the
@@ -736,11 +736,11 @@ following list describe the :term:`Build Directory`'s hierarchy:
    -  :term:`PV`: The version of the
       recipe used to build the package.
 
-   -  :term:`PR`: The revision of the
-      recipe used to build the package.
+-  :term:`UNPACKDIR`: Contains the unpacked source files for a given recipe.
+
+-  :term:`S`: Contains the final location of the source code.
 
--  :term:`S`: Contains the unpacked source
-   files for a given recipe.
+   The default value for :term:`BP` is ``${BPN}-${PV}`` where:
 
    -  :term:`BPN`: The name of the recipe
       used to build the package. The :term:`BPN` variable is a version of

-- 
2.47.0


