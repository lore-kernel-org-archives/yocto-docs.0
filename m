Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFE4C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 13:42:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.11882.1633614119838324445
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 06:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6ED811C000D;
	Thu,  7 Oct 2021 13:41:57 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/4] overview-manual: SVG diagram for the git
 workflow
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
 <20211006122238.959343-3-michael.opdenacker@bootlin.com>
 <20211007124253.jx6pgewhaiwako7q@fedora>
 <20211007133222.5i2oxea6hfgiyji4@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <e510dbe8-9288-9470-64fa-4aad01b8df79@bootlin.com>
Date: Thu, 7 Oct 2021 15:41:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007133222.5i2oxea6hfgiyji4@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 13:42:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1951


On 10/7/21 3:32 PM, Quentin Schulz wrote:
> Answering myself:
>
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html?highlight=image#images
>
> Depends on the Builder and its supported_image_types setting (first
> match, from left to right).
>
> For HTML, it is
> https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.html.StandaloneHTMLBuilder,
> svg first then png, etc..

Good that you found the defaults there. I didn't read that page
carefully enough, and I thought it was just an example.

I'm merging this series in master next, after adding the comment about
Inkscape that you suggested in the README file.

Thanks for the review!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


