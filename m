Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986D5E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 14:31:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.8810.1735828314732482813
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jan 2025 06:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZfXo6hVI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F859C0008;
	Thu,  2 Jan 2025 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735828312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2JzLKCruq0VijfK8E3YC5iQBCQI1AyRZgW3Xykq0il8=;
	b=ZfXo6hVInih8cldCUdm88njfYYghOtPFQJblVZDg01r9djON/7cjXpOvmOiHkJPgxcdtXV
	4ucrfkWEHGB3wUrcKXvyYlFAjOpAAWL3WufBlLMf9bnLeKiXNCDHfzGo/m/v4YvnF9eXwu
	L0ZxWwTfUHvT97IZfz+WVr4urKOB/bK6TPMcRL5zdBjK3UyWtfLfF0olAqnJGz3Ahzhtqd
	p/MDqStQ2IkeSoa0n0n0VGL/RHobKfJ+C03Aq4zo4FhWxNfGx35RMJa1Q/QQMYkzjRKXif
	tTWOOD875o2UOgWd++Hx60qygK6BqgTW7HIAQ6DoHC9vJa8aqu/fUG9EHJy99g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jan 2025 15:31:52 +0100
Message-Id: <D6RNS5YQIMHO.1IZBC6NSQIVT3@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <joerg.sommer@navimatix.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/2] bitbake/doc/logging: small clean-up and name
 environment
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <9423e2349e9c4f8e5b3a9490e4539156db533e02.1735826398.git.joerg.sommer@navimatix.de>
In-Reply-To: <9423e2349e9c4f8e5b3a9490e4539156db533e02.1735826398.git.joerg.sommer@navimatix.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jan 2025 14:31:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6056

Hi J=C3=B6rg,

On Thu Jan 2, 2025 at 3:14 PM CET, J=C3=B6rg Sommer via lists.yoctoproject.=
org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> The variable *BB_LOGCONFIG* is part of *BB_ENV_PASSTHROUGH_ADDITIONS* in
> /scripts/oe-buildenv-internal and can therefore be passed as environment
> variable.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../bitbake-user-manual-execution.rst                 | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-executio=
n.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
> index d58fbb32ea..a1267400ab 100644
> --- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
> +++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
> @@ -671,7 +671,7 @@ logging configuration is merged using the following r=
ules:
> =20
>  -  Any keys defined in the ``handlers``, ``formatters``, or ``filters``,
>     will be merged into the same section in the default configuration,
> -   with the user specified keys taking replacing a default one if there
> +   with the user specified keys replacing a default one if there
>     is a conflict. In practice, this means that if both the default
>     configuration and user configuration specify a handler named
>     ``myhandler``, the user defined one will replace the default. To
> @@ -707,9 +707,9 @@ or higher priority to a file called ``hashequiv.log``=
::
>             }
>         },
>         "formatters": {
> -               "logfileFormatter": {
> -                   "format": "%(name)s: %(levelname)s: %(message)s"
> -               }
> +           "logfileFormatter": {
> +               "format": "%(name)s: %(levelname)s: %(message)s"
> +           }
>         },
>         "loggers": {
>             "BitBake.SigGen.HashEquiv": {
> @@ -723,7 +723,8 @@ or higher priority to a file called ``hashequiv.log``=
::
>         }
>     }
> =20
> -Then set the :term:`BB_LOGCONFIG` variable in ``conf/local.conf``::
> +Then set the :term:`BB_LOGCONFIG` variable in the process environment wh=
en

s/in the process environment/as an environment variable/?

Just a suggestion, feel free to ignore it.

> +calling bitbake, or set it in ``conf/local.conf``::
> =20
>     BB_LOGCONFIG =3D "hashequiv.json"
> =20

By the looks of it, these patches should be sent to the
bitbake-devel@lists.openembedded.org list, with docs@lists.yoctoproject.org=
 in
CC, and apply to the bitbake repository, not poky.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

