Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF07C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 14:04:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.21891.1713189870845068338
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 07:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Sldlm68+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18943FF805;
	Mon, 15 Apr 2024 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713189868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFZxMW7zfhhoIyFwrq7+sVE0mHS69LismdqbHouM4hs=;
	b=Sldlm68+LUNk8l1rBvvhvNpMAmLr7CZP5riaGS7G3P0hZmL1QmnG5na5x2IGNfHmJin/0O
	VdDZaosPlssAMC9ztTN7j1fXgJjDdEbBN8wuK+Hff2AkjB32tcOABeuyUb9+OZDdFVeKXZ
	i89aMjBPiCVLgcV6SIlsdsLgCwrTl14r3TwTq45WqoneFsfmMZPAVKN9zsHZNmE/dzTXBw
	DFZtZwYEG6xeVAHTA7Sz2t2427c04cGVMGGutHApcWdMWVENQB5pNbnvz5lk7yHAm52cvE
	yYqI3hsbzY8yzdJaXtYBDy8L04nk+5LOrfcdP0Gfp307HRFsNbM4bla07YHHdQ==
Message-ID: <5edf723f-d382-46c2-a868-056c3c38656b@bootlin.com>
Date: Mon, 15 Apr 2024 16:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 6/9] dev-manual: update custom distribution section
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <cb839b9d7e58ddf1927685c3fefcd2fa7e551618.1713127068.git.bluelightning@bluelightning.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <cb839b9d7e58ddf1927685c3fefcd2fa7e551618.1713127068.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 14:04:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5153

Hi Paul,

On 4/14/24 at 22:43, Paul Eggleton wrote:
> In keeping with the addition of the motd message pointing out that
> the poky DISTRO is a reference distribution, adjust the opening of the
> Creating Your Own Distribution section to match. Additionally, add a
> section on the end pointing out what users need to consider if they just
> take a copy of the poky distribution and modify it.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   .../dev-manual/custom-distribution.rst        | 34 ++++++++++++++++---
>   1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
> index 47faed0d04..93a1961d17 100644
> --- a/documentation/dev-manual/custom-distribution.rst
> +++ b/documentation/dev-manual/custom-distribution.rst
> @@ -4,10 +4,16 @@ Creating Your Own Distribution
>   ******************************
>   
>   When you build an image using the Yocto Project and do not alter any
> -distribution :term:`Metadata`, you are
> -creating a Poky distribution. If you wish to gain more control over
> -package alternative selections, compile-time options, and other
> -low-level configurations, you can create your own distribution.
> +distribution :term:`Metadata`, you are using the ``poky`` distribution.
> +``poky`` is explicitly a *reference* distribution for testing and
> +development purposes. It enables most hardware and software features
> +so that they can be tested, but this also means that from a security
> +point of view the attack surface is very large. Additionally, at some
> +point it is likely that you will want to gain more control over package
> +alternative selections, compile-time options, and other low-level
> +configurations. For both of these reasons, if you are using the Yocto
> +Project for production use then you are strongly encouraged to create
> +your own distribution.
>   
>   To create your own distribution, the basic steps consist of creating
>   your own distribution layer, creating your own distribution
> @@ -107,3 +113,23 @@ layer. The following steps provide some more detail:
>      For information on append files, see the
>      ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
>      section.
> +
> +Copying and modifying the ``poky`` distribution
> +===============================================
> +
> +Instead of creating a custom distribution from scratch as per above, you may
> +wish to start your custom distribution configuration by copying the ``poky``
> +distribution provided within the ``meta-poky`` layer and then modifying it.
> +This is fine, however if you do this you should keep the following in mind:
> +
> +-  Every reference to ``poky`` needs to be updated in your copy so that it
> +   will still apply. This includes override usage within files (e.g. ``:poky``)
> +   and in directory names. This is a good opportunity to evaluate each one of
> +   these customizations to see if they are needed for your use case.
> +
> +-  Unless you also intend to use them, the ``poky-tiny``, ``poky-altcfg`` and
> +   ``poky-bleeding`` variants and any references to them can be removed.
> +
> +-  More generally, the ``poky`` distribution configuration enables a lot more
> +   than you likely need for your production use case. You should evaluate *every*
> +   configuration choice made in your copy to determine if it is needed.


Looks good to me, though I replaced "``poky``" by "Poky" (when referring 
to the distro name, not the string) to be consistent with the rest of 
the documentation.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


