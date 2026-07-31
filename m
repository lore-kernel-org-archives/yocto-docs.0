Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF10C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3045.1785490631917055468
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=e+SgIgMR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 400B04E4104D;
	Fri, 31 Jul 2026 09:37:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 151FF6039A;
	Fri, 31 Jul 2026 09:37:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AC6511C16615;
	Fri, 31 Jul 2026 11:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C1YhvL+vh1eCsbhFSM+wUycMT4yqg+VgE9lojWxR7xo=;
	b=e+SgIgMR7I/pm/mBy0hcvStZhqhLWOgd0H7UWe7GqNbwtr0yjugZpiSyqdcJUPp6uUfr3U
	U9Pv8YOxVGotBmcWNu+Qny07eVTodIBSmkU0wZLQOg5YyueccCy87bkj7GUogI2fQg7Cnc
	9rrkdQ04A9po5NkGjLQyiW7CNKl3ydtNr/LMX0lJCOxEGVZ2CD45nXGdOUZ1RfHBND2vn0
	zRgqzfMJiaFm96aaDOqJ5hGQE7aRZllXK5zhs3/NVKqPNR7DQN9Wbb6q3Rcolw+lIahxBQ
	4xiup8sIMk8gDx26484B3B+Jl6f8VB9ZxdkqFwNurL7hlfkPLDAPoKtEL7mQYw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	niko.mauno@iki.fi
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: Re: [PATCH 1/4] ref-manual: Fix occurrences of omitted space with :prepend
Date: Fri, 31 Jul 2026 11:36:24 +0200
Message-ID: <178548999944.2379643.11275028829268250944.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727163529.30595-1-niko.mauno@iki.fi>
References: <20260727163529.30595-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10222

Applied, thanks!

[1/3] ref-manual: Fix occurrences of omitted space with :prepend
      commit: b2f611f498eb22ca42dc436e3cde0c60ad2ba72f
[2/3] ref-manual: Prune superfluous space with :append
      commit: 92edb2468a473188273534f15682ef55d361f8d2
[3/3] dev-manual: Fix missing whitespace around '=3D' operator
      commit: 3119c759b290b886e4d606a53db4a8dc7a2c3bbb

