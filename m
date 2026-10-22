Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23262.1792676306754583349
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 06:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uSM3vkOp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 12C7E4E412B7
	for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:38:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D63E760360
	for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:38:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36B4C10328EDB;
	Thu, 22 Oct 2026 15:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792676304; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+8I09/3AkzNQXBgxk7LeXUQrM6PqMha7izKzfmvNUQk=;
	b=uSM3vkOpAvE3djFgCwKRWdOD7p41saNOcnskm+7idHXG2fH+vL2qVAq9E7Yhv6ZBc54+hz
	X6g7780YyQVyxEHEfjaO0FUPqO6YjlqzUVIDQC3HHW56DLaKmU9s+JV/khwwLz6EFhzMFg
	zC81Wzjac/oI69n/TjRo8QYAgZQY/+KO75wOH3nQrgdAV9veXt6OKMIim58HfCYKsWBoJA
	LBuL9ZqUQT+ObJ10fL+gA92ILTmI+jigOpPj65eY+pIgaC7ljiRp1KaZLLunSCvKheaHf0
	mJp/lhfBQNYYBAYv5amgZ/VU1u0vwTbEVyP0fht6OXANwEJxnvE11bVsyRDfWA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 22 Oct 2026 15:37:53 +0200
Subject: [PATCH 3/3] ref-manual/release-process.rst: add textual legend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-mermaid-release-diagram-v1-3-3351b5799dd9@bootlin.com>
References: <20261022-mermaid-release-diagram-v1-0-3351b5799dd9@bootlin.com>
In-Reply-To: <20261022-mermaid-release-diagram-v1-0-3351b5799dd9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=802;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RcSs0AEzrvwTFxLUhJAs+k3+zK3sFEiSZhmS7PigkcM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq2hHKZvIo+qdyVGghn8ccg/6BzeTxdhzRa0I+z
 TC7qCpmumyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCatoRygAKCRDRgEFAKaOo
 NoH6EACheICu6kL/fNzwa7q9C9HspfA9gzoTAJtJTfAci/1YwYLZ2Wa1KMCN6vXSMwrTclIwkur
 0LG5oVn8fOaxra9+4/RYCeuFXqfu7ghZMpIlcMWo5f/YgL/3XhE0ONRGGBTB6WTMN7hIFIM2WnT
 gawqrsdnGCfTs6dceyN7YriLjU7A8PUwX2OzZJzTkpDg52aXDbGhssLj7tvojcggWnHGaBha0Kf
 zJvSuH05iRZZk+J1jR97sV35CP6JvIG6z4J4JPAnnCmSjPEap8pcgghemWqecjasU9FfF0y78TL
 +PcW1Mec3ZM1+4U3pMbvk49qWrwf10EKO4xcgSr5o5jPRGn+zytDIh9vKDaM+AWOAPzyJJWMB5c
 17NkkvLjVa/2ElpncGE5dydFfVIi1s3gvoXoRmpOf8vv3IRwc47xQoQaJzEUYS7EqcELSsFMiP/
 GG3j0rhcGXrHOFC59NfKI1xPFtnYnhIGhHOqMkbKHNQz0HWgJ9PGYFEYaad/uT0oBPrxqxoilPm
 dyW1uFzz4Q2HQBLsxUmpQtU9vUMK8c1qEmzS3hrPEwruFE8hJ6/IhaLJgq53kl5kJKJLYJhw/ZA
 BhkDG4gBAyvl+1XWEe86EuM16ax5/QCGdF4rB6MZz9sFhY0YOp2tyJmAS1iVTMwhdXAe8Bi6IOl
 CWvhslHoLiADfig==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:38:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10716

Gantt mermaid diagrams don't support legends, so add one above the
diagram in text format.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index dd1844fcb..a75d916bf 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -281,6 +281,9 @@ of stable and :term:`LTS` releases.
 
 This documentation was built for the &DISTRO_NAME; release.
 
+The diagram below shows the currently supported releases (in blue) and
+out-of-date/future releases (in grey):
+
 .. image:: svg/releases.*
    :width: 100%
 

-- 
2.55.0

