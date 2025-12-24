Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C898E776D8
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123207.1766593933124592395
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=x96SUS+T;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A63481A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D1706073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43F8D102F0CD4;
	Wed, 24 Dec 2025 17:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6f3v4mLInx1X/WGe58Xb8U80/YIH3XFvpTI7vXB+pt8=;
	b=x96SUS+Tg31WIZuwnemnOxET71rvaeUm9LdIYkaw3O9b6Ztpe5X9XpXIbWdIbADzwhp1Yr
	+Aw5HPfs1sfR1o70T2iUlE4WFY/92943WDxS10hJ8bW0+0XhyYWjCddowKIkBnH07q3TVQ
	86TwxalP5/lQwrt7ShCzYUP+SzxlDW+V9a0JZyFeGmXj4jMHbhNXqUjghWgnxIfQkZL8Lx
	75v9RtcpxbbSZ7qoB3IYySNjq6QifdlN+RFKWAvBWMyZrHKEJvP8K0iH3fmvm2mGxEy4H0
	4BkVxO3SSbjopk3EiI1NQZaxEcQUBhDf/nocvNaGSyeg0LUmFO/WRV9fKq89Pw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:00 +0100
Subject: [PATCH 34/53] contributor-guide/identify-component.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251224-remove-poky-references-v1-34-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=oIB9K+6BA2oq3PaXV0DFPAWhJUfLobhT7/H7NPlBgaQ=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGlMFWyg6gyfZBB0AR3dpGqaXrvUDu+KbfTr6bND2X7kMjzQn
 4kCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJpTBVsAAoJENGAQUApo6g2rVIP/2jn
 KpthBcrV37WU0BQm6Jb9DHcxc5eTWO5zkVZNVZMKVh896S4spiXnwz1F84khbQbwD+QsBjEQG4G
 KMaN28YM0SfC5JVvCxoBLLUQtDALL+KfWFow9svTR9JRmp5CUbmL6/YIW/UH1iQ/GbnDScWuCnn
 cn4B+1EQV+YvBiuuvR6WyPftf+O3NWwb6mkgcmlpP8vnU+Yl2bLqRE3jMkXaCL3oEyDVmb5ap5A
 VCSOUKVoDLBmb7S0Metn+1P3i8yBS5LUYTet+vfVieLu4wnt1RCRNDuLGMITqAvzhMMnudCbS/J
 icXRe9IG6EvlB4jJuoRZmgMNNUXslQW0kDioet53hHHO9Cs//1xkzcSgb491DSa4rrjOOCrzfNH
 cxH01YUb/1fGpHCroYY3oNJ+z7AbiIubUWp+EFer4B4nGY+6XAh1tcE6Z46Zi6SQwbtGOcWCMPo
 0eTvR9bB+bcHx+SKXI7JKUPWPfc8w74GsdVimEP2x8d9aWqrwjhqqrM9eYd0v3Z0usu7Gw15tEH
 uaKZuAIFuCNiDmD1AFKVY+5NkzSkn7DxSoRNUSzb4S7jDIEviB0mtMVnSVu8NnjcWcgbY9TxXq0
 J7hlUn+ArtYZHhyvBXAnZICX0kWid5W8fMfAuLWJrtBtja19Bpd2DCx+NtsVIcXw+faWmpSejry
 Fdk8j
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8363

Refresh the document now that the Poky repository is obsolete.

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
2.51.0


