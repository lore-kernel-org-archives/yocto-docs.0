Return-Path: <matthias@pritschet.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08CFC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 16:16:15 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
 by mx.groups.io with SMTP id smtpd.web11.815.1721060169513668311
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 09:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0002 header.b=iUsPdJJm;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0003 header.b=cX8ouELa;
 spf=none, err=permanent DNS error (domain: pritschet.eu, ip: 81.169.146.160, mailfrom: matthias@pritschet.eu)
ARC-Seal: i=1; a=rsa-sha256; t=1721060166; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eO9Gm1T1rNxzrT4vlOrV4PUpmRdO5lAebv8tDtvIVupKk7Q7RBwMGGoVfZnZT407Nu
    55qk9xUu3MX84YzsOfHadr0MnWui+YtbksswkvXypSUXypwO8X94tHAefWDHGSHi/mBh
    sPwXIiGnQWL9lMgJTzM3wljvnj81HfqVv1qnbXUKTm57XKxYfEU/SC2/FxZpkNpEpGYM
    TtQUUGBE4+tk9h0f5O4BP/+kXRZXvdSLj0NpnoLsQ7wvyEZrI7FedzVm0GKpbx5jEa6m
    rgU8D/9xMDLe3KQhHhdiV6Ltf9d3VGmnU0AlllbTdKZubnvgsfCq9ABZhHi3iJhcPmaS
    ys3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1721060166;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=dEtaQ/J79KwbaLQHwSHTbsCG+z4VT2ap5fDVVyJQtn4=;
    b=kUVX3wlGfOGFgsWwyn67luQeKMeMXAG2a+T0iOY9N3Kk5ufDjv79jWZGbCtDHmJu7s
    KlfzgE3G03jnbVJKU4flGuPdlvc7+UoYgJpEs5K0k1CWsp8SYZfhRzgvYOYq4rQlzpHS
    2FUcXztPFFjd2+12h7bCEVO6crpSQt1awNvh/AL/tsOCUkABg94q8j72MMCQdXBT9yeH
    H0zw/tPVY98K4hWvm2zzfnQpHq6cLKKuUBT7CpK1MfImEVxAqbysoVRh5sq5rLGfrKVD
    fS7Qd0ZJFumU+gMB+YDb1mj139gitPMc5AFlncdbA0y+NBZfg8vj2edsveuhez8Krgck
    HIiQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1721060166;
    s=strato-dkim-0002; d=pritschet.eu;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=dEtaQ/J79KwbaLQHwSHTbsCG+z4VT2ap5fDVVyJQtn4=;
    b=iUsPdJJmRIuRq5288CW32qKXZrUPbHxbK/1tcdsOIPhZGAevux5McP1wp5N9+eUcG7
    BE5xL6+xutf1GGrB8CJqdlzBcPYnCSh6+3D44Vc4Nw33bLTWD7XF0zKxX7DwpnJZLyED
    ZVA5sFHe4ykHVDw5qrZ0v4aES0Viz7uMrnm4KPxr2JYUlQK8hhnFqd9ns0aqe6L+fsIx
    7ev7wZYwgUz8Molm+SfeHHQqTXcf7VMl80EuMrxQ0IiWL+1Gxea0wclPeWl7Uih71yDS
    7y21gMlwo5+RXoCJFK2ZNOYSJcDT87oNCGrbJ7jy37DYlIlnG6VFjAvTTNh8dwwwDRiK
    pXmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1721060166;
    s=strato-dkim-0003; d=pritschet.eu;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=dEtaQ/J79KwbaLQHwSHTbsCG+z4VT2ap5fDVVyJQtn4=;
    b=cX8ouELasEERyyfiJT6vHTucyhjCDOOKQDhwALI98oY/IodegctwRiO/2oAB9O6mPr
    PVZybyWmSWen2pyZLsBg==
X-RZG-AUTH: ":IW0QYUiheuxX18P29qqHt/qCfjagLCCd1qyzKexpYhaWNz/0bob2EDzRYZodCEMR3QeuunNrXIo2JYyTyjDnn6hbxr7VOVlYWwET6J0aaaw="
Received: from [IPV6:2001:9e8:31d8:db00:66d7:9377:9f60:f1f6]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id Yd513e06FGG6Bn4
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 15 Jul 2024 18:16:06 +0200 (CEST)
Message-ID: <a83d7875-9faf-47ff-b786-698df9d3dd28@pritschet.eu>
Date: Mon, 15 Jul 2024 18:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: fix typo
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
References: <20240714210908.3964010-1-matthias@pritschet.eu>
 <9506a52c-2d90-4889-b923-d66a124de971@cherry.de>
Content-Language: de-DE
From: Matthias Pritschet <matthias@pritschet.eu>
Autocrypt: addr=matthias@pritschet.eu; keydata=
 xjMEYAvn3xYJKwYBBAHaRw8BAQdAsOZSUAnRUPv6AGvGQ0ZAK+f4+oZ/dN4SEeovDNQUo/vN
 Kk1hdHRoaWFzIFByaXRzY2hldCA8bWF0dGhpYXNAcHJpdHNjaGV0LmV1PsKWBBMWCAA+FiEE
 00KVu/VT2UO2HZzJFnwPi9kgHfYFAmAL598CGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQFnwPi9kgHfYC+AD9HmOmhjDzw4w3s3krqNIK27b2I0+LKa2X/bY1/K6e+5kA
 /i+F/3vj08bmDTnZsb+jgDv/Y7kAtekAurnjfg8KN08JzjgEYAvn3xIKKwYBBAGXVQEFAQEH
 QKxYz1KTA1tCZaa/oMtqDxJ7hk4/BxFEMYeWv5CYzC8aAwEIB8J+BBgWCAAmFiEE00KVu/VT
 2UO2HZzJFnwPi9kgHfYFAmAL598CGwwFCQlmAYAACgkQFnwPi9kgHfYfAgD/fqY6cuDXCHt5
 GFZJORkhFP/oKA9XUcjYtl+3M6zdiEABANfftDe3u7QXTaEyVS0Y6dG1Nwgw96mKzF/VIZot sTIB
In-Reply-To: <9506a52c-2d90-4889-b923-d66a124de971@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Jul 2024 16:16:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5314

Hi Quentin,

thanks for reviewing.

Am 15.07.24 um 09:45 schrieb Quentin Schulz:
> Hi Matthias,> 
> On 7/14/24 11:09 PM, Matthias Pritschet via lists.yoctoproject.org wrote:
>> [You don't often get email from matthias=pritschet.eu@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> changed one letter (s/B/A), so the sentence is correct again.
> 
> I believe we need your Signed-off-by here, c.f. https://docs.yoctoproject.org/contributor-guide/submit-changes.html#implement-and-commit-changes
> 
> """
> For each commit to create, use the git commit -s command with the files or directories you want to include in the commit:
> [...]
> The -s option of git commit adds a “Signed-off-by:” line to your commit message. There is the same requirement for contributing to the Linux kernel. Adding such a line signifies that you, the submitter, have agreed to the Developer’s Certificate of Origin 1.1 as follows:
> [...]
> """
Ah, sorry.
To my defense: the -s was not mentioned in the top level README. ;-)

> 
> I could suggest extending the commit title a bit to give a little bit more info, e.g.:
> 
> ref-manual: fix typo in SYSROOT_DIRS_IGNORE example
> 
Makes sense, fixed in v2.

>> ---
>>   documentation/ref-manual/variables.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index 848cea787..3709fca89 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -8618,7 +8618,7 @@ system and gives an overview of their function and contents.
>>            is just to show the usefulness of setting :term:`SYSROOT_DIRS`.
>>
>>         When a recipe ``B`` :term:`DEPENDS` on ``A``, it means what is in
>> -      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``B``
>> +      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``A``
> 
> Good catch :)
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> However, I also believe the example is for the wrong term? I think we should move the example to the SYSROOT_DIRS term instead as it's more appropriate. One can also write some example for SYSROOT_DIRS_IGNORE if there's a need for it. What do you think? If you agree, can you send a patch for that as well?

I agree with the first part and have moved the example up to SYSROOTS_DIRS in v2. (I hope that's ok)
Regarding SYSROOT_DIRS_IGNORE, I - being a novice myself - would say that it's sufficiently self-explanatory and there's no need for a dedicated example.
I'm open to changing my mind though. There are a few usecases in meta which could serve as example.

> 
> Thanks!
> Quentin

Thanks!
Matthias

