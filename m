Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B414FCA6C92
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5816.1769501987565829591
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=aJsZKwys;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E4674E422CA
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DAD76606F5;
	Tue, 27 Jan 2026 08:19:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62838119A867A;
	Tue, 27 Jan 2026 09:19:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501985; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uMcuMT4dibcWtAqrz09O2BtxBgPEYlHDEBdt/vUkqWI=;
	b=aJsZKwysKk+3mg2Abfuu/NbxguqeMv+kiXG1YaggVed5b1H0ekI52ysEJpJVL/aOGd6g7G
	iMvsGJ17h0ThjZ9Hl54+nykIi0n0p6fjZ6z3hYebYWeY9nIbKIbNWQy7Yu0Sne9TUgS2tU
	9HhULR/9C1JYyGWYCaHRVhMvh6w5eXKHwhcYgaiCeNQwnRlsn4ieJoudqEyuHnX7kt5t2r
	QZhllw5e/lNpVGqwGvYDidpQR+HdaAsIg2AuK0o1Q+IhOqzOttRgKUCi2LmTDuvlaJ4pRC
	MfY3JqJALf7YhOu05fwKUx/WTE+FDvyT5oET+2wrH/CAOEYroY2a01RtYZC/+Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:29 +0100
Subject: [PATCH v2 34/56] contributor-guide/identify-component.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260127-remove-poky-references-v2-34-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Mn+EAY4BOzv7Kb488qKxFYyP/2eJ8qGz4fgueKEcaRc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUDV1lwu3zPO7kmBM+YH1ycHUni+9O/r43Tr
 +X81yOTjGiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AwAKCRDRgEFAKaOo
 NhBDEAC/6nJDStXxMmjTLZnoOGi0hrcFuxQ+g5wY6foEwZwB10MPxgFeGFk1kLwddjCuaOLVEG6
 BzvIRoU8IYa0e2KuO2roUBfzwSBwclddbVMZzS69Lq8x6YNaFq2/ApGPjOmUCgCRkr8GT++3L5l
 l1pQX7T7bIKou1dmm3SuQ9nlNWXTrKZ8npvZWrPBis34Obmn+D/vNFuuu6JvNhd+13b1pHJnxZh
 Ts9+qhr79eMBk8Q1YysY3PnrbAD2cKtXv+ueorAr6Be4uVfTzsiPNeBklHsDVupV5966pKP/YHZ
 L+kT0tQida5YeUKWpicdoDCusWxbY+a8aeBIyyu+XB/NiV3P5YUWXwcpcGxDoaGE7jX3B3yWbeZ
 yJbLi26fWJxaRxMtZoQpAxkTO7igzor34nlOfy4NBuYWua8bp3naZAE5a5ggEIm+77e4Equ8ePA
 XPxGI5JUMPr5uGHHspJnD424CneW6Py6K6wG4OSIOnlHtsAU5//gzT9ttvlrdL6IV5F2sJ9ELID
 7S6QCKg+EUhlB1cREa4MhCMBr49fxY6i8EPi4InC4CYzXM3RZd4tm02+TR9RlOb+6iZc41wO4VJ
 ogSzizlXv82Ef9pMbYbK5nRvtGsAkKm4AY0ejz+ZyyrjxU64rpfwewkVK6V48iyZCTEjMLGtmyV
 5mW6k/G9siaZxVQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8695

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/identify-component.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/documentation/contributor-guide/identify-component.rst b/doc=
umentation/contributor-guide/identify-component.rst
index a28391a66a..6cf8ed9858 100644
--- a/documentation/contributor-guide/identify-component.rst
+++ b/documentation/contributor-guide/identify-component.rst
@@ -20,12 +20,3 @@ If the issue is in the core metadata layer (OpenEmbedd=
ed-Core) or in BitBake,
 issues can be reported in the :yocto_bugs:`Yocto Project Bugzilla <>`. T=
he
 :yocto_lists:`yocto </g/yocto>` mailing list is a general =E2=80=9Ccatch=
-all=E2=80=9D location
 where questions can be sent if you can=E2=80=99t work out where somethin=
g should go.
-
-:term:`Poky` is a commonly used =E2=80=9Ccombination=E2=80=9D repository=
 where multiple
-components have been combined (:oe_git:`bitbake </bitbake>`,
-:oe_git:`openembedded-core </openembedded-core>`,
-:yocto_git:`meta-yocto </meta-yocto>` and
-:yocto_git:`yocto-docs </yocto-docs>`). Patches should be submitted agai=
nst the
-appropriate individual component rather than :term:`Poky` itself as deta=
iled in
-the appropriate ``README`` file.
-

--=20
2.52.0


