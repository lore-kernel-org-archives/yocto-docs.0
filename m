Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73C6E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 08:48:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.18913.1735202906409643326
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 00:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M9jBWWEN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B3511C0004;
	Thu, 26 Dec 2024 08:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735202904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FDQCqySzcP8/Hg1Hqn5bQUzWcNYzEjDcA25o09EQnjo=;
	b=M9jBWWENhTG3EW6lEDjqM2fbud+63P6TRFpzbJJIZVCj0O1ueoFeBwBkDM2/oWqKcx3O7P
	mji8LniLphGbj5LIJ/HKTQHGdfC6R0H12bd8KMezc7h5HXcqvY/YeWQuu2H78LDsDbJubC
	jHJUH+G0N+ikRiP86A+jKaaC6OLCsolOf7t+IkhoM08RQ+J4kHc0tGlSPx1d/anIu1Pnr0
	A08JB5Mjq9NHfsWbTqb6tDL5D9Ma7PBzHxenDfYKzcB6d4wxV+xdOK9K8OAW5wqnnhk5Hy
	oZoalbYBaeDD8YRNg7CnTP2ovd6JT0/xJf8CciO4NjZb3ncW2RtYihs24nbR5A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Dec 2024 09:48:23 +0100
Message-Id: <D6LI3DDK7YCD.1YQYNSJ0I5A68@bootlin.com>
Subject: Re: [PATCH] SSTATE_MIRRORS/SOURCE_MIRROR_URL: add instructions for
 mirror authentication
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <peter.zsifkovits@at.bosch.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Antonin Godard" <antonin.godard@bootlin.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241224-sstate-mirror-user-password-v1-1-d33e424617be@bootlin.com>
In-Reply-To: <20241224-sstate-mirror-user-password-v1-1-d33e424617be@bootlin.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 08:48:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6037

On Tue Dec 24, 2024 at 4:35 PM CET, Antonin Godard wrote:
> [ YOCTO #15218 ]
>
> There are different ways of configuring the build host when
> authentication to a mirror (SSTATE_MIRRORS or SOURCE_MIRROR_URL) is
> required.
>
> Document these methods, and begin with the preferred approach which is
> to edit ~/.netrc appropriately. When that is not possible, specifying
> the credentials from the URL is also possible, so document it as well.
>
> Reported-by: peter.zsifkovits@at.bosch.com
> Tested-by: Antonin Godard <antonin.godard@bootlin.com> # Debian 12 contai=
ner
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Tested in a Debian 12 container like so:
>
>   $ mkdir downloads
>   $ cp .../{bash-5.2.21.tar.gz,bash-5.2.21.tar.gz.done} downloads/
>   $ pip install sauth # python http server with basic auth
>   $ sauth username password 127.0.0.1
>
> In local.conf:
>
>   INHERIT +=3D "own-mirrors"
>   SOURCE_MIRROR_URL =3D "http://127.0.0.1:8333/downloads"
>   BB_ALLOWED_NETWORKS =3D "127.0.0.1"
>
> In bitbake's shell:
>
>   $ bitbake bash -c cleanall
>   $ bitbake bash -c fetch
>
> As expected, error in log.do_fetch:
>
>   Connecting to 127.0.0.1:8333... connected.
>   HTTP request sent, awaiting response... 401 Unauthorized
>
> Now, configure the following in ~/.netrc:
>
>   machine 127.0.0.1
>   login username
>   password password

Forgot to mention: I also chowned this file to 600 and 400, and it works.

