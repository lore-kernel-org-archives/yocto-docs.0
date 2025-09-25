Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90C0CAC5B0
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 11:17:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.9127.1758799074901678750
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 04:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RYtcD3or;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 841FFC011EF
	for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 11:17:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CC956062C;
	Thu, 25 Sep 2025 11:17:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57D1D102F1724;
	Thu, 25 Sep 2025 13:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758799071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m6UaK0jhESyZVdyizXnK1A4RhbYp0eiIX5XGmUH8okM=;
	b=RYtcD3orawf/MiC5+BjTVI3CYygu19sg2/QLoxUsnBewObUzfKJTyrOlZ3lxZ88n9YxVNV
	ilgt2nado5Nlw3QxMkkSQvK1Ia2vgy2EEvwQDjCDtsus5Br4jzANfGKwmNbf3Dz8JLcC13
	epIQTSq1WBiUZXc+58Uak3K6CFzNQGpue3ch7xIyvr0sQI/ug6iXCMwRLj1iaLdav2S/Cc
	8k/TXenb13ww3XowwI4ln+x4YK6hNJL0G2RKH51/Q4279d1srmo1WOw8COQvRc7T9iBkXs
	qPbAfumWhow5N8RS0Pi/F+M0UxFrk4npWxR65iFe0oWQlx2ZD/pnUWs8OZVwiA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Sep 2025 13:17:50 +0200
Message-Id: <DD1U8IRR490Y.1PY3VCU4AQ7CL@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] kernel-dev/common.rst: fix the in-tree
 defconfig description
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Adam Blank" <adam.blank.g@gmail.com>
References: <20250923121422.24593-1-adam.blank.g@gmail.com>
 <20250923121422.24593-2-adam.blank.g@gmail.com>
 <DD1R4OC249CA.3QCJ0Q1LI5ELE@bootlin.com>
 <CAFAffzy0ofmi6utk1jBsVaT-6FYNtkS6CZ7zpxLE88-wE3K9iA@mail.gmail.com>
In-Reply-To: <CAFAffzy0ofmi6utk1jBsVaT-6FYNtkS6CZ7zpxLE88-wE3K9iA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 11:17:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7598

On Thu Sep 25, 2025 at 11:09 AM CEST, Adam Blank wrote:
> Yes, that was also my first approach, but eventually I decided towards a
> minimal change.
> Shall I send a V2 of the patchset?

Yes, please. Feel free to rephrase to something better as suggested by Robe=
rt in
this thread.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


