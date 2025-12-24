Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5248FE776DC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123721.1766593919315974244
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0+g1OQ/4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCD821A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92AD06073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E573A10AB1374;
	Wed, 24 Dec 2025 17:31:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cActp0qE5HPAVpUObn5O1e0jNRNpUZO6CuJ76Ks9FbI=;
	b=0+g1OQ/4Wga1HlUigrcr5+do2QPdJxBa6JfnAK36Sn3GbZFNS7kvb3e9+Yt5iCOoVcut5e
	sS3+nEqUdwn9HblV4fFWWRfk5HKwWarUxBvLjKB4H3BGDzVPQ9zhHG98xazwSVYe49FmCx
	h7bQLoPUR/f9fmcVqfNx/iiN6uObr5YD7BDm+t9X/dDZXOs7TY2W2ZfBEOBDxMPWQqqM7l
	5XeAs5j9I87yv1bkhGjovz692BETsvfXh6YaqH10YenOhneP53SlVREa6wcH4Ta9k4MRzW
	/BzTtgDD0EGeW+PwUKgeZp3U6eLPQWCbpGROGBiUKkt3D2yvZj46NtMhigPmXA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:41 +0100
Subject: [PATCH 15/53] dev-manual/securing-images.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-15-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=krmMZC0FI55+Y1aYcMdMHagYGDWQ96yeNFo4ks4blTc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVpjgvRDuy2fl/Bs6ErcNivlVrai4VXBXGhf
 /Op8BvDfb2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaQAKCRDRgEFAKaOo
 NoeREAC4cZG1CkdlSgDugEtTNm/jCVW6fu17qTf62VIGETDaRzutisMIul7hAfQnihxKRfUPxVT
 osSjVzL04kJeLQ0x+4xx/iUmV8+NUHZyT6fNqRbL5YqfE1bp9Z1txKZzzvagluV6v4hUL4NHmQf
 DFW64nrehgxsyhLp8vrWviAdh0N2Qa3ligUOjJ0BD5RnX/pG4oXMlJp+A3b3McsuwmZsKFN9civ
 uZ01duDHaOqWSg2ANs5NAWAiJz86EACI4NH0h5+uRprLTPwVP3Gvr1aEsmVPAF4HX8h5E/2Zl1q
 fYtB1RUUsIQVb7VGnIdyDJRAA5921r4ciGYivDSuCHLLTYy7GE3KPN1fIDRxv6jQycGhSc6gaFM
 mQT7eTm5KwEup3RS3lqSZQCfOE2QrReOeILtOTga0JD+GQqdEI3srG+Sly5Y/ppAoUlymxns7Jy
 wbt8nMEvpaLUN564Uzx3eWYgFZK5cmu1CTVma8a3v+pWDblIRYUDGh4cOC4nI3oMNjrXJw7Vob6
 zffPe7zZaZ90luxMNLuZAemdTt5lJfO+doocqElYNSvRLvuLflIIwVOqA4sAh1kKK9K75u/UNOG
 MWx8FIrtWjln06RcMSSfG0UuE+QGSatRNSk5MoNP6LaFR5+pDrJo3iO8xWgSSupTTyEV3i0wLF0
 YNORCeHLj5kqNnw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8344

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/securing-images.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/securing-images.rst b/documentation/dev-manual/securing-images.rst
index f4b528e55..31c945367 100644
--- a/documentation/dev-manual/securing-images.rst
+++ b/documentation/dev-manual/securing-images.rst
@@ -66,7 +66,7 @@ more secure:
 -  Regularly scan and apply fixes for CVE security issues affecting
    all software components in the product, see ":ref:`dev-manual/vulnerabilities:checking for vulnerabilities`".
 
--  Regularly update your version of Poky and OE-Core from their upstream
+-  Regularly update your version of :term:`Poky` and :term:`OpenEmbedded-Core (OE-Core)` from their upstream
    developers, e.g. to apply updates and security fixes from stable
    and :term:`LTS` branches.
 
@@ -88,7 +88,7 @@ Security Flags
 The Yocto Project has security flags that you can enable that help make
 your build output more secure. The security flags are in the
 ``meta/conf/distro/include/security_flags.inc`` file in your
-:term:`Source Directory` (e.g. ``poky``).
+:term:`OpenEmbedded-Core (OE-Core)`.
 
 .. note::
 

-- 
2.51.0


