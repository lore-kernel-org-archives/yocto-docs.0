Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7E1C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:45:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.12638.1639410348527400462
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 07:45:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2084240016;
	Mon, 13 Dec 2021 15:45:45 +0000 (UTC)
Subject: Re: [docs] [honister][PATCH] documentation: prepare for 3.4.1 release
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Anuj Mittal <anuj.mittal@intel.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20211124150928.11645-1-anuj.mittal@intel.com>
 <16BA84AC7B404D44.11456@lists.yoctoproject.org>
 <3cf9ec30-d44f-f35d-fbb2-d118e3e2d5f8@bootlin.com>
 <e413eb962e1590f491545eb7a6a69150073bdaee.camel@intel.com>
 <16BABE59A5C6D1ED.15594@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <799e6279-6d9d-d65f-057b-e871deaf7143@bootlin.com>
Date: Mon, 13 Dec 2021 16:45:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16BABE59A5C6D1ED.15594@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Dec 2021 15:45:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2245

Hi Anuj

On 11/25/21 9:58 AM, Michael Opdenacker wrote:
> Hi Anuj,
>
> On 11/25/21 3:04 AM, Anuj Mittal wrote:
>> On Wed, 2021-11-24 at 21:57 +0100, Michael Opdenacker wrote:
>>>> Many thanks for these updates!
>>>> Just to be sure... when do you expect me to merge these changes?
>>>> Before the release so that everything is all set in the docs when
>>>> the
>>>> release is out?
>>>> Or right after the release is made so that the docs don't refer to
>>>> a
>>>> release that is not available yet?
>>> I guess that the second option (waiting for the release) is the
>>> correct one.
>> I think we were until now following the first approach. But yes, the
>> second one is probably better and correct. Should I send a v2 after the
>> release has been made?
>>
>> Thanks,
>>
>> Anuj
>
> Thanks for confirming.
> No need to modify your commit this time. I'll take care of it.
> Next time though, you could just have a title saying "update for
> release..." instead of "prepare for release".


Done now. I actually had to implement the patch again.
https://git.yoctoproject.org/yocto-docs/commit/?h=honister&id=a6b10a8e2491e284e7faf439fa196605ddf40943
(honister branch)

This was also an opportunity to update other branches with respect to
available releases:

Hardknott:
https://git.yoctoproject.org/yocto-docs/commit/?h=hardknott&id=3d0b9af776cd278ca2cb86de9a4aaf0d7ddfa87a
Dunfell:
https://git.yoctoproject.org/yocto-docs/commit/?h=dunfell&id=77db6738d58ba4bdc68deb74775c00a332fcc86c

And Michael Halstead took care of master:
https://git.yoctoproject.org/yocto-docs/commit/?id=7d503d765f5a8ade226c897a17aecd0856104af1

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


