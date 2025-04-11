Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679C1C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 08:01:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.20324.1744358466559037280
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 01:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dPL5nRdU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F88344199;
	Fri, 11 Apr 2025 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744358465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gjg6A8RRYoVEUhIwqjoWvABlNXCPn32tjaMiWxenA8U=;
	b=dPL5nRdUzk9XUKeWxh4lk+0DFZfiDrXX/BIreiENG0gw212b+PVnnyXAFWYURMbdtZn0Ct
	eXu3VrJSgbsQoVcAWg4HVYxMK0Kmee+cD5cQOayXywXyoKF/2JYovSZfNCsruy4K8i6k/o
	v0c9Ec6z5WXN+TCVTOFp6sDX/eWjecSCCum0LM9194E+JZc4bggGB0Czhy1Rlf4bjDo7P8
	MfIuVRLSoi2QcKHSIYeYlSW9hfFEOBhmOKwpTfE3v8gIOQgEB0ztDvYIUUoe8axkdYFBnA
	TjKbuYpW50v3pW9avBO20JILZPZvF3t4npVJC/ONATGb6+WRMFqF1u5P2J8ZSQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [kirkstone][PATCH 2/2] dev-manual/sbom.rst: fix wrong build outputs
Date: Fri, 11 Apr 2025 09:17:51 +0200
Message-ID: <20250411080006.3071665-5-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250411080006.3071665-3-antonin.godard@bootlin.com>
References: <20250411080006.3071665-3-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhgfetkedvhfegveegkedtfeevffegkeejfefhvdfhhfeuhfevffegvdfghfefnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 08:01:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6732

This document was written with SPDX 3.0 in mind (create-spdx-3.0 class)
on OE-Core's master, but Kirkstone only supports SPDX 2.2 (named simply
create-spdx).

The create-spdx class only generate a tar.zst output, so remove the
other outputs listed here.

Also, ancillary outputs are not only deployed in tmp/deploy/spdx/MACHINE
but tmp/deploy/spdx in general.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/sbom.rst | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index 6949675c25..3d72a689e9 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -30,16 +30,9 @@ To make this happen, you must inherit the
 
    INHERIT += "create-spdx"
 
-Upon building an image, you will then get:
-
--  :term:`SPDX` output in JSON format as an ``IMAGE-MACHINE.spdx.json`` file in
-   ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`.
-
--  This toplevel file is accompanied by an ``IMAGE-MACHINE.spdx.index.json``
-   containing an index of JSON :term:`SPDX` files for individual recipes.
-
--  The compressed archive ``IMAGE-MACHINE.spdx.tar.zst`` contains the index
-   and the files for the single recipes.
+Upon building an image, you will then get the compressed archive
+``IMAGE-MACHINE.spdx.tar.zst`` contains the index and the files for the single
+recipes.
 
 The :ref:`ref-classes-create-spdx` class offers options to include
 more information in the output :term:`SPDX` data:
@@ -56,7 +49,7 @@ more information in the output :term:`SPDX` data:
 
 Though the toplevel :term:`SPDX` output is available in
 ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
-generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such as:
+generated files are available in ``tmp/deploy/spdx`` too, such as:
 
 -  The individual :term:`SPDX` JSON files in the ``IMAGE-MACHINE.spdx.tar.zst``
    archive.

