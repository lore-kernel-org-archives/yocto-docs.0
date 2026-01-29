Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965F4D61031
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17192.1769700256620781555
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zFSDv/rz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 19D824E42324;
	Thu, 29 Jan 2026 15:24:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEF34606FD;
	Thu, 29 Jan 2026 15:24:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42D46119A885C;
	Thu, 29 Jan 2026 16:24:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+KIRsq1o9ehnryYo0s19dvtHfW+cKglzZKCzGbR6OmI=;
	b=zFSDv/rzUVLSzRNbIKX+Kl6ZkolE/HaZpjqraUQpzPEP2IZ00mVlQE/58tO8q7FJrDK3jX
	EtKzSX9MNJNqR/RRe5YjMIiwPq7qwTpzbzrasBUNdx8vmGAHcq5wcZ6jctIYAlXLayCg+k
	jdn1Nub7nK2MWOTHY5LM92WNCr4njWtyTRkU+/CCC+yA2homtGgNnnCCb1l6t3CRMjdeP7
	icBAFAnVO2tr9/lR6fbKUsbJRFWwWP71wFbvIWZvo7T939RMl+sRGn7lKtU8JeNXZTVnHw
	SH7AdfDX6zlWmpPIz4hJqqU7xaESL6Jr+92LRwMeyZNjFwwqrsE8lD2YOx0aOw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:07 +0100
Subject: [PATCH v3 16/57] dev-manual/temporary-source-code.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-16-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KU6p3i5kc7OoFw7iccMBphxTP/RQQ9j8k8kmC5PySoY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uLVv/dFujbywthHd70P4Aup2BNiCYlV1Bti
 jvxPf6MLOOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iwAKCRDRgEFAKaOo
 NlquEACet91dYvhSmjMf7ahp7ApKtXfe/V7tmQAP4BKaMfPVpwMXNeSNXzzbGFLthLYEituewvK
 UJiXjbFPMmcbyVshLssO66hyPBroF3VPy9zB2gmbFTznchpJoBsVefJFxzxpBJlZerHG5pU2viK
 P7djD94CvinUmoip+6VJWUZ1i0y+l2ox0cIHmexa/KJMmhAduER5hYmLaTupsflrDiVa+T27ORU
 0jQeTX/CrICEGyunFdwyIUllhPluTe7mosAp/AHz8RyrM2oMZtIgpxVP0j2ZVATuRLo7k7ELyT3
 jnWkrf/1hP9vXiZbBXOFO2mb7+XLzRH972j+HdhlG96PjodpmZ9zdxyImAvMNMiqRTNvSWf7ZG4
 AqnLg6FgHJnBteqw5BchMN6kP3ocF6NE4iLM/cT0nWfKJAM3xGDRhMmmww/FBUuII60I10q1mzX
 uvAiVWGKHxeGtH1XPJ2UXuJjmETgeALO9bbRVogyBdDBnEfJFgyYg6N+FIOsRG2cpBALQWduKgB
 bY/3bm1uyePmATSS887dY2W8LTyE1COL0lXLFpbaSxnfdDPkTPRRaRJCBykbnvlaWUi4S/Uw+DB
 IzOwIG0hsX9b/qdgZIVbprondk5EhnwHhXhx0KsZsZXFF9L7AmL4iO0qFg9XCyjchJqF2umqys6
 hXkLYyOyPbbIERQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8802

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/temporary-source-code.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/temporary-source-code.rst b/documentation/dev-manual/temporary-source-code.rst
index 977edbc3f..aecd34099 100644
--- a/documentation/dev-manual/temporary-source-code.rst
+++ b/documentation/dev-manual/temporary-source-code.rst
@@ -15,8 +15,8 @@ your changes in the form of patches.
 During a build, the unpacked temporary source code used by recipes to
 build packages is available in the :term:`Build Directory` as defined by the
 :term:`S` variable. Below is the default value for the :term:`S` variable as
-defined in the ``meta/conf/bitbake.conf`` configuration file in the
-:term:`Source Directory`::
+defined in the ``meta/conf/bitbake.conf`` configuration file in
+:term:`OpenEmbedded-Core (OE-Core)`::
 
    S = "${UNPACKDIR}/${BP}"
 

-- 
2.52.0


