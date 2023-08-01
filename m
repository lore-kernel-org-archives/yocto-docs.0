Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A384CEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:51:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.7758.1690876286935325439
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Aug 2023 00:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dciSm5K0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6473240002;
	Tue,  1 Aug 2023 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690876284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fvwlEti+dkfT5KF4JfP00Schrsx4qNrw0QhpPkkDIQ=;
	b=dciSm5K0e62X1M1Hz0Uls4mMVqLljiPTwkngNqZB6QBOGOJ0B4PM2y8AMCefFZ5625VLzm
	iPWfHk6QIG0T7gvmoAU0Juc+jnHnP7QuOSGbDuD74J7oXyEuOdL3nQ5amy7FWu5+F2408v
	5sgdHekWHDzw1HG+zbVycoTciKR0KN25AW8Fixyfj/j8s4tVtRPL3k2ET0jP7POBTJmB7X
	W6GayrSq5OVM7DgLO7k/7BMLUz3npzkIAFQeBS8xpo57LCR3uTPRAbP8bZ34qpfowIx+EY
	qolEWon4DaxT7qcDYroIPax81/3dFr1jDbVAflZ0AtV1qGhEQ0zhaob+YCf2hg==
Message-ID: <7871540b-3d52-3f6b-c416-db973dd6467c@bootlin.com>
Date: Tue, 1 Aug 2023 09:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
Subject: Re: [docs] Updating the list of sanity tested distros?
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1fdd238e-b14b-6f85-db68-07eeea3e2726@bootlin.com>
 <d2220020c5bacc6086be6417c43f6555d7283749.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d2220020c5bacc6086be6417c43f6555d7283749.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Aug 2023 07:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4095

Hi Richard,

Thank you for the explanations!

On 29.07.23 at 00:28, Richard Purdie wrote:
> On Fri, 2023-07-28 at 20:41 +0200, Michael Opdenacker via
> lists.yoctoproject.org wrote:
>> Greetings,
>>
>> As far as I understand, the list of distros that the Yocto Project
>> supports (or should claim it supports) is the intersection of the list
>> of sanity tested distros (SANITY_TESTED_DISTROS in
>> meta-poky/conf/distro/poky.conf) and the distribution versions that are
>> still publicly supported by their vendors (as checked on Wikipedia).
>> There's no point in claiming to support a distribution for which package
>> updates are no longer available.
>>
>> Currently for master, this intersection is only:
>>
>>    * Ubuntu 20.04 (LTS)
>>    * Ubuntu 22.04 (LTS)
>>    * Fedora 37
>>    * Debian GNU/Linux 11.x (Bullseye)
>>    * OpenSUSE Leap 15.4
>>
>> Here are a few obvious absents here:
>>
>>    * AlmaLinux: version 8.7 and 9.1 are still in SANITY_TESTED_DISTROS
>>      but they are obsolete. I see an AlmaLinux9 worker on
>>      https://autobuilder.yoctoproject.org/typhoon/#/workers, but I don't
>>      know whether it's 9.1 or 9.2 (not obsolete unlike 9.1).
>>    * Fedora 38: important as Fedora 37 ends in November. I see a Fedora38
>>      worker, but there are still failed jobs, even though the majority
>>      are successful. When is a distro version ready to be added to
>>      SANITY_TESTED_DISTROS?.
>>    * Debian 12: we also have such a worker, with a mix of successful and
>>      failed builds. Is this version eligible too?
>>    * OpenSuse Leap 15.5, as OpenSuse Leap 15.4 expires in November too. I
>>      see a worker, but with only failed builds.
>>
>> I'd say that the most urgent one is AlmaLinux 9.2 as otherwise we don't
>> support AlmaLinux any more. The next ones for the end of the year are
>> Fedora 38 and OpenSuse Leap 15.5.
>>
>> Would you have any thoughts?
>>
>> I was about to send a documentation update to declare that master (and
>> probably Mickledore and Kirkstone) only support 5 different distribution
>> versions, but a longer list would look better...
> We keep seeming to discuss this but it is really quite simple, we
> document what we test on.
>
> We are currently testing on alma8 and alma9. I don't know which version
> of alma9 but I'd suspect the most recent one and we can check. We can
> list those until the workers are retired.


At least SANITY_TESTED_DISTROS says its AlmaLinux 9.1. I'm not familiar 
with this distribution, but since 9.1 and 9.2 look different (9.2 being 
supported, 9.1 not, see https://mirrors.almalinux.org/isos.html), I 
think we should make the difference.

Do you agree that the documentation should only advertise as supported 
the intersection of SANITY_TESTED_DISTROS and the ones that are still 
supported by  their maintainers? If we agree on this and it turns out we 
neither test AlmaLinux 8.8 nor 9.2, it means that we currently don't 
support AlmaLinux any more.

>
> With regard to the failed builds, the question is whether the failed
> builds are due to the patches under test or some underlying issue with
> those systems. They would not be in general use in the pool if they
> weren't able to build master so it is fine to document all of those
> there for master. I'm sure the failures are due to failures in patches
> under test at this point.
>
> The exclusion list for older releases can be and is different as some
> workers are not enabled for some releases. You can see the mappings
> here:
>
> https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py#n160
>
> i.e. mickledore is matching master so far and kirkstone isn't using
> fedora38 yet (for example).


Oops, I don't understand how you deduce this from this file. Mickledore 
isn't event listed in it.
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


