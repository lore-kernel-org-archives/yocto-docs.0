Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B88E776E6
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123719.1766593914552931917
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SWFPdjuP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 14B1C1A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0B546073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7C02102F0CD4;
	Wed, 24 Dec 2025 17:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593912; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o9GgY//F61xZzwYDJzQwWl7Hpn53VhrETwgAski38lE=;
	b=SWFPdjuPuJArrgJy44R5Ltgu6mf6W5KvyK7kJMD718T41l2E4zQ6rUC/GFVK3mchp+FyQ8
	zpQYU14vYKOaFPsTNS7NKpQwfYT79RiCUDEJZggwBWiuJtFbJYRbyZAjbzl1hpsKsFy/4T
	FEUsW1bSvu7BbLBKw7iLiga2eUhKTDql0izYcNrIWIGrcZcE5cpeBB6DFmnRvYYeQME888
	iSM3vMoLjWVg6c3RiUSFlq2Tmek/J86pLid8q/eM2GgmTnrRbIhHCWCRuJAWewg/fGxph9
	9y6a7ngg3U16RbnnYFtclcyE/1ZLDNzbRZ4OhqaWlinQvx+REZrY77ArM4oIoQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:35 +0100
Subject: [PATCH 09/53] dev-manual/error-reporting-tool.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-9-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lmN2JmHeLlCUdtBG+GbzjZODfu7J9BDtjbctkvXVVmA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVoDEurI6wjDzKFHausAm/e7lVXmoYDdJO/x
 MLoWIm0WZqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaAAKCRDRgEFAKaOo
 NrMRD/sGWRcBQNezRgrFRfEkb1g0HNbJNC9oS1cokCcGb6NM9elsCcmirFn7dK/QSkl3y6SKf6c
 IeXoMquEZf1aBbnVUpzfvnlQsjwlCVxiWw9B14qOBJ5OWsr+/bxTK8jsH6tVJXyzMNeaATdueup
 ayndF9iV5RTbtqsoPOwIOOPGiRcxxKAn0YGkbkqoQGyUey86ZQURlnbItFwxeuze1OctX+5ehTQ
 nWp5iiXT1ghypT5o1CoonJvJC6ojlKz9VDH+3gPckj+MQH3htDnvZ8KPAwMpsJN0YRV/rWSiHhA
 e2n5MUieyLhIbztbuiFybKxASZcVqAS28tgZ99di73lWCV/7Z3S6MDyNDMVSxNZ0n9ULsWtKD8+
 kJQLdjelDhC9QE/Ug+IFJjcaBXubkdeoGgukzc4qFXcYJb0dy5VlZqo4ZOGSUY5Y/Agm9ZfDj7P
 cyR7wtxmyDR/Ud9N4a/sH//wyX1lYAJ46bAR6F6ssUKWMM18eBs0YQ4IpZt8g6JURJ6EnCddIw0
 CuWH8HEUd2l0bXpP9mS3dB+AMjXDdEwIPaCPb5518l+iN02ZWSYL87XQOk75BKv+G8rVHQZ6nqC
 yPgSofnqgPwLY/AC+cKtTbhjEdMSJv2q52pHBByDWiD72w5CFTeMxu+3Rclu+TWhGxtWmjI82WA
 3kn9oM9wo1pTMbQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8338

Remove the single poky repository reference in this document, after the
poky repository was obsoleted.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/error-reporting-tool.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/dev-manual/error-reporting-tool.rst b/documentation/dev-manual/error-reporting-tool.rst
index 84f3d9cd1e..30d1ce2b31 100644
--- a/documentation/dev-manual/error-reporting-tool.rst
+++ b/documentation/dev-manual/error-reporting-tool.rst
@@ -7,8 +7,7 @@ The error reporting tool allows you to submit errors encountered during
 builds to a central database. Outside of the build environment, you can
 use a web interface to browse errors, view statistics, and query for
 errors. The tool works using a client-server system where the client
-portion is integrated with the installed Yocto Project
-:term:`Source Directory` (e.g. ``poky``).
+portion is integrated in :term:`OpenEmbedded-Core (OE-Core)`.
 The server receives the information collected and saves it in a
 database.
 

-- 
2.51.0


