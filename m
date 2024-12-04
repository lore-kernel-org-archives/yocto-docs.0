Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E2DE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 10:31:13 +0000 (UTC)
Received: from silver.cherry.relay.mailchannels.net (silver.cherry.relay.mailchannels.net [23.83.223.166])
 by mx.groups.io with SMTP id smtpd.web11.10818.1733308270937082863
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 02:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=T+qe+Znh;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.166, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 301A4C34AA
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:31:10 +0000 (UTC)
Received: from uk-fast-smtpout4.hostinger.io (trex-2.trex.outbound.svc.cluster.local [100.122.112.131])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7F643C2A9A
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:31:09 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733308269; a=rsa-sha256;
	cv=none;
	b=4qW6RpR+6OT+Qxq1USt0+kYfOJ46PpRMjuxQUWTVfv7MeFT+VuKGUw707TJnEr5yPMk8vu
	QpG9vhaZYarkStnn4Fi8TuMBjQSZ2hFNY+wGX3bQJAn29AwzO2OEiOpEpbUjjT0NoynUbZ
	AVTuk0NubkEbWISA8FQzXJeMjly3Hg3D5mIG3oZPF0O9fEXFRawTh7tY+0IpUsDHZmtyu9
	iGPnKFYtsshNs9NJ0iyJ7J3rEuDOhYumSAi4Jieaw39mQ/nKxR7F8nskqnU+pmQpFTHed/
	9j58fxe7QQ7wJPhrD8TEfr+CRI1Xi+0EYwuypaEP9qNC/5c1ZStJ+MrbQZRa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733308269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=cXCxv7c2pVE6ovtTjGqRZC+rEI/v0G2hf4fXnYD9ahE=;
	b=YLeaobP5MPlIbaqcXEgaPWBJUnc8J9ZQOBQvbtq5h8CueV9oOUfePwjMvB26haVm4QGF9c
	A/Cvtj4J4Gpw2mSYor1j27ddTMjCZnKXibL2EY+Rr6RwpCvfRG82I5ojfgV5gt2jTRJXCH
	8KyNYT+r83mhd7J38biibMqUDJipck/rR3kgWbRf4cZjcWvOP6eKOywWwnkI5TJLAvvXUq
	lQkwX+Z2/+cgbLmuHLh4X+zzqJ7nMfFw0ckCMMOQP6htM+3NBulHuk2D88SZIaowY7f3FV
	QutKbqR1wRAKH3G476Jlxt761V28MhRG2/0mljQ40SKQVyH4ndJG4EIiVfhgWg==
ARC-Authentication-Results: i=1;
	rspamd-5d9d86ff64-9hjdz;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Wide-Eyed-Shade: 096174145d991aa1_1733308270024_2629676845
X-MC-Loop-Signature: 1733308270024:3988702430
X-MC-Ingress-Time: 1733308270024
Received: from uk-fast-smtpout4.hostinger.io (uk-fast-smtpout4.hostinger.io
 [31.220.23.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.112.131 (trex/7.0.2);
	Wed, 04 Dec 2024 10:31:10 +0000
Message-ID: <b10002a9-e9dd-4ab1-9cdb-312db5df9509@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733308267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXCxv7c2pVE6ovtTjGqRZC+rEI/v0G2hf4fXnYD9ahE=;
	b=T+qe+ZnhaaNI7YseP5qPEqYftEPwC4v438fWbiookO4YXkJAsntdCTtmYC+AbYJDSdxIpn
	cv9oBtIIkNpfRGq3c5xX1ED2fREvpNT1FpI3FEsUO4Rop82UD4WuLWt5BEAYL24yLhL6Rr
	CqLF6z6fVrYMTnV4air9nQcjfON5pxZTA8H67HYfOequ8PlYAsmCJGjohFl7UBvJdJlO5D
	jXAwIIgPrOYADJLiYFbiYalAFaVeYyVKrX3XkZly5/Mq3Jx09kaOb3II5p/mZTnirLfuDF
	mFOlJCc3J/AcXYapvJ4v36j5keljX0f6jnjy7HOZF/MtJ1WhbQTxRoVu1YCKHQ==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [docs] [PATCH 2/3] dev-manual/bmaptool.rst: add missing command
 for bmaptool-native
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
 <20241201173801.3290796-2-michael.opdenacker@rootcommit.com>
 <D613DDACPBYI.1YDZEEN2GB07L@bootlin.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <D613DDACPBYI.1YDZEEN2GB07L@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 04 Dec 2024 10:31:07 +0000 (UTC)
X-CM-Envelope: MS4xfH3Y7sLBSym6c9FH5Yp4SIY1DdwFmNzQ3s4SkQ4A/RmoW8BQvu/Ky16prkWLamRdSiSC9bUYKu0NKN1+9iQZijMBSqftzM6gkguSZBnW2hN9ImBHZBPf 6izr4HBsmj70Zo0g6yYBPciTXpFba5FLdktbBTegAp4E8XNpgZYqmu15r7aPY9eVmp2IO/d5df2P0JhiAqdNR5xTZ5CqpX9VXKjY7Fhh4xGGAv2qWyJ+d5K2 UIrbyDe6LKqDlTvjWKH+0Twy9YMFpP6fkeVIFnyztL3zz9lmgJkAI7oVuVE2CuLGD4dyD1mX8G+8Q3tMswGJViOdiy2jFHm5JKtqiFSRg2lVmuCCKbKwBMHq STvWTc5Y87D3DY72WT4NHXGoDAChvAMpQ+9MSuV3wSdxdXZTjqqqZAXLJ/wWefGJbPbxa4E5
X-CM-Analysis: v=2.4 cv=eteNzZpX c=1 sm=1 tr=0 ts=67502f6b a=3JjwsiTUxCxireyYQgRi/g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=iGHA9ds3AAAA:8 a=QmbNzofzKJOMjQ8muLAA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 10:31:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5875

Hi Antonin

On 12/2/24 10:02, Antonin Godard wrote:
> Hi Michael,
>
> On Sun Dec 1, 2024 at 6:38 PM CET, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>
>> Otherwise, running "oe-run-native bmaptool-native bmaptool ..."
>> fails as follows:
>>
>> Error: Have you run 'bitbake bmaptool-native -caddto_recipe_sysroot'?
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> ---
>>   documentation/dev-manual/bmaptool.rst | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
>> index 493abf7607..5fc46c7792 100644
>> --- a/documentation/dev-manual/bmaptool.rst
>> +++ b/documentation/dev-manual/bmaptool.rst
>> @@ -23,6 +23,7 @@ system image files much faster.
>>         need to build `bmaptool` before using it. Use the following command::
> s/command/commands/ or see comment below
>
>>   
>>            $ bitbake bmaptool-native
>> +         $ bitbake bmaptool-native -caddto_recipe_sysroot
> Isn't running `bitbake bmaptool-native -caddto_recipe_sysroot` enough? I
> would say addto_recipe_sysroot implies building the recipe, but I might be
> wrong!

Good catch. Indeed the second command is enough.
I'm preparing an update.

Thanks!
Michael.

-- 
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com/


