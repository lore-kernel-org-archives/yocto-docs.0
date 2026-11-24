Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13859.1795510184839031759
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Nov 2026 00:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=mxBu172s;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 05A58C4CBEC
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 08:49:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2D8A601E1;
	Tue, 24 Nov 2026 08:49:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8807A11E68C80;
	Tue, 24 Nov 2026 09:49:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795510182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0VcMf56Jq7kjMXRbpmOmt6XgKIsokJg/pj3nqwp6PIQ=;
	b=mxBu172sdYcTieMD8/GqJCVa1EJw/ogZvLgusW6r197nw26+Ezx0nojON/n+AKESA48wVd
	SiNkcvQujBlCzRqALllRJlGO3Fnl8uaXaeL8oKJD+l22b51yRAsSSLkGrHSxKUbA8lRuLC
	ZEhpIyQy84Vel5HwRA0YiwmcHKXn4JdVOR5ayl9EtJqbDsK87Ns/q+oml2DOZaxGFMNOkv
	pWH/8qi1xxMlHHZJgOztR5+Y5nUmaOdky1TkpX5jzzEQCGcD7tWjCThyfkxH/IU6PMNO5g
	qCSYQuBV0A9yFw8qgGQl00cTzjUGJoWKiR/+k2d8uOlnv73vfB1+C8bPo/LJUg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Trevor Woerner <twoerner@gmail.com>
Subject: Re: [PATCH 0/3] Expand WKS (kickstart) documentation
Date: Tue, 24 Nov 2026 09:48:53 +0100
Message-ID: <179551011039.270132.1952357176219666265.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102-wks-in-v1-0-fbb797a3d5cb@bootlin.com>
References: <20261102-wks-in-v1-0-fbb797a3d5cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 08:49:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10828

Applied to master, thanks!

[1/3] ref-manual/kickstart.rst: add a section for commands and directives
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D853b26ce134d
[2/3] ref-manual/kickstart.rst: warn about the include directive only wor=
king for .wks
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D9697fd57134d
[3/3] ref-manual/kickstart.rst: document location and variable expansion
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Dbed88e534b81
