Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096FBC36014
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.61729.1742894478061054617
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CjShnzyh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4C8844201;
	Tue, 25 Mar 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CcCPRvFvS618M6JX6dP4De/LRk6YjasgZmqFdMZbt/s=;
	b=CjShnzyhfRxgXS52ZMVjS/ViiACM4ThluhbMSP0D9sfkREUKNtLxpvV3ojL6tnr3stGWiV
	cT0NoBlmiojYmG4UyENw/T8/wqTdIs1Lx3qpd7q3Cd2cX28o4DdVQTH95B/iG1KBAire77
	9k4CCDx9ZeJqMM+DhWlMPTsdCNeETQxTNvTtVjuXKGn2DlLCfItuhI1Mk6OWfUcvWEyFUw
	m2RbACzdN/jmqftD/HN5ryZ2QJs6hubXkfh+R4HxWNKEqRVjku0TTMcAJ5YShC/JiaxyI5
	Q1Pqo1tGDvu+CQx8qc+76z3LLeqfEqJRy/107sWdlt77CkrI/sOtX6ir4OHWyw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:50 +0100
Subject: [PATCH v2 06/12] ref-manual/variables.rst: document the
 MESON_INSTALL_TAGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-6-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ftT4A3xWnF321Me7Km5PNbUW2wgGvjjnzIWkWFTkgwQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWKdJVN6HtQ86PRw+//BQ5T17cnjBn8qRKVC
 vl5OMQFNnOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1igAKCRDRgEFAKaOo
 NnfAD/0SMrUnepFT6GQxVPIQwWbj33W3g0zx+J+FCLN7HpSZOsdHG985kibOtsvCY5AjcIatuEx
 L667f4Cl+NUAvRkndv/INNQEXgf3PifRaOCSAgbZv80DYcu66/v59Bug3fJNHwppgAmVBqQT4yr
 0OpWQfAnZ5qQ1E6dVKz5GLHX1Bw5k5hb0ekAViVd3ZybSDsyHsVqp+4jQpIMASvxcxwFWA2mjrN
 ePinTJgH1qPnmalV5aHqekHGAIoZOSp1EWjUK3JmHoFp1z3/6sgerYZ3zCe8h08cLqjFFL8G0sP
 9Swt4nS+lMr0F4AVOFG32ZfbRMtLaawCxQfF1TMFvIWlBjK9ILshQy2fmsdhCIYeK4rnljJmW/m
 IsNv+NtvB/zqlJzabc0p4nNg8InFneO2LdicSVKn9Kz5FCR1PHJnfSOfZ5HUHAHbeD4g/ztQZUz
 zFLf0EVmNBY9lSV+kVU1MEa+8/D5tfXmjMJVWQ4TyHfVuATl2JcYm6rFuvMB41txLwECFWwBQJY
 Zvlo2JbzSzafsIWwISS6Bd0GU284eOg41iQCc/DuNWNKgR07BdReXPfRluxGRyQZVH7vj4rdCnJ
 6cxG6FMuTvOIppWIu0gncnZ73VjaszYA1cw7X/PwDyTWGk7yZHeFkk4aMnPw8EsBSZ6dz8TbtHs
 rkvAdu2XjrA+rwg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6618

This variable can be used to add install tags to the 'meson install'
command.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b872d7935..d5fec650c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5601,6 +5601,10 @@ system and gives an overview of their function and contents.
       you to specify the inclusion of debugging symbols and the compiler
       optimizations (none, performance or size).
 
+   :term:`MESON_INSTALL_TAGS`
+      A variable for the :ref:`ref-classes-meson` class, allowing to specify
+      install tags (``--tags`` argument of the ``meson install`` command).
+
    :term:`MESON_TARGET`
       A variable for the :ref:`ref-classes-meson` class, allowing to choose
       a Meson target to build in :ref:`ref-tasks-compile`.  Otherwise, the

-- 
2.47.0


