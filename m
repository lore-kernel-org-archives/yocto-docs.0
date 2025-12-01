Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B1BD116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:36:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16807.1764578191878791151
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 00:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=DGcESJEH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3957B1A1E8F;
	Mon,  1 Dec 2025 08:36:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03329606BB;
	Mon,  1 Dec 2025 08:36:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 930E7119121CA;
	Mon,  1 Dec 2025 09:36:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764578189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H31/fnhSF4Tb6jbJ6nJIs1zGeU9N/BO13bvjnueyRrk=;
	b=DGcESJEHMooBIsyLw4z753sHExnoOWiLoQ2PzbqnR0YL/jjP859/2RBzlNiKKl+hJOANAb
	s65AmiZHvTJBWOj/bFQOweIp5NxUX8zI953HDc0zS/fyjUBXsMpx2eIIIPtuxcyeuH0Xoy
	9ada3zFFME+DxAZnu2u5L+4KMQFxQcEloV6Hs1kHNrIwiqrD0REB0gpO1rkyNLAUgzpFjk
	+OLuPKG8oWj809qqQPmxOpx/Ssd0aq6neQzspowJuqRC1Wrvmqm6kYTWpBnAlmu+xD90Cn
	yzsFJV4Tj5hE5xpIU4k/sw1YbLDYCJZlhzuNWnB6reJSlvC6Od/rtnzN1sfgMw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	stondo@gmail.com
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: Re: [PATCH v8] ref-manual: Document SPDX 3.0.1 variables
Date: Mon,  1 Dec 2025 09:35:54 +0100
Message-ID: <176457799703.63554.15711052986855376345.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126140043.65629-1-stondo@gmail.com>
References: <20251126140043.65629-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 08:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8179


On Wed, 26 Nov 2025 15:00:43 +0100, stondo@gmail.com wrote:
> Add comprehensive documentation for SPDX-related variables in the
> Yocto reference manual. This includes documenting previously
> undocumented variables and updating existing documentation with
> SPDX 3.0.1 specific information.
>=20
> New variables documented:
> - SPDX_LICENSES: Path to SPDX license identifier mapping file
> - SPDX_MULTILIB_SSTATE_ARCHS: Architecture list for dependency collecti=
on
> - SPDX_UUID_NAMESPACE: Namespace for UUID generation in SPDX documents
>=20
> [...]

Applied, thanks!

[1/1] ref-manual: Document SPDX 3.0.1 variables
      commit: d1b756d820894e6528770e5023adec92e9bc5ae9

Best regards,
--=20
Antonin Godard

