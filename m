Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837E7C79F9B
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 13:53:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64170.1767621184458221054
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 05:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=t3OHa+aX;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 91A0BC1E487
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 13:52:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9138060726
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 13:53:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D37E2103C854F;
	Mon,  5 Jan 2026 14:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767621182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mbIp2asz6ROJz9LFH7YbXhWJggwvi9rIqT47cyXInB8=;
	b=t3OHa+aX+ICRP6F6dcEWizeDzzcRfnnev6ndwnr/tDdMscFih0TgzJ9zEjgYiS8kstELl+
	KTWcniBGuZuJWpGe1ZqKvPuKTrd1DhVJuqOG3HCo0pvjMFMfryFz1Hr24J2+rdec7ZOdu6
	1lOpydHQAHdZJcsXsXOEHx1bfkkcc2lJVjRtkLcM0mdyQRXZGXD0hIupc3R5D1NgHqLK5g
	AumU1B/xoaUTIAK44Ixxm5Ni4AGquoaZApWlZ0Y98gu7+s36/rG6VgeFsVQ/meQyleG8fU
	k9wGOhE/eVge4svWneY6rgMeS3JEOM0xxPvcKXZXLqevr2iBD50W9jsGRKRvqA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/5] Add missing CentOS Stream / RockyLinux distros to the system-requirements.rst doc
Date: Mon,  5 Jan 2026 14:52:29 +0100
Message-ID: <176762113046.481362.4229791182469449133.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Jan 2026 13:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8385


On Thu, 11 Dec 2025 10:06:13 +0100, Antonin Godard wrote:
> These two distros were missing so add a section for them along with
> their list of requirements, which all and all are very similar to
> AlmaLinux and Fedora.
>=20
> For these distros and AlmaLinux, we now provide a way to build the
> documentation PDF using a local installation of TeX Live packages (usin=
g
> the TeX Live package manager, tlmgr). This is not as nice as the other
> distributions where we have a working list of packages for that, but
> it's still better than the current nothing, and finding all the require=
d
> TeX packages proves to be quite hard. Using tlmgr is also what is
> currently done for all the distros on the Autobuilder.
>=20
> [...]

Applied, thanks!

[1/5] tools/build-docs-container: move container files in their own direc=
tory
      commit: 4ee207aa6678812e93a625be84dff87df56610b2
[2/5] Makefile: fix rsvg-convert --format capitalization
      commit: ec588f83a38439bf4af7d6019169ec4445a72b9a
[3/5] tools/build-docs-container: add CentOS Stream 9 support
      commit: 2989f2fcd9e81f9385fcd2431ec7f3d9e7e507ff
[4/5] ref-manual/system-requirements.rst: fix AlmaLinux PDF build
      commit: 6751174d760a10dfe65d10dd3cc1c57395a10b0a
[5/5] ref-manual/system-requirements.rst: add RockyLinux install instruct=
ions
      commit: 5919767adc4b2dbd97fd1506b5f7c7e13ad083dc

Best regards,
--=20


