Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15914D3B7EB
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 08:03:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14438.1732521792614517496
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 00:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PTj/biy4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2D8840004;
	Mon, 25 Nov 2024 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732521790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bGVbvyhQILdl2YujvTwfnu5zSMXa1DRzsuo50d/zWvM=;
	b=PTj/biy4oRSbgogxvEJ+yjVWwXBMbCafWgdblxPiIjk4sB8hHly7Q2OEQ5rMdrU+ZCpx9c
	W5Rj4KarIFi9dnkjdrdIUsSATZq2M2FNBhCWn50xn0kLndluXmesAm5SMqCZkhxnCxMCsx
	GThe2VKeBMFKoJinfGD0s+krH3GzdspDOxdoyBB7NazzjxJJGYaRIMpgSDqMbK6dGE7wAK
	EiRN11+pecY6EI+xAunFlQXeas3GFn+hiBZPyqZFXPbWFlJlBCm0n2C5tWWFVdWkNRMRuY
	098le73ayCQzIsxLD/RT58r0fJfX3l5eBA10FAF5r/r3p1YjNt+v9K4s0c/Jfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Nov 2024 09:03:10 +0100
Message-Id: <D5V3PUR8DGTS.14I98RPIOBHS9@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 5.0.5
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241125040157.1706215-1-chee.yang.lee@intel.com>
In-Reply-To: <20241125040157.1706215-1-chee.yang.lee@intel.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 08:03:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5795

Hi Chee Lee Yang,

On Mon Nov 25, 2024 at 5:01 AM CET, Lee Chee Yang via lists.yoctoproject.or=
g wrote:
[...]
> +Known Issues in Yocto-5.0.5
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  ``oeqa/runtime``: the ``beaglebone-yocto`` target fails the parselogs=
 runtime test due to unexpected kernel error messages in the log (see bug 1=
5624 on Bugzilla).

Nit: you could use ":yocto_bugs:`bug 15624 </show_bug.cgi?id=3D15624>` on B=
ugzilla" to
provide a link to the bug.

[...]
> +Repositories / Downloads for Yocto-5.0.5
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +poky
> +
> +-  Repository Location: :yocto_git:`/poky`
> +-  Branch: :yocto_git:`scarthgap </poky/log/?h=3Dscarthgap>`
> +-  Tag:  :yocto_git:`yocto-5.0.5 </poky/log/?h=3Dyocto-5.0.5>`
> +-  Git Revision: :yocto_git:`dce4163d42f7036ea216b52b9135968d51bec4c1 </=
poky/commit/?id=3Ddce4163d42f7036ea216b52b9135968d51bec4c1>`
> +-  Release Artefact: poky-dce4163d42f7036ea216b52b9135968d51bec4c1
> +-  sha: ad35a965a284490a962f6854ace536b8795f96514e14bf5c79f91f6d76ac25d3
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0.5/poky-dce=
4163d42f7036ea216b52b9135968d51bec4c1.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-5.0.5/poky-dce4163d42f703=
6ea216b52b9135968d51bec4c1.tar.bz2

It'd be nice to provide HTTPS links instead, could you change that?


Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

