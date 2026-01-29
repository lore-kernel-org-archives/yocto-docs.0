Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5C8D6B062
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17108.1769700268965500507
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=qjpYaPO9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7008B4E42324;
	Thu, 29 Jan 2026 15:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4786F606FD;
	Thu, 29 Jan 2026 15:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F200119A8871;
	Thu, 29 Jan 2026 16:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700266; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uMcuMT4dibcWtAqrz09O2BtxBgPEYlHDEBdt/vUkqWI=;
	b=qjpYaPO93jUep2iT6Cswdu6bJQ4WI2HiSiQVFO1p3khIEJhIuZ6XlwtHalC2c4U9OphXUK
	g4fVmDaKQX9jwtGVPVAk6Y0Z8s//jMa9bHn2XZhuwaa/jWUAllknFmrrrv2r153khNCIQh
	hBkVMq26luLX6ckFLKZN4AtbIhxET2d6mDTEh8funoq4pq3cTY/pDi8llV8L4UlSyDCgcz
	EWVozic0U1BEmlcpWD9IQTOpHXOkOJmjKxcE/iwnZaYK/RIcyPCm/rHsmc3eta/cUPJv8r
	iwm92TsdIREo4cew+OZ9IQTxogcrIeKxRReRkGFXiaBcd4VJtGi2v6IeLM60/g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:25 +0100
Subject: [PATCH v3 34/57] contributor-guide/identify-component.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260129-remove-poky-references-v3-34-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Mn+EAY4BOzv7Kb488qKxFYyP/2eJ8qGz4fgueKEcaRc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uOTkQccVrd5E4fVf44S30oBPmQCJL+1qGf8
 lvL7uzalvOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jgAKCRDRgEFAKaOo
 Nmn4EACQobh7G7Au3Dp2IO7ofBk1sMaQSd2bC67iRfd0IrWSeIM8Ye2X9BdlRyaf4Bdyf4dJA5t
 6ealQ2gV2t5awC3BpG7NFoBUlvZtEDhFqyH6OPx8V41pRHUA3+jqcVAWiE9NRpOUdJl4tPBquUx
 EO/k0zoN9b7U4TFJcSd4Wn5ImANPJqBk2atAPk1RjajitSoOhi/DOJLXjPlpiMFWHUsfP5qum0y
 jJ6V0kkhz2Ys0UCIxDbohOpmxhtznpJR04TpLthGBKUGYbIdRyBzWBsjAlBRfdAZtZRHPCH8D/V
 ARsfpjjzUB2SlqNq3P9UUz8fGIRx6AFuX/1RBghcame2a13EeDau15aV4rkfto/iVQB76UXqvHJ
 IePYw+fas5/5ltyq3IbaFzrswqVY01GlSRmy+JQ1WtXai3tnswY00Qv9cCxQUMAqz+gKK6QYmRy
 sBfpOtTr5zFWqUgzlJfBcDG36JuniUaog+kZ6KcqiB/BsvnAJmB+Lwj8lL0/zXozlcHh6gWruw9
 L8h1J6R7u34bbVMSqF9jubfCvtJm4DhFhAo0dh05VEUo93Cy5UnakGT4qQm/2C/zFdsTCokLcKI
 srZO8thKTOR7krprPK1V6XHcz+GJJG/alS1ggk/cQbyok4NT19T4BSK7jm1QT8G/Zn51kzm/Zvs
 qXnMQJLTkytkFzA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8820

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


