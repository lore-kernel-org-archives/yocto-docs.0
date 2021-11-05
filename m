Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED99C433FE
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 16:20:32 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.7834.1636129231067495511
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 09:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0B0D66000E;
	Fri,  5 Nov 2021 16:20:28 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: Document the EXTERNALSRC_EXTENSIONS
 variable
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 docs@lists.yoctoproject.org
References: <20211019170434.18700-1-pkj@axis.com>
 <16AFC7A64FAFF929.12113@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <0a43a5b5-c146-281e-b5ba-78ee6a678200@bootlin.com>
Date: Fri, 5 Nov 2021 17:20:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16AFC7A64FAFF929.12113@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Nov 2021 16:20:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2095

Hi Peter

On 10/20/21 5:45 PM, Michael Opdenacker wrote:
> Hi Peter,
>
> Thanks for the documentation patch!
>
> On 10/19/21 7:04 PM, Peter Kjellerstedt wrote:
>> EXTERNALSRC_EXTENSIONS is used to specify additional classes to inherit
>> when externalsrc is inherited.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Waiting for your patch to be accepted in OE-core before merging in
> master-next.


Apparently, your code hasn't been merged yet, and following the
discussions on OE-core, I'm not sure what to expect.
Would you mind sending me the patch again when something happens?
Thanks for everything
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


