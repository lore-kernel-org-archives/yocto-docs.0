Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF7BC79FA1
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 07:37:12 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34200.1789112223465103547
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 00:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=j0ug9tvI;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CBEAFC653F9;
	Fri, 11 Sep 2026 07:37:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26C15601DE;
	Fri, 11 Sep 2026 07:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A88B11C78B21;
	Fri, 11 Sep 2026 09:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789112220; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g6bicYJp8nRvrd0GxRmdE+NAzr+YpYPsl9ZBmITFSSg=;
	b=j0ug9tvIBB+VvU2iXcBGeaw0HHLvSXVVxB/FENFaveZWEcUd1xEbn3trtPNnTxJZhUYEgf
	mpiAQ+4lk/Rr2JoB9NQ9RqiyZYdIUZ05Ay11uAjWDgt/eCIvdwPNiUmFn1CePP/XZaBexf
	7xTdLpvSb9Y9LfT9BEDPj0v32LJmhUi+remYhVMYyQTw5oDzG1jRwBkGYVN9io4lo55I3R
	atm46aH/EtD6OYgHWPP2E8BaltEnC+MYW9P+KMc4bfiSWNqqhiyLrtjebci/OkLZZNNuTi
	smLnZI7+6Dp0a+uUjJhJKvy7ve7twTkQVyWbSPAb+rmhZOiyc/4sCcC7rR8TlA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 09:36:49 +0200
Message-Id: <DLCBCIBSXUHT.2SR3V23FN8VPD@bootlin.com>
Subject: Re: [docs] Does Ubuntu 24.04 and newer still require AppArmor
 tweaking to run bitbake?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <ec2658dc-005e-f6cc-d64e-0a1c15e992a7@crashcourse.ca>
In-Reply-To: <ec2658dc-005e-f6cc-d64e-0a1c15e992a7@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 07:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10450

Hi,

On Thu Sep 10, 2026 at 2:57 PM CEST, Robert P. J. Day wrote:
>
>   I use stock Debian so I haven't needed to mess with this, but Ubuntu
> once had this issue with AppArmor:
>
> https://developerwiki.proventusnova.com/Error:_BitBake_+_AppArmor_User_Na=
mespace_Restriction_Fix
>
> If that's still a problem, it doesn't seem to be mentioned in the
> docs.

I don't have a running Ubuntu 26.04 distribution but I would say it is stil=
l the
case if 26.04 is still running AppArmor.

Users will face the same error as before which is:

  bb.fatal("User namespaces are not usable by BitBake, possibly due to AppA=
rmor.\n"
           "See https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numba=
t-release-notes/39890#unprivileged-user-namespace-restrictions for more inf=
ormation.")

In OE-Core's meta/lib/oe/sanity.py.

This sounds like something we could say in the docs. Would you mind sending=
 a
patch for that?

Thanks,
Antonin

