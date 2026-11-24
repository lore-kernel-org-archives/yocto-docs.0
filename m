Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13874.1795510309381026356
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Nov 2026 00:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BYWsGpVo;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D3D72C4CBEC;
	Tue, 24 Nov 2026 08:51:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7EA4B601E1;
	Tue, 24 Nov 2026 08:51:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 077D311E68BCA;
	Tue, 24 Nov 2026 09:51:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795510307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=keh72fFoAknRTmwv0oPWPBCRDjiAgmUHNANFLV0dFB0=;
	b=BYWsGpVoXAezsa/MPyKvHh5e8U6/zoEPNKAZrYCL078oNvq/c+lURis5I+9ZH9qezGHXxp
	YMRedH3LaVpyyL3IJ5OjP1EfehZvE9XACUxtTBuglYkOQwFlzJZu3NyprbmtGh5agPf2be
	oVAfdYBElIn51fyqxH6pUzYNHXUHm8SxQtIt/rqvOI33zMOdwY23gHcfTolXWacgaRmJ2b
	BURoWzKLYJ8ZTx3QNJqrapJeJd0ba8oP5IpH9OYNFXMjEYsHE1BZPzQvT1cTZFzSDoJGk0
	UKHAFhV3hy3jH4Z/t1hpTckspc5ypHMZN/hbMXCzYSxBSwCntfD7zbgsu8RGcA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 09:51:45 +0100
Message-Id: <DN3BA73BQ8GP.37OM9S3E0H6XX@bootlin.com>
Subject: Re: [docs] [PATCH yocto-docs v3] dev-manual: Document
 yocto-check-layer --run-tests
Cc: "Paul Barker" <paul@pbarker.dev>, "Quentin Schulz"
 <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <otavio.salvador@gmail.com>, <docs@lists.yoctoproject.org>
References: <20261119122700.1695957-1-otavio@ossystems.tech>
 <20261119124140.2024131-1-otavio@ossystems.tech>
In-Reply-To: <20261119124140.2024131-1-otavio@ossystems.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 08:51:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10830

On Thu Nov 19, 2026 at 1:41 PM CET, Otavio Salvador via docs wrote:
> yocto-check-layer can now run a subset of its tests with --run-tests,
> for example to split a long check of a BSP layer over several runs.
> Document the option, and that a PASS from such a run doesn't make a
> layer Yocto Project Compatible: that needs a single run with all the
> tests and, for a BSP layer, all its machines.
[...]

Applied to master, thanks!

Antonin
