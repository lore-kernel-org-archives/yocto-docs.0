Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EB1D1A45D
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 09:28:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7595.1728725286670143209
 for <docs@lists.yoctoproject.org>;
 Sat, 12 Oct 2024 02:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MTdUJk8+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE1221C0002;
	Sat, 12 Oct 2024 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728725285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CzPurgIqJsNUUAAOHTgjk71mnqZA2wM8qAzlMgQbG/U=;
	b=MTdUJk8+dU/6BDksWmvkCIz65j2URH2r0LEkyFz+ZqzO8cxIYhHcf7vRgzG4LX6i4sgx48
	WH/FcL5vwBV8gCmfwXzRirirm8ivDtmAa3k0xlq4FafTH35JX+8LKDavjqQg9uTiM+E4J9
	xJQ4/lQ+JA71Y2parvSH0dDt5wvgy/hGRhvqo5gLeHnJ1LZ8iezzeiMGP5WN9NiGDYHGWs
	fjB4zpFuh1okoowAuwOdI2XyYqtccN1FHKWbx7A+wNZEa4HS8HTv8WAF03UEseL1CHus1G
	lueJ5q5UXrsw+ba3/XRX4j19wAxin5uYy1BzNX+XusUt94g7odnuq8oUYB+qWg==
Date: Sat, 12 Oct 2024 11:28:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs <docs@lists.yoctoproject.org>,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	"antonin.godard" <antonin.godard@bootlin.com>
Subject: Re: Docs build/workers need inkscape?
Message-ID: <202410120928040e8758c6@mail.local>
References: <3019070797186fd40c2b71959ed6b995660a790f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3019070797186fd40c2b71959ed6b995660a790f.camel@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 12 Oct 2024 09:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5474

On 12/10/2024 10:19:11+0100, Richard Purdie wrote:
> Hi All,
> 
> We've seeing docs build failures:
> 
> https://valkyrie.yoctoproject.org//#/builders/34/builds/6
> 
> The issue is that inkscape isn't installed on the workers and isn't in
> the docs buildtools tarball either.
> 
> I'm reluctant to start requiring installing inkscape on all autobuilder
> workers as we try and keep the packages installed minimal for the other
> builds.
> 
> I'm wondering if we should just pre-generate those png files alongside
> the svg sources? I can send a patch doing that...

Antonin was suggesting using librsvg in an email you didn't receive, I'm
going to forward it to you.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

