Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40B7C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 00:14:09 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web11.62613.1674692046185525212
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 16:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [172.31.28.27] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 40334803179DE;
	Thu, 26 Jan 2023 09:14:03 +0900 (JST)
Message-ID: <f6e45090-3a66-a066-7b89-f59a7c2b504f@lineo.co.jp>
Date: Thu, 26 Jan 2023 09:14:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [poky] [docs] yocto-3.1.22/RELEASENOTES
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 poky@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org
References: <8ada8dc6-fb4b-5042-9fce-d0926d422226@lineo.co.jp>
 <1003421ce4ffd0b93c7dabe3b2aa7c0b5c240746.camel@linuxfoundation.org>
From: Takayasu Ito <ito@lineo.co.jp>
In-Reply-To: <1003421ce4ffd0b93c7dabe3b2aa7c0b5c240746.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Jan 2023 00:14:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3622

Considering that the Security Fixes section lists CVEs whose status has 
been changed to fixed by this release, I think it is appropriate that 
this update to the cairo patch file be listed under Fixes.

On 2023/01/26 0:10, Richard Purdie wrote:
> On Mon, 2023-01-23 at 17:55 +0900, Takayasu Ito wrote:
>> I was checking the following RELEASENOTE contents, and the CVE for
>> cairo vulnerability has already been fixed in 2019 and the change in the
>> PATCH file is that the status of the upstream PATCH has been changed
>> from pending to backported.
>>
>> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.22/RELEASENOTES
>>
> 
> The patch was updated in:
> 
> https://git.yoctoproject.org/poky/commit/?h=dunfell&id=6e97ceb8586281a8d594a3a1ab9e303fd34e1d4a
> 
> which seems to match the change log and release notes? It wasn't just
> the patch status but the patch itself as well?
> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13007): https://lists.yoctoproject.org/g/poky/message/13007
> Mute This Topic: https://lists.yoctoproject.org/mt/96521866/3617373
> Group Owner: poky+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/poky/unsub [ito@lineo.co.jp]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Takayasu Ito
Yocto Project Ambassador
Solution Department Lineo Solutions, Inc.
https://www.lineo.co.jp/english/
Email: ito@lineo.co.jp


