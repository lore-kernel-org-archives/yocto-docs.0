Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C368C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 09:14:44 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.2453.1655284481294898283
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 02:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ythn8tFd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DB42D240004
	for <docs@lists.yoctoproject.org>; Wed, 15 Jun 2022 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655284478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40og3GbcqG1cbbLQzQiIWHKNp/JW5QeNi56kazGpzTo=;
	b=Ythn8tFdwiR3hTsp7TzzgH6m2T+BEaE85hbFOBtnse/TNdLvgj/01Di+Pd0OqQWNsTHn7T
	YnA9XpN2kQMNjLzYeN2yOevm+fihvqPq8rAqUpjJ0MdrRBKG/kcQO/UxdAM/SoROgnvVT5
	C63uEvGbroxApaltZcQUCvEa1XOgwE6fy6hMtaTxiuAdOcgFR7/IguT9mXRKM77Jy42vGj
	8y6/JcEwp+t2BusBzJFMwoPfepDs6IQ4lQUh6EPZqMZA0Ll/PsFqP9XwAi8IrCp3IPuTTQ
	sItfDGHH/8i3I99fqyuzlr1QZrM414Qeg+/MjV3AFazNWlmzYas6YIdBKNnMhQ==
Message-ID: <37b58867-3670-aa38-0bea-d800ce73e5ba@bootlin.com>
Date: Wed, 15 Jun 2022 11:14:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] doc: Makefile: publish pdf and epub versions too
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <16F8C055A720EC59.22184@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16F8C055A720EC59.22184@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jun 2022 09:14:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3002


On 6/15/22 11:12, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> [YOCTO #14357]
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 9fb6814c8f..e013f68e7f 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -22,10 +22,10 @@ help:
>   
>   .PHONY: all help Makefile clean publish epub latexpdf
>   
> -publish: Makefile html singlehtml
> +publish: Makefile html singlehtml epub latexpdf
>   	rm -rf $(BUILDDIR)/$(DESTDIR)/
>   	mkdir -p $(BUILDDIR)/$(DESTDIR)/
> -	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/$(DESTDIR)/
> +	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/epub/TheYoctoProject.epub $(BUILDDIR)/latex/theyoctoproject.pdf $(BUILDDIR)/$(DESTDIR)/
>   	cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR)/$(DESTDIR)/singleindex.html
>   	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html


Note that a possible issue with this patch is that the current 
autobuilder for docs may be missing packages (LaTeX in particular) to 
generate the new epub and pdf outputs.
How shall we proceed?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


