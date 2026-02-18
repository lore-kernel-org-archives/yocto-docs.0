Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5738E9A03E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 08:18:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7760.1771402685348867197
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 00:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=J1EApUYW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 380434E40F40;
	Wed, 18 Feb 2026 08:18:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C6CF60738;
	Wed, 18 Feb 2026 08:18:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90203103680A5;
	Wed, 18 Feb 2026 09:18:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771402682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PttoX/IqzU9kRHwU+pbR1ZQTuUUIgLj/8JqNOmBJXsA=;
	b=J1EApUYWl/Aq2edxYlbEDn5C02liEG5meqgA5/Q374MaQjMdGLJz47gYgyBEvxjPKQqzYE
	sOzAMrOWNeYjsQQzGszvzpJ3XF1oPj8yzl8Vq4Q/NUkhliFiwURYMUSY/9OCifzuIIwToX
	fvoC1Tg0Ava/qJeJ8tjP/t3uesDgvJHw28NcnVNWHXOMm5fyZLZv2I0byYxGr4KXaOnaiN
	KWXQ0e8o/YrtKfqu4kP9Hb0Wv2m7YoMPnqme8PhHchwMDosIotDHAGV2DCwFzVjdxQ3Ass
	jb/PsuH7CLE4iU7ldvexKjdyTdPRncGnWWdCj4gkzAAYQQyQCr0iA999NZgZbQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 09:18:00 +0100
Message-Id: <DGHXUDE510VH.1JG9S6P90SNTG@bootlin.com>
To: <foss@0leil.net>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v4 1/3] use a venv for installing packages with
 pip
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
 <20260216-fix-make-multi-target-v4-1-749e588cb7f5@cherry.de>
In-Reply-To: <20260216-fix-make-multi-target-v4-1-749e588cb7f5@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Feb 2026 08:18:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8946

Hi,

On Mon Feb 16, 2026 at 12:26 PM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
[...]
> diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/doc=
umentation/tools/host_packages_scripts/pip3_docs.sh
> index 907ecec55..9aa7f16fb 100644
> --- a/documentation/tools/host_packages_scripts/pip3_docs.sh
> +++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
> @@ -1 +1,3 @@
> -sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
> +python3 -m venv --clear --system-site-packages /tmp/yocto-venv

I find /tmp a bit odd for installing a virtual environment (at least, from =
a
user perspective, as I can understand why you did this for the container).

Maybe you can add a comment above this line saying:

# change "/tmp/yocto-venv" to "./yocto-venv" if you want a persistent virtu=
al environment

?

Also maybe, s/yocto-venv/yocto-docs-venv/?

Antonin

