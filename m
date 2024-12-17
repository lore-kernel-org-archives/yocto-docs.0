Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9B7E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:31:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.78760.1734431492223920267
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 02:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SLUf2xfr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C068C0006;
	Tue, 17 Dec 2024 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734431490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aKFLu+cr2+ayH7WnynrkwRwDfVm84fsYlkrpZU4KOlc=;
	b=SLUf2xfrf/tCTtxHJMXPOCkU3K4k6+YE1SKxu955gYD6i+Geu2U9MJpJabZ8yqMaiEcRhT
	1RujKKzhhpAc+3YCmepxmxn/JvzHfUnit2viCPSVJ0wNO7IC5VJXyR/Gn0OOte9HwU8qbV
	2nJVjLdRi8Eb6n2Tw2a0j9DFfIrSQoZ/QGjbxoY3In+BY3zrLsDqN//5wYvl1TEyTRnAs1
	yhcxJMUJwPhnmUnbBPb0kM9kS/EIMFJ2FlurFRXv7V4ZpSZeVws6KNyAgbzEYiPATo48Dg
	pSjSnd2sPifKydxahowG/ICuYFnFxDNwmSVXRG1Q7CYfY2SjsIC8Q3/WUHdS9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Dec 2024 11:31:29 +0100
Message-Id: <D6DWNEOPVATF.2H2X15PIOPKK1@bootlin.com>
Subject: Re: [docs] [PATCH RFC 1/2] docs: use literalinclude for system
 requirements
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de> <20241210-instructions-shell-container-v1-1-6a7cdc404ff4@cherry.de>
In-Reply-To: <20241210-instructions-shell-container-v1-1-6a7cdc404ff4@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 10:31:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5953

Hi Quentin,

On Tue Dec 10, 2024 at 4:26 PM CET, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> The YAML variables for the host dependencies are updated by hand and
> actually only used inside code blocks.
>
> It's also slowly getting more difficult to make sense of the content of
> those variables as they are both the list of packages to install with
> the distro's package manager and sometimes additional commands, which
> all need to have the indentation of the block where the variable is used
> matched. This is impossible so we just guess it's going to be at a
> specific indentation.
>
> Instead, let's migrate all instructions into separate shell scripts that
> are then literalinclude'd into the Sphinx documentation.
>
> This allows a few things:
> - ability to run shellcheck on the scripts if we ever want to
> - manually calling the appropriate script from a supported distro to
>   build stuff (distro or bitbake/yocto stuff)
> - use this script to create containers to do CI of documentation on
>   different distros, to make sure our instructions are all up to date,
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  documentation/poky.yaml.in                         | 26 -------------
>  documentation/ref-manual/system-requirements.rst   | 45 ++++++++++++----=
------
>  .../tools/almalinux_host_packages_docs.sh          |  2 +

Maybe I would put the scripts in a subdirectory called "host_packages_scrip=
ts"
and rename the scripts "almalinux_docs.sh", "almalinux_essential.sh", etc. =
for
shorter names. Same for Containerfiles in the next patch, maybe storing the=
m in
a subdirectory would make sense.

If putting them at the same level is because of the build context requiring
files to be all at the same place, let's leave it like this.


Otherwise, this needs to be rebased and updated after the dependencies were
updated on master.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

