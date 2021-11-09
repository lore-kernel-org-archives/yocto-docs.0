Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7A7C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 18:17:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.577.1636481847094404719
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 10:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9E4556000B;
	Tue,  9 Nov 2021 18:17:24 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: generalize definition of "container
 layer"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <ff564054-a080-8b5d-4b4f-cda0976188d@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <49be88d4-63e6-fcb2-81b9-7b2499eaff47@bootlin.com>
Date: Tue, 9 Nov 2021 19:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ff564054-a080-8b5d-4b4f-cda0976188d@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Nov 2021 18:17:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2109

Hi Robert,

On 11/9/21 11:29 AM, Robert P. J. Day wrote:
> Given that there seems to be little value in being excruciatingly
> pedantic about whether a container layer has a valid layer as a
> top-level directory, expand the definition to allow either.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>


Many thanks for the patch. I don't see why it should be rejected.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


