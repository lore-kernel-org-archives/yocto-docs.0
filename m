Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B90EE77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 14:49:16 +0000 (UTC)
Received: from dormouse.elm.relay.mailchannels.net (dormouse.elm.relay.mailchannels.net [23.83.212.50])
 by mx.groups.io with SMTP id smtpd.web10.107054.1734533348923300443
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 06:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=hZfIUtIA;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.50, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 55D17781B12;
	Wed, 18 Dec 2024 14:49:08 +0000 (UTC)
Received: from nl-srv-smtpout3.hostinger.io (100-101-209-155.trex-nlb.outbound.svc.cluster.local [100.101.209.155])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 67F4D781DD4;
	Wed, 18 Dec 2024 14:49:07 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1734533347; a=rsa-sha256;
	cv=none;
	b=wglN13iq5YzJzk+yui/0HdbuEf4HfKjE2pOcq1xBnlLwa3+MsoxDaxPIvdg12/Y2pjuBQG
	SJUIcN8uVAJ2bZGuMojjyc4fwcm43jwhxsGaVGziWJaBp/Y6HVQUgtmixi0tuuQJ+qyRaM
	dohtSQAAyY5EAk/QGDDeRtcnNhTCLAuVqFb0r8ePZKw3kAEW4T/F2iYJMl0EufODOKwCz0
	LfFccCGhN3aA41QsX5OrVvpHiflAA9+eua0vKkpSlY9Rb7bWrN9H6K01vtR6jYu7CB3cPV
	2Rt7nvragVnYCAZXY+A/WMsLfILF9jVZT7Wja/FCKsnIrGrEgUE2A/29x76kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1734533347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=P0iHSHlbEqiphl7dtDbZ1E8bJqV3emWHgioAR0j8tqo=;
	b=qAA4AfcOoMrefMHPY74Szi3l3iMtN+tlqtqG9DE9PD2rPcElJuRfHwFEX5rfeoF7YPopit
	Xj2kcoiL5npf8vDsKzc6p6zQh9Kd8UbV4l49eZ6f7O8bJ6zIgvyHjqNxFOnewhIzLVCTMG
	q/xXmAVpO6CYff+Uh4fBiCkI7QjkgnZTRo4RXjzMFrEuqBM0afFfG6bC9mLeHDk6+JE7u6
	OwTOzuI0pxz0qz9jIfkBOOMkgpSpCaMPzNmBgEFo0nySuZyLLqzstQBEoPm7rQg5mL3OZz
	uG+RKI9+wClVc12ptyWMj3LTTa6R472V/nUZJwmCpCcXAUzI5NxMsUePs+6cmQ==
ARC-Authentication-Results: i=1;
	rspamd-75d677f4fc-gt2vv;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Stupid-Lonely: 178aa22055a0cca3_1734533348114_985455846
X-MC-Loop-Signature: 1734533348114:2032145848
X-MC-Ingress-Time: 1734533348113
Received: from nl-srv-smtpout3.hostinger.io (nl-srv-smtpout3.hostinger.io
 [145.14.159.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.209.155 (trex/7.0.2);
	Wed, 18 Dec 2024 14:49:08 +0000
Message-ID: <f34239d6-de6e-485d-8d30-9c09d8d22e97@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1734533345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0iHSHlbEqiphl7dtDbZ1E8bJqV3emWHgioAR0j8tqo=;
	b=hZfIUtIA2XsL0CQK1fERMqs/AxSG9e+GKDrgidDfeR4G+RcVNqa6PoCigOQ82lLSSCItTK
	aANL1EpJYdaUGonmOHPA0aM7zPRNsJFIoz946YDoG9h36gtPIOG6B2mtdk/eMfTmwTMPxc
	f2uTQtu3Vb/vG+5L71I8dKzPxjehCZOt/zdRQ6gxgi+y1tYjrvAXq5X8qIgk4uicFCSCdN
	TItty4XfRVEA627isjv9kKanZMtjfr6LI4Cm2opTVj46YHKzx1Hg6fZpGI61+DQC9KgxRs
	hzTHbZM1sOXuKUgOjr3CqiKSZO6Q6wup1X6I4UVsai1Kbdo2Ss79cB/9fNsCBw==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [docs] [PATCH v2 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
 <20241204104432.2094236-4-michael.opdenacker@rootcommit.com>
 <D62WT5QAFUR4.22N91K2Y793BO@bootlin.com>
 <7e870aa5-9a3e-49bc-96ab-c850e31c93e5@rootcommit.com>
 <D6EQ3517THNQ.30JL51D1JWVN8@bootlin.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <D6EQ3517THNQ.30JL51D1JWVN8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 18 Dec 2024 14:49:04 +0000 (UTC)
X-CM-Envelope: MS4xfAbQVVEJHzAvSizMdp2gw1Czpc9V58yfBpevgriaU/lhu4ntJpjyMmcpYym1hTApkat/rtTmVEEzeaQPI9/WwruTxLCJ19E57+XscvGiXFWqrHey02BS QEWUtWeUARIF8PEEXymh+wFmT/oaMmIfD6Db5rL+lfTecuaIGCdI0+kEnv4hgdNmEdvMTQCP2RTaAufo9rzzuLDt7UcyA0unTdkqc/7z1iw78b9TvfQJOiIS 7OqCxQF4StahKPSNrHhAbDYvgOf2MCYtb/mEi+LWx8RbUwmV7oDGc7EsNSlFN+16hNon2BQx/N062t0e/fbYFtx7FD7hQWEAi9XDRP8/2jLqO2Rrkfgm4Mqt v8QVKS1SsDmX3duhR+BN6IFEd8wIzWJgMCN2FDeXvqYlI5GpgUJgK4/LUafK25PGoInjytzf
X-CM-Analysis: v=2.4 cv=c/P5Qg9l c=1 sm=1 tr=0 ts=6762e0e1 a=gK8Kn/iQ+cr19mtFy27wxg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=iGHA9ds3AAAA:8 a=oks1SR_PK36ZUTmGitwA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:49:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5981

Hi Antonin,

On 12/18/24 10:35, Antonin Godard wrote:
> Hi Michael,
>
> On Wed Dec 4, 2024 at 2:03 PM CET, Michael Opdenacker wrote:
>> Hi Antonin
>>
>> On 12/4/24 13:19, Antonin Godard wrote:
>>> On Wed Dec 4, 2024 at 11:44 AM CET, Michael Opdenacker via lists.yoctoproject.org wrote:
>>>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>>>
>>>> - Remove duplicate instructions
>>>>
>>>> - Detail how to run bmaptool directly if you installed it on your host
>>>>     instead of building it through the ``bmaptool-native`` recipe,
>>>>     as running "oe-run-native bmaptool-native bmaptool ..." won't work
>>>>     in this case.
>>>>
>>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>>> ---
>>>>    documentation/dev-manual/bmaptool.rst | 12 +++++++-----
>>>>    1 file changed, 7 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
>>>> index 37083c9c64..93c8d3a45e 100644
>>>> --- a/documentation/dev-manual/bmaptool.rst
>>>> +++ b/documentation/dev-manual/bmaptool.rst
>>>> @@ -43,14 +43,16 @@ any type of image. Use these steps to flash an image using `bmaptool`:
>>>>       depending on your particular setup. The following commands assume the
>>>>       image resides in the :term:`Build Directory`'s ``deploy/images/`` area:
>>>>    
>>>> -   -  If you have write access to the media, use this command form::
>>>> +   -  If needed, set permissions to get write access to the media::
>>>>    
>>>> -         $ oe-run-native bmaptool-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
>>>> +         $ sudo chmod 666 /dev/sdX
>>> I think you forgot to change to "a+w"
>>> Also, it wasn't moved after the sudo command?
>>>
>>> Looks like the wrong patch may have slipped in? :)
>>
>> Right, I messed things up by modifying the second commit.
>> A V3 is coming, thanks!
> I did not receive it the v3, not sure you sent it? Just want to check whether
> I missed it or not.


Oops, thanks for the reminder. I believe I had sent it, but indeed, no!
Done now.
Thanks
Michael.

-- 
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com/


