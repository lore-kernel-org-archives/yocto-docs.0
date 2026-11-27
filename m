Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12397.1795767037636070747
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 00:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RQgeneUg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 33D6C4E417BF
	for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 08:10:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A8E06049C;
	Fri, 27 Nov 2026 08:10:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2580111E69291;
	Fri, 27 Nov 2026 09:10:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795767034; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iaFA+1dRpRLCzxf+9py9FTUgVegyYb+PjmEMHj7NNw8=;
	b=RQgeneUg6Qg30x6HKcMsa1re3noeakVLJqlgMe3JOC9/fX/vHVcEVIekEsECNnmbSlaxgr
	vH8aw+EPaSBJEqbmGBFVQcAMlArCHXGiBDMCHRYnRZBMaZnqvWcV1v9t5P7qgznEdjds5T
	gZhO3RsrkRNL/M/JGjvvgpmdkWTO9VLsXAgZ6Vy5kBNzuywm+8/wD0R3nkjhcNb2h5zOvE
	M2VAEtkHbRsam/cOSEBUy4k1LbYhU1GCA/8JZPp6HblYAiDbvcEgXHflrKZ50j3DNVOntD
	uSWDDO/gwFC43WyZ5k9y/Gl0BIDxdKO/vlLRAwf9kj1B0H3WhBueHGXuxuHK+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:10:31 +0100
Message-Id: <DN5UA9PRFTFL.D3Y0NKYY84H8@bootlin.com>
Subject: Re: [docs] [PATCH v2 0/2] sphinx: add lexers for wic kickstart
 files and pydevshell sessions
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
References: <20261126223650.3701672-1-twoerner@gmail.com>
In-Reply-To: <20261126223650.3701672-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 08:10:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10850

Hi,

On Thu Nov 26, 2026 at 11:36 PM CET, Trevor Woerner via docs wrote:
> Lexers for wic kickstart (.wks) files and for sessions in BitBake's
> Python development shell, which the manuals show and Pygments does not
> cover. No block names either yet, so the rendered manuals do not change.

Thanks! These look good and I've tested them, just one minor comment on pat=
ch 2.

In a v3, would you be able to replace the occurrences of wks and pydevshell=
 code
blocks to use your lexers?

Thanks,
Antonin
