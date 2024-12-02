Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECDBD10DD7
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 09:02:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.169424.1733130175137918654
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Dec 2024 01:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O+yJOshf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A014BFF802;
	Mon,  2 Dec 2024 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733130173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MdGRhWo9RiWscJtE2Y9Dm8BkG0cLlTFslhAk+VFXO4=;
	b=O+yJOshfVF6O14QhMVwiASjv+g4DDl4d62D9WnzjZSnr7k0pcBVTNKYp3oHxkYcTFrbGRg
	+LkA9suh2NXTmXwSCIZ1O/VGiMqHA4JwBJBIruKqzJyJpnpPX5aGyC3k5kZBmonobFP4MX
	gpRXr9qjBPowPSAw+FMJ1V31tNwUwK0R/De0ynpAhJMzhcgmAiNl14rMKpZrUS5B5cCCys
	2NfP2V1P9/OsfqmCVs1EpqGwEjweVfCNIYLk8e0jprsqhJ0NTbfwq0Dab2Zeam8CXq4Qo7
	a343NAoSKlyqYGkbXLDI/R+zUDygUBUXTVeUAIpQZ8d6xjariI9XB9flO5aYdg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Dec 2024 10:02:53 +0100
Message-Id: <D613DE1UW3GV.OXCJKSG2VQH6@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <michael.opdenacker@rootcommit.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
 <20241201173801.3290796-3-michael.opdenacker@rootcommit.com>
In-Reply-To: <20241201173801.3290796-3-michael.opdenacker@rootcommit.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Dec 2024 09:02:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5863

Hi Michael,

On Sun Dec 1, 2024 at 6:38 PM CET, Michael Opdenacker via lists.yoctoprojec=
t.org wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> - Remove duplicate instructions
>
> - Detail how to run bmaptool directly if you installed it on your host
>   instead of building it through the ``bmaptool-native`` recipe,
>   as running "oe-run-native bmaptool-native bmaptool ..." won't work
>   in this case.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  documentation/dev-manual/bmaptool.rst | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
> index 5fc46c7792..e17074b65b 100644
> --- a/documentation/dev-manual/bmaptool.rst
> +++ b/documentation/dev-manual/bmaptool.rst
> @@ -44,14 +44,16 @@ any type of image. Use these steps to flash an image =
using `bmaptool`:
>     depending on your particular setup. The following commands assume the
>     image resides in the :term:`Build Directory`'s ``deploy/images/`` are=
a:
> =20
> -   -  If you have write access to the media, use this command form::
> +   -  If needed, set permissions to get write access to the media::
> =20
> -         $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
> +         $ such chmod 666 /dev/sdX

I know this was already instructed before, but maybe `chmod o+w` is a bette=
r
practice and advice to give. What do you think?

Also I think this recommendation could be given after the sudo command, sin=
ce it
shouldn't be a problem to write to the device as root. I'm assuming the `ch=
mod
o+w` instruction was added here because oe-run-native doesn't run as root.

> +
> +   -  If you installed the package for `bmaptool`, you can directly run:=
:
> +
> +         $ sudo bmaptool copy build-directory/tmp/deploy/images/machine/=
image.wic /dev/sdX
> =20
> -   -  If you do not have write access to the media, set your permissions
> -      first and then use the same command form::
> +   -  Otherwise, if you built `bmaptool` with BitBake, run::
> =20
> -         $ sudo chmod 666 /dev/sdX
>           $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
> =20
>  For help on the ``bmaptool`` command, use the following command::

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

