Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF8FD6103E
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17090.1769700251135190745
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NKBnm8q3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7E5F2C22F4B
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D25E606FD;
	Thu, 29 Jan 2026 15:24:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCD88119A8857;
	Thu, 29 Jan 2026 16:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RcoZAVkC2xd1vdNzm9mBNhC9lv+3H3WZEMwCWoDNULs=;
	b=NKBnm8q35tJGx7o40/WrffTieoZH64Ism5Lzd2Wa/FuREyl5tQhqCnLN39SSPANEFkhtrf
	kxnBbSG0FI4/WbGKqvjaNFf3Lk8u3FqMLLWA+VOLMMb0u7pqJ6lynEMuzVp4UoB8gaW6Uo
	uSugJnXeoWzl7jHpVfQqmTonxayZLlRHuGcWZ0K4CV0ILlKRN2cy1+3pivv03ETPywQbhk
	HgKBx1/mqsmSsNnhIfJN1kPoJ8d+d2NWWXb27/pk1AyWN1Z6nY3GVv/scNI4asptMEy+eZ
	7FqC5XyU6EbkTuFTNd93tP4JZ6E/lNRub6ELsL7naA0hqu2zbPuNkx9VcsHE3A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:00 +0100
Subject: [PATCH v3 09/57] dev-manual/error-reporting-tool.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-9-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0eU4EKBkNs9mm4UTEc+aHxZz+sIAnPFWJKRuUrBg6N8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uKbUFz/DTVEuA07cr7hd8rKn7CYcGxiJEqZ
 RyF1fS75tOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7igAKCRDRgEFAKaOo
 NqEwEAC8KovWAhjXJU0Bh+03uNvtFGkHXJ6iNPAD3hA3lnG7lQ5TWMNocUI7tdiokGoSHYellyJ
 9d+AtJVQ1BL40HiPdRZxU7Lq3zZzOIbkW98Oz+chsix3cCbd4y8fCJW8quy4myV1kBPcpGuxwPL
 uTw3WS24+5EkUTqq7stgLT3SSNMnw0UkFZNvzmPkgQWeswFI5XBdTFPOt5fqsrrGSTRVob/5HPM
 2AYSv7NQ8FYCVGCqkWjX7vnwy6ZOfNRY8NkMSMdb8XinGbid343LJcROroueEEXayBb5KJhE1eP
 2JYSOCUlozzkyWH39ayUzm0sl6N+bs6NxAujl2q3nCn5FaM0U9vb4dA4YFsOFrP9XvoYtqJDWCD
 1Q7eort4j1WkFU3z3zy1E5GvTfdB2+AePJOGf8gXWwrkD4zukQXjjPdfneo0q5+o+l1dviK4oAe
 BaaY2L56ZcqcQnjF8g+Ij/qBUqstNfI6FFUlRr0tcuvoRuR28g0EvO0FqG8aN/JBi4mteqaJzUG
 6EHRurU2zCI6l3JqEtW9zD+EFRNKPnr5Yw65L6simfbUOGBM+QnH/DGwxRpR0/2Yu/4jSTVaVj6
 caSpYQB07GV6Qg3TCTI8wOyqYMUXvj9bgPScdM4YVlNhRSQSDhjdpzPUfA1jiVDn9emHBG2eQNe
 x6qL3nzF6tGARag==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8795

Remove the single poky repository reference in this document, after the
poky repository was obsoleted.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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
2.52.0


