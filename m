Return-Path: <matthias@pritschet.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5EEC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:57:31 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.163])
 by mx.groups.io with SMTP id smtpd.web10.7302.1721123847557339720
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 02:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0002 header.b=V3/8vfVM;
 dkim=pass header.i=@pritschet.eu header.s=strato-dkim-0003 header.b=TXmEaL+9;
 spf=none, err=permanent DNS error (domain: pritschet.eu, ip: 81.169.146.163, mailfrom: matthias@pritschet.eu)
ARC-Seal: i=1; a=rsa-sha256; t=1721123845; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EM6PPewyy4xeW2o9lNfAkCuv1j9E9Gs3JDLwm5K1DpYnevCAs/Lib5x8slzSN7WhPO
    dj6oAFU4qlAwJ4lAFoef5n+nsqnFNh8t+mdrCyaFz1+YgfOYUTcEA6k2a1MjHKsbtU9V
    wgnDjzzOQjSW8v0mtK5FXXQdLvQpanT5NHoqrFD8BPcGNUSCvO7PWGZFDomTdsQf5LL1
    613tmeSecMh8ebZLssYj4wRx5pQtUww5kAZF6GEV/W8+TIYWzj87kHq27dHcJTtUGUut
    Rkd5iQH9y4ZmEaubwvxocQ+u2Jb4J9FsAGMgCGa2bEcJ/pCNPvWOCX4riyXPE/23buJ0
    JFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1721123845;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=04wcxDvi8orl8qHnkXUARoSNv/epJVWrcgarfoy4q6E=;
    b=Jt3ZnGyPXkdMWdMAnrz7gkIAuwApsqqfprBOFB9Nkk6/29A228wmjvyC3mYpOvZkBL
    qNYqfxbFDbbKS+geJWaFgZY/uOX5WdmZMsEj7s9tXNkZVxQbeqNe7X6KBbXjZ/xgY1Mo
    SMpEwChCElN1ovZ9jVzMy5zon9y5DnsKJVwGN83JICxjogoUv8sTyvmFZhzYQpMZuTJF
    0EFko0TS7WOvbtQo3OybU+MYL4oPVUHEzV9zTV6A5T+1VFnRgacQNXYBwqo41Ws626+U
    ktpfsPDHauXOV+uPXTHTN7XnSNc8668+iK0h1w6DUSIin+neRhoYdulB2g51GqgLMTxy
    y0pw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1721123845;
    s=strato-dkim-0002; d=pritschet.eu;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=04wcxDvi8orl8qHnkXUARoSNv/epJVWrcgarfoy4q6E=;
    b=V3/8vfVMRTo1LmcC0mzzpPEYBs3BSzXP8Xiu741IvTdAozAsw3fQYMVjkHue5+2/Ku
    wCkDklkG6AKQeksgcQ/qx+zU3VzVupOmzW5Prnc4GoVWHDBq2Sa/R8OAHAw+w0DgROYr
    Zw6TmDxgBz/GciwfObXYzTY273aTrW3DRJpt/rXoskiZcG1ruI177nv3HdYCOyq/Ga5t
    GsG6DRdHEiui9RbH0ptOLhut8wcwlNmPHVFoJqWjThHT0gCo5rQbo/52Lb/7NThggUKR
    V6Lsir6y3eJj5C4A0lNNyvP2B6YEB9N1rOME37GM/bv1aOGP4p5U8cFADwVczJCLyEny
    D5Tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1721123845;
    s=strato-dkim-0003; d=pritschet.eu;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=04wcxDvi8orl8qHnkXUARoSNv/epJVWrcgarfoy4q6E=;
    b=TXmEaL+9Q6hhIvj+GbM/uUsWwllj/4YJnSXKQj98VrXwhyTmbDZoI2kd8Eody5FEka
    QK4fxSyWCQrVQZ1ltyDA==
X-RZG-AUTH: ":IW0QYUiheuxX18P29qqHt/qCfjagLCCd1qyzKexpYhaWNz/0bob2EDzRYZodCEMR3QeuunJjXNtdCYjxsNmgEYTk/oB05tyHyzda9SJsuzU="
Received: from [IPV6:2001:9e8:31e0:5d00:5540:c84b:7078:70cc]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id Yd513e06G9vPEWs
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 16 Jul 2024 11:57:25 +0200 (CEST)
Message-ID: <1e82b2fe-2fba-4c3b-95f7-d27ddaf27d51@pritschet.eu>
Date: Tue, 16 Jul 2024 11:56:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ref-manual: fix typo and move SYSROOT_DIRS example
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
References: <20240715162348.3984456-1-matthias@pritschet.eu>
 <710f1acb-55ef-4b02-b7a8-9af827c86c58@cherry.de>
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
In-Reply-To: <710f1acb-55ef-4b02-b7a8-9af827c86c58@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jul 2024 09:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5319

Hi Quentin,

Am 16.07.24 um 09:28 schrieb Quentin Schulz:
> Hi Matthias,
> 
> On 7/15/24 6:23 PM, Matthias Pritschet wrote:
>> [You don't often get email from matthias@pritschet.eu. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> 1. Changed one letter (s/B/A), so the sentence is correct again.
>> 2. Moved example from SYSROOT_DIRS_IGNORE into SYSROOT_DIRS section.
>>
> 
> Would have preferred two separate commits as they are related but not co-dependent changes. As a rule of thumb, when you need to list changes in the commit log, it usually tells you it should be split into multiple individual commits.

Understood!
I was briefly considering splitting the commit, but since the diff turned out to show both changes nicely I took the bold route.

I'll follow your advice next time.

> 
> I don't think we're too rigorous with yocto-docs so I would probably wait for the maintainer to provide their feedback on this (or silently apply it :) ).
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> @Alex, I believe you're the maintainer now? I think this should also be backported to docs of older releases?
> 
> Thanks!
> Quentin

Best regards,
Matthias


