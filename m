Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A708CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:08:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.28637.1759738089761238567
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 01:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=XKud72bJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 32746C085C2;
	Mon,  6 Oct 2025 08:07:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62D46606B7;
	Mon,  6 Oct 2025 08:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9A4A102F1D49;
	Mon,  6 Oct 2025 10:08:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759738084; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+plBm8CWu79SLy55PBCopD++i+JDVU5kkG6Q1XlMGBs=;
	b=XKud72bJ2g50EMjAnUtytBsVNdiPeLb01GJqrDjhLHEpx23mQuB7megIzE+AewEC6vTcaK
	tZ7Cr6ob5+aLSqqc4WpijGWxHtMf5v2U8Lwplu6cArZs/qtYcp5g7K2YOEn3rhkaldxjKi
	ux1/7mSVUQQvZs9tLlM5GIbGRIq/sREaxARS3PpD/Be1v3TOdk9dmLUfdjBEDruFT1fGm2
	woAECLxkoFEyRDZ20YLujEJC1YvxOBwk/PD0Aocixh8+GmF9lRDIh6ik4Yqcs/IAMdy6WR
	jBjrHC/QnlOs8YaryQehv8HEEDvFgAeylIZ+15Vi6kTen7IjhWBdNmV7YSryGg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [PATCH 0/4] Update list of supported/tested distributions
Date: Mon,  6 Oct 2025 10:07:20 +0200
Message-ID: <175973778851.1174293.2601101600038809969.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
References: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 08:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7650


On Fri, 03 Oct 2025 09:33:23 +0200, Antonin Godard wrote:
> Update system-requirements.rst and our container build scripts to the
> newly supported distros in poky.conf.
>=20
> @Adrian: I'm merging your patch now as Fedora made it to Poky's list of
> supported distros. Thanks!
>=20
>=20
> [...]

Applied, thanks!

[1/4] ref-manual/system-requirements.rst: update supported distributions
      commit: 4e7ce89ff91f5fa7ade1feb7be96f898b56068ed
[2/4] docs: add util-linux-script package for Fedora 42+
      commit: 22e28e817d2c9b49d9fedbb93b08874cec1fa3d3
[3/4] set_versions.py: fix subprocess.run call for older distros
      commit: 6e1f4c18a13f369423599529a6960da5e3947d01
[4/4] tools/build-docs-container: update with newly supported distros
      commit: 09c7800333b17b21e50d2a089a3ae1b123697243

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

