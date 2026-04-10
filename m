Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071A2F44875
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158225.1775832229432317902
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=X6uG++hQ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87951C5C1AE
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59E1C603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADA5D10450072;
	Fri, 10 Apr 2026 16:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i/vtG0iIeh7cso4ta5qq1n9ZBIr0RT7cY+x+vMD5TU4=;
	b=X6uG++hQDPhUxaqfGGJQTe7BI+owhk81Ljk5Y1+45CSBb4a5bupyD+LpuI9jnHai8Xo8+1
	IlaO2W0KlRHAQjLCX37hXB28y7u+hIdFVcnCDrI/txzgsCjxyD+JMTxjRMwhFp5tBzecbV
	tRS+lbwdirObXmbBFmeWzh3xLW5lfK7rVhR/lvk9tT6GINy6OnIbPTmzfKmk44Pgvd8SGk
	5cEUTAxPA6sYltq8aiomid2MiLR1CRk7hmV3a2eQfy8IUQqgG2NBTUNSxr+LwHLTVEdW5G
	aUvDpA6trdm6UuvuLSezM50pSVJXDhc46p5zGW6f1kJjE3Q1BhjJUFjnxhlJJA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:34 +0200
Subject: [PATCH 10/18] ref-manual/variables.rst: document the
 SPDX_INCLUDE_VEX variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-10-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5iER5ZRDYHAqDvVEQaj9J8IaXqIgdx89L3VxR2wMbS4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyYkuT3iLzFjZWQ96kwyhsvzwL5O88fUrTDB
 OVRSQOWcyKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMmAAKCRDRgEFAKaOo
 NkCkD/wNZP0DfJgiJ/JwxYJB/aEwi2i1J/swK/y2HT0jaXCr+63mRqFr+zZaR4bbtnK4E+ndsk2
 TO94UK7goGJq/EbS+rl/jq7SiCI4PjoSuRT7t5c+Yes2PAayIMbn27jwWZxoaWReAIElk0cVHgP
 tiCa+WIi4LgY9Y6MlP4MOJZZeeRU65lZC2Or4XOVloxpUIxhfNQ1/0SRfSKXng9IXLeRowtq1+k
 k3prcsB365or9djUIK5qpwUqA/WbvUQvjpqqz9GwyKxzFnX0Gmf4X0ocNrmEjf06g+BXMlfWb89
 utwvIeOeFa+Slfgz1/P2qx5kRYf1Ej+JY3OZmRU0in2brJwYbmaLdk611szhD0BUDrBnga8F9Y/
 qiEkKAkfhacqh6yQ16a43ok3xYy9R8jH7qR0pvoh/5Qjv+qc0zDIjO+IAk+FJzKuYJQ1XO13EKH
 m0ydhVRy0SgDCR0ZgxvVUtaOKpuj3ltX+KOrCTGo4vqa/H9pg+8QsfLsvxHaA5caPI3NcqEoyQM
 QQ0RAdFqV457X/h7JUXgoihQ1loX9EP+jDOJHntl1I+a9OcOF6lb7k1E6SoJsgvR1h+lXYGaojD
 LC4BamCzmKhw8eF7k7TeBJ7OTEh5RgYT4v3VXtiiHS6rgcKYpdub5X725pNnd15HhYO63PCETXu
 EJ9dPqFP1zTumaw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9241

Added by commit b63f6f50458f ("classes/create-spdx-3.0: Add classes")
in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 653bdb1b4..89a5e632b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9563,6 +9563,20 @@ system and gives an overview of their function and contents.
       increases the SBOM size (potentially by several gigabytes for typical
       images).
 
+   :term:`SPDX_INCLUDE_VEX`
+      This option controls what `VEX <https://cyclonedx.org/capabilities/vex/>`__
+      information will be present in the output SPDX documents.
+
+      It can take three different values:
+
+      -  ``none``: disable all VEX data.
+
+      -  ``current`` (default): include VEX data for vulnerabilities not already
+         fixed in the upstream source code.
+
+      -  ``all``: get all known historical vulnerabilities, including those
+         already fixed upstream (warning: this can be large and slow).
+
    :term:`SPDX_INVOKED_BY`
       The base variable name describing the agent that invoked the build.
       Each ``Build`` object in the SPDX output is linked to this agent with an

-- 
2.53.0


