Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9480C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:42:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.8379.1647020520694109445
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 09:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gU1LHngp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A17921BF203;
	Fri, 11 Mar 2022 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647020519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jx4eHE1CZBk+3ROhqOFRZ/HuHFzDUtz5kY0h0o3Lf98=;
	b=gU1LHngpN1kFOIjqZo2Xy7Us7tyWj5lRTtxRabEQ3BiEJLvShzy6+/W6MHfY3rOnX7QQxW
	m7r9fs2XFaZE9qzTUi8cWnwkmg0lXMK3w/HGlHKEm3FYHn1zLFrRWy7s1Qdwl1+dLkLFol
	mmPhuaqaRAIpm7sH4y07JXD7UcXQvQq2lXHR5iQOamRXPAZHp/mkpTYYnv34n8PC7tzsTE
	dWJTf8wwrUmEq9YZN8LbrP65iJeGIRzi3IomA/A9Afyek/UhuLa1PkQMcvOGjQLAxLY2pH
	a5FGAQo3qyphQtWOxdE6Es7TbKmldrPbkl7x1lw8ZbIcoQoqAmRIksLKwzLAuQ==
Message-ID: <e9ec6ee9-bfed-9409-4a08-359b801903e9@bootlin.com>
Date: Fri, 11 Mar 2022 18:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] manuals: inclusive language updates
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <16DA20B7CA534643.15718@lists.yoctoproject.org>
 <66ca0a6f-cb1b-b2b0-e1fb-31239a5dff74@bootlin.com>
 <9add9f9c-3659-e97b-57b7-5f19d75e4f8b@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <9add9f9c-3659-e97b-57b7-5f19d75e4f8b@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 17:42:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2600

Hi Quentin

On 3/11/22 18:34, Quentin Schulz wrote:
> https://git.openembedded.org/bitbake/commit/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst?id=98809ebc6ad51f0a94cedccfaff9c11d3744dc0d
>
>
> But I would very much prefer to have it also alphabetically ordered in
> the source file :) (but add the commit adding the :sorted: flag too as
> it makes sure that the output will be alphabetically ordered which is
> what matters the most).


Good idea to add the ":sorted:" flag, thanks for the reminder.
I definitely agree to keep the source file alphabetically sorted. I'll
do that manually, that's pretty easy and checking the order will be
automated anyway.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


