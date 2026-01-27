Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA7BCA6C81
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6051.1769501972986675487
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aly9FcHy;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 798FD4E422CC
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 514DA606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B42E1119A8688;
	Tue, 27 Jan 2026 09:19:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IcXdbt79/410N5QzzJOp8idRKv1H6tNkByljbRMlI4s=;
	b=aly9FcHy1G78tmf0fwmhK5PmJsASQP96ENYq91gpyHpPop8qfj1ObFaaojKRxwV0y8h+G0
	RY8u862d6T+oPoF1X2jgtEVR32wRGFJUcU2vgDVFgiCCprLrq06Oxw1/ibSigFJBsnBQSN
	W5zFr0mrg0p68EuD92LDiptoKLh0hs+oLl43d7oL7gBg3jsas1WIHNYQqAl7PsVlm+VklK
	e37lljwIOJtc4H19pmXLJtWJrkIBbcHf7SA4hfXy6CnO2iOJAH6oWzl355TzaRHe7lxxFJ
	LQIjpEAaptA5UU6NaaOOsr/LW7HnGHrKck7cqNutUKc3zLtbd2I7+rBuA6pUmA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:10 +0100
Subject: [PATCH v2 15/56] dev-manual/securing-images.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-15-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Ma8OOZ9vYsClPrK4RjEKzyyVLXCuLWYC9wojjB+mWyE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUAQmEyqhbeHexxjVtz5dBeC207B6xbue1+q
 G19aEEYja+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AAAKCRDRgEFAKaOo
 NpR0EACl9Ab06G1zqz0AYli4+oGSHfAjb6sYaBxuKv5o/qC/MyvBEMHsHgV8qPzuNF9B7t8mbrp
 5BeerSkDYY/RWlkRkbtZ3rtycUrMJr2pk8LCLeDHQBW86dlwMUrKyyyzb8eEJnZn4Hk1CLxXJT/
 PtUsFDxGDjGsn2XrllqpKL+ll9X7WEsILwdBwyDOJ0U7YJh7oaEdLQ/LRmdqcK3ondPErUjq7xC
 SPRYJwqTzC3QYXXoJoMIa+rRmsglb0FAWZoKyQyfD4yK2Zd6eBeZwc/1mjIGAJhp6GhTKBnhxtH
 JbhET3UfzVZRrwAjaxRpk+aZPJTlowr6ds8DJQgOPEZwgW92oTj07yeGdhLdsz+nAzouxWGfA2L
 UWj/Xbjd0MfE5jXU1ALMovTd0xy4bzSsKDvEbEgf4NkWDGjCz9/0MeXryNL/1zQhYWiHSk+i2af
 LQ+dGiiZGAV8Ij/v+AW6ICEGBRFfL4ymMdx7OFEcowp10rdpVG2Fqj+JxmZWJOhCRKPn3f0GFJp
 wqk+eLTBc9J9MDMuP8v3NUO2lcTb0eYy1dtxiEkzw4tBofoRCan4iZfCAygq+aV29r+ot4p2wtG
 mu2wKSdRR2Jd7sk306TmI0u6BtqMe9DoUJPA8LAGUW/r2GxwJ9Dbt2w9u+B7yuV/xKCpCYo6JaB
 MJk+IHfSk9s9r+Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8676

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/security-manual/securing-images.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
index cc6f95003..e502f83e3 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -50,9 +50,10 @@ more secure:
 -  Regularly scan and apply fixes for CVE security issues affecting
    all software components in the product, see ":ref:`security-manual/vulnerabilities:checking for vulnerabilities`".
 
--  Regularly update your version of Poky and OE-Core from their upstream
-   developers, e.g. to apply updates and security fixes from stable
-   and :term:`LTS` branches.
+-  Regularly update your version of :term:`BitBake` and your layers (e.g.
+   :term:`OpenEmbedded-Core (OE-Core)`, :yocto_git:`meta-yocto </meta-yocto/>`,
+   ...) from their upstream developers, e.g. to apply updates and security fixes
+   from stable and :term:`LTS` branches.
 
 -  Ensure you remove or disable debugging functionality before producing
    the final image. For information on how to do this, see the
@@ -72,7 +73,7 @@ Security Flags
 The Yocto Project has security flags that you can enable that help make
 your build output more secure. The security flags are in the
 ``meta/conf/distro/include/security_flags.inc`` file in your
-:term:`Source Directory` (e.g. ``poky``).
+:term:`OpenEmbedded-Core (OE-Core)`.
 
 .. note::
 

-- 
2.52.0


