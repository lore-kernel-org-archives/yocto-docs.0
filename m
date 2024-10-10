Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74567CF11DF
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.41664.1728562261339357699
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SC5Sf7/F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF74EFF807;
	Thu, 10 Oct 2024 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BE6KBM5WYJgGs0eaBQFaOAnaoGw2x0RjtC9+W4dZuno=;
	b=SC5Sf7/Fy/XfDDeDH3LOfMjjY4AqWXe/wrT2voYyIbLMaqdptPyrly1hrgfxgUXx9pT0y6
	iTa2PiNfm1PUUKwYxnUkY91cZso1dhRdnLBpbTEMRK09pnp2eOEln4ioM/ZyHLjdO/YPpD
	y+V1BrrAXEHUnY0wpyGqYB9YEdWaYhlTHoQdrMyXKX6OqU/+NwzXrXI7gdSUPvW8jRcl1D
	5G0vaOvFiNaJjnzpCFSWWdX0P+LZCMQTSTDadqtTs6FBvwTbxz9w7lGF0hPfqLUqlwOGBF
	QzIk2ydIdeUtvcpKIZBpUAcyaGVeVzEKOl3MLf73BkUbMyyVKbL1ijdJa2Nlrg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:39 +0200
Subject: [PATCH v3 14/16] ref-manual: add mission pep517-backend sanity
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-14-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mIuWN01OgnRWPuYjTWxmojWLzutEppAXp4H2sOsQVEQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8RO0S/iADlWDHENLGkQ9L3Cc1ig2yIf3Rg+A
 Gdjt3v1532JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 Nnb0D/wNqnbMqYXwmPC6QnpQlIUfRG/+HmHkNcqlk/8hSMdGOKGGabN8uqGZZtkwekaMuUkps94
 Qyuz6ck8mi+MX2ZSncsfh9naKdmZFyyObITgsOVBysUkpXn/ulGo437i9eXWqWsw+5gTz43n6qC
 ryvHa/2JtbwQzqvaMh65W41JhRdHN5NbcL5t0FtCLFszwfKHJifx6zlobpzOwgl+xueshVtuuyX
 oZODvDqXbYDoA5j/qyyQB0O+z767oUPTC8WymCnCM/rm7p/KJFOuuZVLifPEQxMRhn+vWLaiYOL
 NGzdB1QMfz6+pX85AM7fUhHdL/chDbYC1Xf7an0apf1I53X89dYe90skmRQfcXDHEGzi0DC4Yfq
 hJMfhCefMbBOQv6JAnAmUKdn6570n4ht8qfou1gOxd7ZQzBByC4j+8sZZSTQBBEKBQ1NPqzI2x4
 EzY9j0E249uKwu4+OGTlcRNbJC0wHfHaT4YlmhgG1aB0Pcaw3ex2nOs4NMR/9EcgzlChnCanBS7
 fN4fJ1Z23bVPcbGQrlhSoXbID6ajmIZdKda1BCk8ldjELOqyjA9+OM2KUBRtN2J0cCAYRKpYxwD
 rtHy7rQ2hx6xgQyZQZc68+laXqNk1zYE8CSbQ+v0YDJU5Foj3Cu83K1crSo9I8HLZmeFZC47TXj
 7AeEtWvUoLRmkfQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5467

New sanity check to check for PEP517-backend compliance.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index cdfd1f7e3..a715be97d 100644
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


