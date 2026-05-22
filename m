Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF31ECD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 14:42:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18484.1779460958414886641
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 07:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aVC47t3A;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 58A674E42D29
	for <docs@lists.yoctoproject.org>; Fri, 22 May 2026 14:42:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2422660732;
	Fri, 22 May 2026 14:42:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90B7B1081154B;
	Fri, 22 May 2026 16:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779460955; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yF7aMM9lUbKCW2lMXizlP5VQdBKG4RucXtyqIGKR9Gg=;
	b=aVC47t3Am31/AEmzUST5CmxYU0JaiBHCJzHENVxZUxcdVSzrofAYCwfkyjC1yPRLieXcQx
	cHWAmsVuljhiXnjj6gRtVtOcBNTHVdpBlYPBWO6aV8Pkpm/rMqGxgpNCPleaeZspRHYFix
	sv/A8oKvvAx8Gh1XSzATIxVll41Zs6+L5LEoQqPmo6amodMDN2PYxp8mJkjnSXSBwZ+gQ6
	VWz8/AqsTRMfpnsokH3Q/oahWOAXDnG+Q+ySd1Gneu/g1B0eVfkkdMnKxVrcRZvWla8Jjf
	OZMqwPIX6Db1hFc1bE7kRJz7OhaTui6fP//H3NSr0w1IvBQzZZORG4KVyaqTPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 16:42:34 +0200
Message-Id: <DIPA9GYROE7D.19Q8B1ITSU2U4@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] "PACKAGE_EXCLUDE" still claims it is not supported by
 DEB packaging
References: <e764d11e-104c-42f6-6ce4-3cba46b59bcb@crashcourse.ca>
In-Reply-To: <e764d11e-104c-42f6-6ce4-3cba46b59bcb@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 14:42:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9523

Hi,

On Tue May 19, 2026 at 6:09 PM CEST, Robert P. J. Day wrote:
>
> here:
>
> https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCL=
UDE
>
> one reads:
>
> "This variable is supported only when using the IPK and RPM packaging
> backends. DEB is not supported."
>
> i just tried it with DEB packaging and it seems to work fine, and i
> don't see anywhere in the OE-Core Git log where this support was
> added.
>
>   can someone clarify this?

Actually, you did already, with 0d05dedd62a6d4c726f120a23654ede1f0b23d8e. T=
his
claim was removed from BAD_RECOMMENDATIONS but not here. Could you send a p=
atch?
And see if there are other places where this is stated?

Thanks,
Antonin

