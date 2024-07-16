Return-Path: <matthias@pritschet.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4287FC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:49:49 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
 by mx.groups.io with SMTP id smtpd.web11.7020.1721123381010862826
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 02:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0002 header.b=VNknTh4V;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0003 header.b=SSeSlEVd;
 spf=none, err=permanent DNS error (domain: pritschet.eu, ip: 85.215.255.24, mailfrom: matthias@pritschet.eu)
ARC-Seal: i=1; a=rsa-sha256; t=1721123378; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ShXbQaWmt2nibNcYJEa38wxSUctrqSRG829j6AM6v3sYnvYbHb2jFIxMmbEU0ISCM2
    I6LU+XOZFDG/nn7+kdtmdW2S8WRP+rYQB+Kg2op/rxogoPL3OIIt8CdehHbZJM42GlVN
    pgLmIIPaAdMdA+lsWVKM69wR6FPqwamcTYzPo/5Pa+e4XacjSQ0b4Z7JHmy+HE8md8tr
    z2E2NfuYQcU2eFcvSSZ5rZZYIqv19VmmHgXXfvW/7JLiUj2GfRAvxwBH5+qnSzHKuuiu
    arolpbmTEUg5YMIaWR34S5sjRymz7FflQ7kRujEH9nRz3Itk4Z2tA0JPg8cnDIo98xnL
    Aysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1721123378;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=GUHbqx9Zyxr8LYHHNQaeR2VjTBY3ICOTE3g1ioezskc=;
    b=s9qAEtQhg3Va9D9xbNKLlXJ6kYSzJdLV587E9pXwK98oJayBGLVMXNjypLHUjHnWlj
    yXgbe+pZlb/VUbzRuOcKbbqmD/HNGg4zPvLElY0qdiRWsdETKN7JNH4Sn0daESI/wExJ
    CtFE5a76xNo+TTMQXctwU2iSzxB88+Z6ACIIAD0E+rfYgWGjblIFRsFdhLT2wU1O/mN5
    j1qt6UCjNVegsJqWpwOMrf4OPJKWfD+0nhgZshvSeL+dhxT8U9HZ4KkKN93uJum6fxnM
    3zswjJbEdRg0WNPcCAXGxPiMg0XeqIPyrLKfW41vsF9DnHZYuM/0vnnIk2/M8LMIC9hT
    RMRw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1721123378;
    s=strato-dkim-0002; d=pritschet.eu;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=GUHbqx9Zyxr8LYHHNQaeR2VjTBY3ICOTE3g1ioezskc=;
    b=VNknTh4VE2VwVbrM+faSSIp4udQ+epT9X19dbuGy3bOEYBAIIw2KWBrpGzukSzHWSw
    52rxXccDuOAphN6HPkTXgExJkmT5DYAge5H/S6JJPsVMPJMbAlPUQpgvFkOodNM1NT1/
    A2le8umA1BVv/QAnIpckkye8U1CbYt+BdNRuW3f6/WJA0wLqjMzk3fdl+4sawJwt2wkN
    Hs9ddqoXsz34T2S9OaCOqNubgwTDaG2MhJcSyJrdG/cLZOHp7XEa3HKfQAEBFtum93F0
    7hnJAKnCHjtLHh/cEW5rk8vqkEE5X6MOFyoqXYyQH3yaQIPqRnSt6Il7s8wAEYGOO1SF
    twCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1721123378;
    s=strato-dkim-0003; d=pritschet.eu;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=GUHbqx9Zyxr8LYHHNQaeR2VjTBY3ICOTE3g1ioezskc=;
    b=SSeSlEVdlZt0/Zlbr0FIllX0dnr+0+eWMb4zYpxp/CmjO44wHgzBWMPoQgNDBVR3pS
    mAXIUYSiXauPjwYihbAQ==
X-RZG-AUTH: ":IW0QYUiheuxX18P29qqHt/qCfjagLCCd1qyzKexpYhaWNz/0bob2EDzRYZodCEMR3QeuunJjXNtdCYjxsNmgEYTk/oB05tyHyzda9SJsuzU="
Received: from [IPV6:2001:9e8:31e0:5d00:5540:c84b:7078:70cc]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id Yd513e06G9nbET2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 16 Jul 2024 11:49:37 +0200 (CEST)
Message-ID: <a9eeebc4-9cd4-4d30-8af8-3225e554fcc2@pritschet.eu>
Date: Tue, 16 Jul 2024 11:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: fix typo
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
References: <20240714210908.3964010-1-matthias@pritschet.eu>
 <9506a52c-2d90-4889-b923-d66a124de971@cherry.de>
 <a83d7875-9faf-47ff-b786-698df9d3dd28@pritschet.eu>
 <0b7fe969-ced3-478b-9443-2d8a77e0b111@cherry.de>
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
In-Reply-To: <0b7fe969-ced3-478b-9443-2d8a77e0b111@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jul 2024 09:49:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5318

Hi Quentin,

Am 16.07.24 um 09:23 schrieb Quentin Schulz:
> Hi Matthias,
> 
> On 7/15/24 6:14 PM, Matthias Pritschet wrote:
>> Hi Quentin,
>>
>> thanks for reviewing.
>>
>> Am 15.07.24 um 09:45 schrieb Quentin Schulz:
>>> Hi Matthias,> On 7/14/24 11:09 PM, Matthias Pritschet via lists.yoctoproject.org wrote:
>>>> [You don't often get email from matthias=pritschet.eu@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> changed one letter (s/B/A), so the sentence is correct again.
>>>
>>> I believe we need your Signed-off-by here, c.f. https://docs.yoctoproject.org/contributor-guide/submit-changes.html#implement-and-commit-changes
>>>
>>> """
>>> For each commit to create, use the git commit -s command with the files or directories you want to include in the commit:
>>> [...]
>>> The -s option of git commit adds a “Signed-off-by:” line to your commit message. There is the same requirement for contributing to the Linux kernel. Adding such a line signifies that you, the submitter, have agreed to the Developer’s Certificate of Origin 1.1 as follows:
>>> [...]
>>> """
>> Ah, sorry.
>> To my defense: the -s was not mentioned in the top level README. ;-)
>>
> 
> Which top-level README?

I was referring to the command in https://git.yoctoproject.org/yocto-docs/tree/README#n19 , but it only occured to me now that the -s is part of the commit command and not part of the send-email command.
You can ignore my stupid comment above. Sorry for the confusion.

> 
> https://git.yoctoproject.org/yocto-docs/tree/README#n13 points to the guide I sent you yesterday.
> 
> Mailing list contribution is something not everyone is familiar with, so I'm trying to understand how we could improve documentation around it :)

As you might have guessed, this is my first contribution to a mailing list.
I took some time to read through the documentation because I really didn't want to mess it up, and look how that worked out... ;-)
Also, I just realized now that I should've had put you in Cc: of v2's commit message instead of using send-email's --cc .

It's all there and well documented and if things are unclear, there's always the IRC.
But it's just a lot of information to process and it's easy to forget little things once one is done reading.

> 
> Cheers,
> Quentin

Anyway, thanks for your patience!
Matthias

