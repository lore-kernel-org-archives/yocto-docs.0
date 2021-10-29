Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEE0C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 16:15:12 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.7497.1635524111033302427
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 09:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 098ED200005;
	Fri, 29 Oct 2021 16:15:08 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] [honister] conf: update for release 3.4
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20211021084332.334075-1-quentin.schulz@theobroma-systems.com>
 <20211027104016.uqi7y5d2aluyvf4x@fedora>
 <b1ceabab92cf6b2b6894c85162d84af74aa4abe5.camel@linuxfoundation.org>
 <20211027105243.7ncoejzfms6rcxyh@fedora>
 <20211027112837.7oaibv2saa4ak2gn@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <052ddb4c-0577-e34e-980b-c7ea828c98bc@bootlin.com>
Date: Fri, 29 Oct 2021 18:15:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027112837.7oaibv2saa4ak2gn@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Oct 2021 16:15:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2055

Hi Quentin,

On 10/27/21 1:28 PM, Quentin Schulz wrote:
> Hi all,
>
> Just to make sure the discussion does not get mistaken as an agreement
> on this patch being dropped, can we still merge this one patch in honister
> branch please :) ? It still applies even though we missed the release tag.

I can take care of merging it in honister-next so that Richard can take
it in honister.

However, I also see that Hardknott
(http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/sphinx-static/switchers.js?h=hardknott)
and Dunfell
(http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/sphinx-static/switchers.js?h=dunfell)
should be updated too.

Did I understand correctly?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


