Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC4ACDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 10:26:47 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.207633.1697538399165816900
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 03:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RY/LFadB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E66540007;
	Tue, 17 Oct 2023 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697538397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxizDOZEnyjouDtMYlBfJQB3Pz4A2PsOCDa256YH2XA=;
	b=RY/LFadBmqqyYQncByJsilK2oFtoMUZEg7kVp0UIxVQcYV5og5iqlupTA4n+kdWWLE3pZA
	Sd32G55JI7gQp5tqCUCX3FEXYDpERlSmsjm1bXPZNLiTdel6dK3E4OUIuhKlY1tDLTw8m3
	fSsL52g8RNg8YKmZ//6IA4/2p6m0D+ingrrFawPyenR8jFUe2gHeKxynIzxWz/e143aKsa
	imUEL+VSpYv58Ns3SjleSjDGOHvfJQHFDSmoVNzi8P3eTLHIi9V1kc0HCqAUDKfIH41Epf
	OXgIDA4vkcOLPmKG7Lsx+VpzJr3TlxeM0+1Q9k6WhF4bn26CBPgIRqTqgrFMPQ==
Message-ID: <82a96011-ee55-497f-b0e2-cfd3777c2fb5@bootlin.com>
Date: Tue, 17 Oct 2023 12:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] profile-manual, Chapter 1, aesthetic cleanups
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <6d3b57846c1525e3663e7ee0b61dbd93@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6d3b57846c1525e3663e7ee0b61dbd93@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 10:26:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4391

Hi Robert

Many thanks for this patch!

I completely agree with your changes which definitely make sense. In 
particular, the style improvements are welcome!

See my comments below...

On 14.10.23 at 12:15, Robert P. J. Day wrote:
>
>
>  Most of the tools are available only in 'sdk' images or in images built
> -after adding 'tools-profile' to your local.conf. So, in order to be able
> -to access all of the tools described here, please first build and boot
> -an 'sdk' image e.g. ::
> +after adding 'tools-profile' to your ``local.conf`` file. So, in 
> order to be able
> +to access all of the tools described here, you can build and boot
> +an 'sdk' image, perhaps one of: ::


I know this is the original text, but I'm also changing 
"`tools-profile`" to "``tools-profile``", and "`sdk`" to "``sdk``".

I also replaced ": ::" by "::".

>
> @@ -64,8 +66,8 @@ the tracing and profiling tools will be included in 
> non-sdk images as well e.g.:
>  If you've already built a stripped image, you can generate debug
>  packages (xxx-dbg) which you can manually install as needed.
>
> -To generate debug info for packages, you can add dbg-pkgs to
> -:term:`EXTRA_IMAGE_FEATURES` in local.conf. For example::
> +To generate debug info for packages, you can add 'dbg-pkgs' to
> +:term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::

Same here, using ``dbg-pkgs``.

After my minor changes:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Don't hesitate to send us more :)

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


