Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED61CD4F41
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 09:25:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.17286.1695374751580332566
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 02:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=phBmIbC4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE04DC0002;
	Fri, 22 Sep 2023 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695374749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlrcbLMI6QdQEZr6ljyyVjYUObctOlAsneTlg197Dxc=;
	b=phBmIbC41/r7mxPnk4iDlPdYHzZ01Q4uil+sCRSG4Wbc/6SyQSEO1okBBY+2BgwfAlLopF
	QGxOcts5e6uU0s/5fSAqWzTuwbZ0yD/Gj1wZiZV4/XYwyofCG9fDTvCzxHe1xLqfIONNe4
	3zjBUfsCISNallZaZ6mA35kW9a8gHro8/x6nbPkueUf8ys1EwTTFzisMXWhUaYKLS/o60m
	DtQ0wXbQ9/GC9vYW0pZu1eDP8Aa4Ax33sIb1BXiphUA5R49LZ9WRSE2iEf1y0HuixdoD4S
	mVAf0F1UfwhvJEyg1Is+0zDZ/wwDGh9nx69pTn3+eo+HqZCQZ/Dwi3E0R/xyZA==
Message-ID: <a79890d9-1a70-728f-28b8-63f9ff34c537@bootlin.com>
Date: Fri, 22 Sep 2023 11:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: docs@lists.yoctoproject.org, yocto@pengutronix.de
Subject: Re: [docs] [PATCH 2/4] contributor-guide: recipe-style-guide: add
 some more patch tagging examples
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>
References: <20230920100647.1038583-1-rhi@pengutronix.de>
 <20230920100647.1038583-2-rhi@pengutronix.de>
 <6e8be021-45ef-0b0e-5956-31fb1a252575@bootlin.com>
 <20230921085243.yunlcrdstdwpthld@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230921085243.yunlcrdstdwpthld@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Sep 2023 09:25:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4288

Hi Roland

On 21.09.23 at 10:52, Roland Hieber wrote:
> On Wed, Sep 20, 2023 at 04:16:12PM +0200, Michael Opdenacker via lists.yoctoproject.org wrote:
>> Could we instead use an example giving a commit instead of a pull request?
>> With a pull request (like this one), it's hard to see what the final commit
>> was, and we have to follow the link to double check whether the request was
>> merged or not.
> Yes, that also makes more sense to me. But note that GitHub URLs
> pointing to a commit also work if the commit in question was not yet
> merged (or even if it is only available in a fork), so you'd still have
> to click on the URL or check for the commit ID in the Git repo yourself
> to see if it was merged (however this way you have the commit ID
> directly in the patch).


Oh right, this makes sense.
Thanks in advance for the updates to your patch series.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


