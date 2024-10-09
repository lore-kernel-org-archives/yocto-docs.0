Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0BECEDDB0
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.19559.1728487498716756852
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kSkahsv2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19DF724000E;
	Wed,  9 Oct 2024 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsalG8DcZEDDcC9J0XvX1DylbvOi8wtw2OCmR/w3chI=;
	b=kSkahsv2v4DWjqkwhFkHOlE6n/7n1hncQ/OHJ/ymO4qrOjSZQ05/dQ4a7DWVFD+v/l00LM
	oOjx4FP9NEwkQk18bMWczqZFzpR6Qve+vY0eZmjN6gRSU2Q8z4k/SWareCk9o80I8aVtwk
	/5GhAI/a/wZFfq/Vo7pSaauoeqTKhC6QMPhjyGSBBjjoHeY/4r7WLIapYPjKX1Lqa2k/MS
	99Edr1DsIVXBZ9SjE/Thr28sgGw/sGvZYXXccAOMAI9ELqY6u0Hwjva/KkEUgMcgX/xGR9
	0wQZ2ayVEb9TbJ8yOKyDq+rU40JYHBa1JkyD+Hw2qZ/R3/A8nJQKBn317Z5Xiw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:22 +0200
Subject: [PATCH v2 14/16] ref-manual: add mission pep517-backend sanity
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-14-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9IcdLhUFTo4l47JTGWKnzN7B8yPoL8jMnzxdUIckpgs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBELoR8W2jkIzlGgavGIsDGklU++mUbSERsX
 0mumbozqN2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagRAAKCRDRgEFAKaOo
 NqDrD/4sB8Uyj3cmizsb52vln4qaX7Wy+rzbd5pNwvSoujgVSaN6Vjf5LdQhuVFw2oHcBAa9Ezb
 CXkWNs0UHWLG9QNfOIMCmqYNoNZ53lkFvRRCJ7jhyC8HIWk/bmFPna6RKnaLUSYKmTC6pPgZhfs
 gEhBVI7FTSYOMX4lHSemWt821nBu4ZOuTmap/05JTfwX3TQ+uNaXMgqi6/vjtkkMULJC2E6d1EI
 Z2I1i6xCLAoSdc/riC3Vv7Zrv7swW0ui0Iv0J5jcn8k59jq8r5ZoXMKMlU1g03dAfx/qsRVS80R
 PDF865DudvzRIeVYxeHl7ot3xBcK8eSVylzMARiqLBhZ7P2eoobayd6o7XCU+3rD+MJyDcyKHZe
 dhC8KiF0WrXF2+YN6VdUwEpiI6LL52Aj9nLef7CCFZn3yx4fTqOIVxNlXpb2ZsOvPaP7V/UqkIJ
 Ht2JZ5JyV1HXmuz1DuVbwUzsFRjXvevC7sne9bq3jZTL3mbF4FSJ8OM8p4T1hR4BQnN15s5RAJZ
 sgj2yiY3iNXGL+o69AumTi6TDSHN6cvkGfWmzuASGUELCx21SLSS/RvLGJSz0ZzPSdlAsFDC7Co
 wWuuKA8cavXeGWRbwJT3jA/BybQ4ppNGj6PToUmg/O6mrG2JUi1jqbLcbAam3Rc1sEry6ItGd5e
 0fKLZnAhIFa5rnA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5443

New sanity check to check for PEP517-backend compliance.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 0fce37cfa..f3874326d 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1478,6 +1478,9 @@ The tests you can list with the :term:`WARN_QA` and
 
 -  ``perms:`` Currently, this check is unused but reserved.
 
+-  ``pep517-backend:`` checks that a recipe inheriting
+   :ref:`ref-classes-setuptools3` has a PEP517-compliant backend.
+
 -  ``pkgconfig:`` Checks ``.pc`` files for any
    :term:`TMPDIR`/:term:`WORKDIR` paths.
    Any ``.pc`` file containing these paths is incorrect since

-- 
2.46.0


