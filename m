Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060ACC433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 08:58:27 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.9824.1637830706190521287
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 00:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5833E240006;
	Thu, 25 Nov 2021 08:58:22 +0000 (UTC)
Subject: Re: [docs] [honister][PATCH] documentation: prepare for 3.4.1 release
To: Anuj Mittal <anuj.mittal@intel.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20211124150928.11645-1-anuj.mittal@intel.com>
 <16BA84AC7B404D44.11456@lists.yoctoproject.org>
 <3cf9ec30-d44f-f35d-fbb2-d118e3e2d5f8@bootlin.com>
 <e413eb962e1590f491545eb7a6a69150073bdaee.camel@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c48fa35b-7f69-5727-ea4c-d5ef54194ed8@bootlin.com>
Date: Thu, 25 Nov 2021 09:58:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e413eb962e1590f491545eb7a6a69150073bdaee.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Nov 2021 08:58:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2202

Hi Anuj,

On 11/25/21 3:04 AM, Anuj Mittal wrote:
> On Wed, 2021-11-24 at 21:57 +0100, Michael Opdenacker wrote:
>>> Many thanks for these updates!
>>> Just to be sure... when do you expect me to merge these changes?
>>> Before the release so that everything is all set in the docs when
>>> the
>>> release is out?
>>> Or right after the release is made so that the docs don't refer to
>>> a
>>> release that is not available yet?
>>
>> I guess that the second option (waiting for the release) is the
>> correct one.
> I think we were until now following the first approach. But yes, the
> second one is probably better and correct. Should I send a v2 after the
> release has been made?
>
> Thanks,
>
> Anuj


Thanks for confirming.
No need to modify your commit this time. I'll take care of it.
Next time though, you could just have a title saying "update for
release..." instead of "prepare for release".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


