Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3743CC433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 13:35:35 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.11737.1633613733906149506
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 06:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id A095F240009;
	Thu,  7 Oct 2021 13:35:31 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/4] overview-manual: SVG diagram for the git
 workflow
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
 <20211006122238.959343-3-michael.opdenacker@bootlin.com>
 <20211007124253.jx6pgewhaiwako7q@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9de748ab-3704-96a5-e8e6-06fe316067bb@bootlin.com>
Date: Thu, 7 Oct 2021 15:35:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007124253.jx6pgewhaiwako7q@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 13:35:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1950

Hi Quentin,

On 10/7/21 2:42 PM, Quentin Schulz wrote:
>
>>  
>> -.. image:: figures/git-workflow.png
>> -   :align: center
>> +.. image:: svg/git-workflow.*
> I guess this is due to HTML rendering including SVG but epub using a png
> created by inkscape?

Right.
>
> We could add a comment for this maybe?

Yes, but maybe in a central place that will explain how to add images.
This may be too verbose to repeat a comment every time we include an image.

>
> Does this work well if you do the following:
>
> $ make latexpdf
> $ make html
>
> for the html to use the svg and not the png created by inkscape?
>
> Otherwise not much to add :)


Yes, it works. Actually, the HTML export seems to prefer SVG over PNG by
default (from my experiments, and as claimed by
https://newbedev.com/using-sphinx-docs-how-can-i-specify-png-image-formats-for-html-builds-and-pdf-image-formats-for-latex-pdf-builds).
We may change this by tuning
|StandaloneHTMLBuilder.supported_image_types in conf.py, but since the
default is fine, I'd say that no extra setting is required.|

|Cheers, Michael.|

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


