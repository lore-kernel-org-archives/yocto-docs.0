Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1086DC433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 19:07:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.623.1633547256621483507
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 12:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2DF2BC0004;
	Wed,  6 Oct 2021 19:07:33 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/4] Makefile: allow epub and latexpdf outputs to
 use diagrams from SVG sources
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
 <CAP71WjzQKKf2rOoxFKWqAKemgwO9JZLKykk+kYYQBoRSnsHOuQ@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d91a81bf-bf66-3279-1fa1-7f8c7d79da67@bootlin.com>
Date: Wed, 6 Oct 2021 21:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CAP71WjzQKKf2rOoxFKWqAKemgwO9JZLKykk+kYYQBoRSnsHOuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 19:07:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1933

Hi Nico,

On 10/6/21 4:48 PM, Nicolas Dechesne wrote:
>
> For the entire series:
> Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org
> <mailto:nicolas.dechesne@linaro.org>>

Thanks for the review!
>
> Thanks for turning the initial RFC into this series. We need to get
> back at producing and releasing PDF files. It might be a bit too late
> for this release.. perhaps not.. but definitely something to do for 3.5.


Maybe not, if the PDF is considered mature enough.

>
> Quickly browsing through the PDF I can spot some graphics issues..
> Would be interesting to do an in-depth review of the PDF!


I'll check and try to find solutions.

Thanks again,

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


