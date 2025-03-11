Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49679C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:31:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.9097.1741699883947791648
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 06:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ey8S4gut;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D1E34419C;
	Tue, 11 Mar 2025 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741699882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dblZXgH27q9WRahUcECEvZtQLTmVjYCyQCewkdk0ibw=;
	b=ey8S4gut9Od7Rm6BVHmKqbgxhYXy3By/aG4DUuVeptNTfw0YB6MJM2wsoNfy9oXnUtZNbb
	t2oZZCjohUkuTiYVZuhDccH876uhNCDdSs6X/YR4PBe9rxJitkS6qg8YIj7mIBtO6HKreD
	uw8N8liHtZx9zSYshmJ0YAaRgsavP2KIT0Jmu8UF6xa4r8jikvH6nQzPWwiyHaF8HiDlaG
	U4AvbsIjOFO/wKEELT0rLB1VXtSSWCsPbY4Urh4k45O2L4J5KPaUOoWkYH2kJQVhdpKJLD
	MurO5DdYCNGl/ITa8p6LCwcSLfWazIgVs6B+pzgXaD/0GI7dTg1cklho73xXBA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Mar 2025 14:31:07 +0100
Subject: [PATCH v2 6/6] overview-manual/concepts: add UNPACKDIR in the
 directory description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-overview-figures-v2-6-63f0c89fab98@bootlin.com>
References: <20250311-overview-figures-v2-0-63f0c89fab98@bootlin.com>
In-Reply-To: <20250311-overview-figures-v2-0-63f0c89fab98@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7dI+BnY1379B/2tfZIAVTT6GvBbzlk3fkMrPDbqQZKc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn0DsoDPWS2nAHMBS/qYu/GdZt3e61Adq+kUKMr
 qZ4DPr+xL2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9A7KAAKCRDRgEFAKaOo
 NmG0D/4xDuanKAuyLu8dAQ1/IHflfPK+zGcIJHPU6cbuGmuleWIFsxtAtHXxVTgewdkZ4kAFNjj
 d6WQfXHkpoH3sjS7yAC9QI/4VORJTeiU8E5a2fXyFPIBAkQsgoVtpXLL0WJ1ZRpasl62G2zevtp
 zWycEolJas6z3cFo38LdXLy8GJH5MccXs9AcLGIN4talO4+R4o/ravw0irJTkVwAcqKbVi22g1p
 xv122twya516ak2LqeCk9h5m9pnP4CLlCKCfH3IvTCg/PoAZU2yFf/1mhBKN1uvzE2Ee14KpMww
 IWZlZn51nzI/9YRpEdjjTdDjktuyW3h1BKpG4EVJ0GuFzV0ATJNGSgK81Rrf1uaHoJfoR7As/bR
 MUWQW8/m0JPLXA9DzXzTTSi2RAuWbhuEmv7UakzX+2TMEH4LFM1JZ2y1Yc7SY+AxhbhrTNlP7Il
 8opCmxX/xtXgwb29rSFLskWA7fih6OdxCvJrMhnqgjr35WgqqztNyWJixXpxBtIOshJeYYx1YJw
 81gWD87fJLYQHDjwh3M1wJYsgTFoRRIOw/XEN4w/17eFFs7nyo234OYchdgYmuHnNQGYR4x2xES
 Q/kpBeMQoUL053g+LR3XDte27crulxhAdJ+UTPPYh+G8iiI7Jp6obToVnFqFKFSPpngUPh9t+OD
 MA/Y3zrVL8wwbYQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 13:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6539

From: Antonin Godard <antonin.godard@bootlin.com>

Mention that UNPACKDIR is used as a location to unpack the source code,
and that S is the final location of the source code. This is
deliberately vague, because as there are multiple instances of how these
directories can be defined and used.

The proper explanation of how the UNPACKDIR and S directories interact
is left to the reference manual, under the UNPACKDIR variable
description.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ccbe2f47f..e4d806f98 100644
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
@@ -736,8 +736,11 @@ following list describe the :term:`Build Directory`'s hierarchy:
    -  :term:`PV`: The version of the
       recipe used to build the package.
 
--  :term:`S`: Contains the unpacked source
-   files for a given recipe.
+-  :term:`UNPACKDIR`: Contains the unpacked source files for a given recipe.
+
+-  :term:`S`: Contains the final location of the source code.
+
+   The default value for :term:`BP` is ``${BPN}-${PV}`` where:
 
    -  :term:`BPN`: The name of the recipe
       used to build the package. The :term:`BPN` variable is a version of

-- 
2.47.0


