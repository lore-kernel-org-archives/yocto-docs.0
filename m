Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B18CEDDBD
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.19556.1728487495997207538
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f+g5u0dX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6055E24000D;
	Wed,  9 Oct 2024 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVKTekHE93hOB8Wqt1xb1WlVvfbwl/x1DveF1yGM7jc=;
	b=f+g5u0dXQ89nyJdWhox1dFdGCik1g26sVQRcvKNcTbsn/RZWVAzfbapkPcBX+VatxELTjS
	EIghWCoA40mYjJCQZ5O8q3Q5uH1SYYUppWV5QfcT3ERbF5SKxGliCS6sBlrvrMQOBIYQwN
	E/c9gyQtZgPDCmON1XtF4bBJppWB9576keXHFPEoQVQ3mAjQJvaJ6RjkLFtz/GGl1If1Nh
	vU7611e7ofvk6MLo1k9P7eVBUIZJHbjvknbTdIEVLOIDgKtpbcdeVkjn1BUt2GWGlg5IQz
	o1o2a/Eh+Wf9Rvv5JGupJAvAShkWCVKuqU8ysxF2TVL8N9/VNfbZ4l3SEiggEg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:12 +0200
Subject: [PATCH v2 04/16] ref-manual: add missing nospdx class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-4-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=792;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Rlm3IE48hEsW+EzB9a615bLjqQCCc/oQamIjDx4W9I0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBDjxyHSEuQm99yQKaMl/vq5tkCguchm4FLj
 +Z5zGqrXjmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagQwAKCRDRgEFAKaOo
 NvlLEAC9fYpIooV47wdkP9jGlXHOXc5L/+0SjbidBF4456HsIXZgEMMaOEvrS+AsTx1Stp6o4ly
 +H6vDdBtlwY2F/I6v5tda3aO/gGRtcib0x92LpkUIC9orFhisX+i2pV1zTuJ3jWs5MDU3FTSDzk
 3viwZwyv0utcCMwWPVQqiFr8Wu1L1txuFuigEZbBCke0R9sJsgKONZPu6CgIS0H7nhZi+i20W/G
 s6WsTu0YixaTaf+xJcJ+SDO/JI35DMYh64SOiVCiYU6So/98oVCVJRWfzGvt6q4Qojfz2Yqr3T2
 xoSMhLrfEuR6GO++crerElbHn8DNib+SYUoM9Qcr9toPsboczofcts0r/O3kJ4uB9Q86Yf9xcG9
 ghuNGQDMoJcmx++dl/shjDypOF5pV+2X/AlowgYYYU79oQEPZxNR9yBWScMfbJ+3pPXDOgTTPkD
 /BPtXm9i+vQqrHbvz54E98yb2SalRbn/5OQF53oR+mWkgNrD9IO5L/pTLM4YDOFHc0F8zeU8htK
 wJxmnDHZpfdjPw4MzLt7/PHRUqJ7t8SZqHN3Od/219p4tzrH7cN/ORQC5UJj0kXBJO56+/a3M74
 52BUqOCPNe1sgxH64LHBuiiFc+UNAroL1BJsHU78ahuNaz8kZL8uJFMHafcsTF8nZT9zp7j2+ww
 NRDzixB2g5cFkHA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5433

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9f6e42725..14aa0f3a3 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2049,6 +2049,14 @@ and the target. All common parts of the recipe are automatically shared.
 Disables packaging tasks for those recipes and classes where packaging
 is not needed.
 
+.. _ref-classes-nospdx:
+
+``nospdx``
+==========
+
+The :ref:`ref-classes-nospdx` allows a recipe to opt out of SPDX
+generation provided by :ref:`ref-classes-create-spdx`.
+
 .. _ref-classes-npm:
 
 ``npm``

-- 
2.46.0


