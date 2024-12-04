Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD47E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 09:26:53 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
 by mx.groups.io with SMTP id smtpd.web11.9962.1733304408156971258
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 01:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=aa5w33zJ;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.16, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 53F61322232
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 09:26:46 +0000 (UTC)
Received: from uk-fast-smtpout4.hostinger.io (100-98-107-148.trex-nlb.outbound.svc.cluster.local [100.98.107.148])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A5FCE32162D
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 09:26:45 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733304405; a=rsa-sha256;
	cv=none;
	b=vGre6AvY2eEW3LFhyouWdkabAYsRtliCgSEyz4f0/fRwkOr7GjaGYFfLFGwiybvIv0rbH6
	t4euEJSX78AeBO0dFiKpxRMAAAql6Fmjh78BxCrDaW3Ih6CsZRwlYQxduMmdQafCV5gOYc
	17rpnzmCdwZxAos+nwmEPXbzMptWsETw46L7JoiklG8pXBpgGgEkzz505/ZGiZM5UPK33R
	7YiM1hNvj8RmZR5WL/jM/OrtYwz5q/m35DaTZtgpIsCtOeHpNGL3MCgN1xMilXHkEEHB6b
	HT21WaPimmB8YWFf6iXZ/SeAs+CtpPXU6dkIDhKmdIW9VO/CRF1DNUc05kQRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733304405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=7gjYUsx2GZVU2Fo0APDJh+WTol211pi2LXSh2S/kb8o=;
	b=WjmJxuFuvuGZAQNnRsR7/EAQ4k4fe2MK6T2iQXq8MebS7iB33hsUNMKqwMa5M8TEVmE90F
	+LFqR0LsRCKzcSgFutdDri/wyfqt5drDRXZy+ADCdtO2vr2TyEHpi/HuS2uQDZcJZEviNt
	ToCR+OBwQlkA2DtGEXYUPF0WAoU8CRPfvZ2Y+Wu9vR34olJ67uh6/z58MWNjfvDK7I0KdE
	w/Kb+g849btKl5bKpccCS8ENLi2v8l7xzFIAe09k+0I6Cf1sqFHWxdFmHYYhBlvd5YoF6h
	0bHoh8unyTNuQI6de0cBcax8WmPHucUvDUtz5jxzvFHoJ15rmjg6vQ2J2Ain7w==
ARC-Authentication-Results: i=1;
	rspamd-fc7fd4597-5vhlc;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Illustrious-Interest: 330bc00460c1f013_1733304406183_282469062
X-MC-Loop-Signature: 1733304406183:1474986775
X-MC-Ingress-Time: 1733304406183
Received: from uk-fast-smtpout4.hostinger.io (uk-fast-smtpout4.hostinger.io
 [31.220.23.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.107.148 (trex/7.0.2);
	Wed, 04 Dec 2024 09:26:46 +0000
Message-ID: <7fa75108-fb1b-4d62-babc-054888a076d3@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733304403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7gjYUsx2GZVU2Fo0APDJh+WTol211pi2LXSh2S/kb8o=;
	b=aa5w33zJrmQfbhMO7pbRXRpps2W8NPmgu6jMaQX6NKhBvxZRqN9N/g5RHhPdKGscgOvSfv
	NVmMvICaO8e8b2a3tKQ5YfaOzWZbtscnXgkmJPWnCh1R25f1zchDM6CTkaGusiLHCNfHJB
	/othGXmn6KziEV1/KgTXtAZTtx/SPp7XVq9Nlz5DlUmzXM7W3klXqN5ENspjGgZ/uW+NAr
	H78QF1d1vcuaBfonrkypf5r+581fkq62WJ0wCZfAzjUpjBc6KBR/59N0hReXtA5Ki1qQ3Q
	K2ST+jW1lZ9NBl4iJgJNNpliytdQZ5QyoGJCy76VI7ZNlSEH77hs4BArPrRuWA==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [docs] [PATCH 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
 <20241201173801.3290796-3-michael.opdenacker@rootcommit.com>
 <D613DE1UW3GV.OXCJKSG2VQH6@bootlin.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <D613DE1UW3GV.OXCJKSG2VQH6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 04 Dec 2024 09:26:43 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=eteNzZpX c=1 sm=1 tr=0 ts=67502053 a=3JjwsiTUxCxireyYQgRi/g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=iGHA9ds3AAAA:8 a=AX3aHfFBQQj1Pt0vwdEA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-CM-Envelope: MS4xfOh3jIY8lKUoSm3z1/CLvnU1FFoiQjB095HNs8DkjKHVFXbKpOnhplppkbkLnud5aOz4E4D7m244k8X55nuUq51DEQ8Nldal8s5qux6buSmmsxcpr2b3 lnl3pQzuPYtvdVIAfAsClw7W8g93iz1urtVgp0dF+xwnPd6FptBI0bTFEGIrG+i0OSsiq4LsxSQQvNXf8Ozmm5UBkyFw017NeN3JLewN69clqHlERHDMFaUt g+rwgFqr017NhRcsZZKT9teLNfJh7+f9J0OWXUo6VRnlG8RJeScygRZnrDsyN0/aaOG5/AOY3TnoZTP2MkxzS/aQ3azDf2XoSHIYABZtuGjni/7FrN+4ZIMU P0yfmqoUr2GhtJcnlFUZGiLrZ/LCmCfblmWDXX8y3sxDNQiradUE4ZGBfZiOjsHwbQU2ZMcy
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 09:26:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5871

Hi Antonin

Thanks for the review!

On 12/2/24 10:02, Antonin Godard wrote:
> Hi Michael,
>
> On Sun Dec 1, 2024 at 6:38 PM CET, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>
>> - Remove duplicate instructions
>>
>> - Detail how to run bmaptool directly if you installed it on your host
>>    instead of building it through the ``bmaptool-native`` recipe,
>>    as running "oe-run-native bmaptool-native bmaptool ..." won't work
>>    in this case.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> ---
>>   documentation/dev-manual/bmaptool.rst | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
>> index 5fc46c7792..e17074b65b 100644
>> --- a/documentation/dev-manual/bmaptool.rst
>> +++ b/documentation/dev-manual/bmaptool.rst
>> @@ -44,14 +44,16 @@ any type of image. Use these steps to flash an image using `bmaptool`:
>>      depending on your particular setup. The following commands assume the
>>      image resides in the :term:`Build Directory`'s ``deploy/images/`` area:
>>   
>> -   -  If you have write access to the media, use this command form::
>> +   -  If needed, set permissions to get write access to the media::
>>   
>> -         $ oe-run-native bmaptool-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
>> +         $ such chmod 666 /dev/sdX
> I know this was already instructed before, but maybe `chmod o+w` is a better
> practice and advice to give. What do you think?


I wondered too. Let's do it, I agree.

>
> Also I think this recommendation could be given after the sudo command, since it
> shouldn't be a problem to write to the device as root. I'm assuming the `chmod
> o+w` instruction was added here because oe-run-native doesn't run as root.


Right, this makes no sense to give this recommendation before "sudo".
My V2 will recommend chmod right before running oe-run-native.

Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com/


