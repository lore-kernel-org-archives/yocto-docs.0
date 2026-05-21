Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F824CD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 15:13:07 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38972.1779376385490242662
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 08:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 64LFD4ui3737419
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 10:13:04 -0500
Received: from [192.168.2.90] ([192.168.2.90])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 64LFD3kc016652
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 10:13:04 -0500
Message-ID: <90821be7-12b0-4cb1-a2d8-dfef836abd5e@kernel.crashing.org>
Date: Thu, 21 May 2026 10:13:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] I am confused by the combination of using "?=" and an
 override
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <18fea83f-44b6-2034-cb65-93044c010c14@crashcourse.ca>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <18fea83f-44b6-2034-cb65-93044c010c14@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 15:13:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9518



On 5/21/26 9:40 AM, Robert P. J. Day wrote:
> 
>    I may have totally misunderstood something basic all this time, but
> this seems like something that needs a clearer explanation if it's not
> explained forcefully.
> 
>    In a current build, I set a debugging variable thusly in my
> local.conf:
> 
>    ST_OPTEE_CORE_DEBUG = "y"
> 
> assuming that any ST-layer processing would honour the fact that I
> explicitly gave it a value. However, when I checked the eventual
> value:
> 
> $ bitbake-getvar -r optee-os-stm32mp ST_OPTEE_CORE_DEBUG
> #
> # $ST_OPTEE_CORE_DEBUG [3 operations]
> #   set /home/rpjday/BOARDS/nexus/wrynose/build/conf/local.conf:14
> #     "y"
> #   set
> /home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:37
> #     [_defaultval] "y"
> #   override[stm32mp15common]:set?
> /home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:38
> #     "n"
> # pre-expansion value:
> #   "n"
> ST_OPTEE_CORE_DEBUG="n"
> 
> 
>    Huh? That output clearly shows that I set the value first, but it
> was set back based on these two lines in that file:
> 
> ST_OPTEE_CORE_DEBUG ??= "y"
> ST_OPTEE_CORE_DEBUG:stm32mp15common ?= "n"

The above is saying that the _override_ value:

ST_OPTEE_CORE_DEBUG:stm32mp15common is set to "n" if not otherwise set.

The override (stm32mp15common) is always processed separately after the override 
value itself is established.

> Apparently, even though I set the variable myself, that override
> assignment was setting it back to "n" -- not what I expected even
> though that override was in effect.
> 
>    On a hunch, I used this assignment instead:
> 
> ST_OPTEE_CORE_DEBUG:stm32mp15common = "y"


So if you do:

MY_VAR ?? = "y"
MY_VAR:MY_OVERRIDE ?= "n"

The system will process it as:

MY_VAR = "y"
MY_VAR:MY_OVERRIDE = "n"

<process overrides>

MY_VAR = "n"


So then if the user sets:

MY_VAR = "1"

same sort of behavior:

MY_VAR = "1"
MY_VAR:MY_OVERRIDE = "n"

<process overrides>

MY_VAR = "n"


So in order to affect the variable MY_VAR:MY_OVERRIDE, you need to specifically 
set that.

This is the reason your change above worked.

> and it worked:
> 
> # $ST_OPTEE_CORE_DEBUG [3 operations]
> #   set
> /home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:37
> #     [_defaultval] "y"
> #   override[stm32mp15common]:set
> /home/rpjday/BOARDS/nexus/wrynose/build/conf/local.conf:13
> #     "y"
> #   override[stm32mp15common]:set?
> /home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:38
> #     "n"
> # pre-expansion value:
> #   "y"
> ST_OPTEE_CORE_DEBUG="y"
> 
> 
> That is *not* what I expected -- I thought that once I assigned a
> value to that variable, no combination of "?=" or "??=" assignments
> could affect it, but apparently I was wrong.

You have to remember override variables are themselves variables.  Overrides are 
processed _AFTER_ all of the values are established.

>    Is this the expected behaviour? Because it caught me by surprise,
> and if this is the way it works, it definitely needs to be documented.

Yes, this is expected behavior.

> rday
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9517): https://lists.yoctoproject.org/g/docs/message/9517
> Mute This Topic: https://lists.yoctoproject.org/mt/119425911/3616948
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

