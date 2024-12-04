Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED82BE7716E
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 13:03:53 +0000 (UTC)
Received: from butterfly.larch.relay.mailchannels.net (butterfly.larch.relay.mailchannels.net [23.83.213.27])
 by mx.groups.io with SMTP id smtpd.web11.13443.1733317429026029050
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 05:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=onLHgDiI;
 spf=pass (domain: rootcommit.com, ip: 23.83.213.27, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 31DE4C22FB
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 13:03:48 +0000 (UTC)
Received: from uk-fast-smtpout4.hostinger.io (100-127-102-245.trex-nlb.outbound.svc.cluster.local [100.127.102.245])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7616AC268F
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 13:03:47 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733317427; a=rsa-sha256;
	cv=none;
	b=hJObNDv5LJOHOD1w6+fxMA7+CHCwsuHq7ptTuz944xCSA1q5MZTADNtpTZqyFejov4YPC5
	C7US5qB0D9ui7BpfTIJVOPc/TAiNvL20PFdQheSS4guLqdRCR/FExm+QSdlZP2dvypuG8X
	Kt/dFUFYIcbZ21CdcdQDHVf0c+zUE86FI6KkW8XZIfYRCH/c5KqvvtLfdhjaUrNw76cKw0
	MeaDmlItqAhTQ0lE5UL698W/D/k1hddRRUPC6gXtbBOzfWhyS4UXZGBhh0SfUMPhFM+1Ld
	vYjVB1AnmuGVtSk8YBhoQG2gItTNMufZf4sSon2hB0QYsPhF68DcgP9ZhFZqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733317427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=OzGxbsh3ht1j5T+QQ4jhYE7vhqzKdC0DW/EHT2rUL/U=;
	b=S+anDnLPr6fTR5EWJ/uJOHu/6A3W1pao4HED6QNb1QDtA5JAHdq7TIEf7kdiCvA1lIFazL
	H36UQKWLjo4u0UQV7mjKA7vYWYH4SrXLRvqZDbq29Bjtv9v1+gxVXKTRhJvrPRhYpuq8k/
	ghTyyPXPzaeZrQI5iCidFa/5Ay+Fhx0Q5wYH3yDNeLC5j53/jpStX/zQIkkvuMK82gW3OH
	7X6v5l5E/fOhDCuI6V0m4yOg2NUuOHpGqspty0U0q0hkQKu2lIb3halDfZ3b0n4b9UarMH
	iej5QFj/BftTdtu3Kqg5ND8WxxTmXUI+iGKegfZW5QVDQtM91waIBWH//DkMZQ==
ARC-Authentication-Results: i=1;
	rspamd-fc7fd4597-5vhlc;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Good
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Soft-Stretch: 5acc04163e1362a1_1733317427971_4022073916
X-MC-Loop-Signature: 1733317427971:608349407
X-MC-Ingress-Time: 1733317427971
Received: from uk-fast-smtpout4.hostinger.io (uk-fast-smtpout4.hostinger.io
 [31.220.23.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.102.245 (trex/7.0.2);
	Wed, 04 Dec 2024 13:03:47 +0000
Message-ID: <7e870aa5-9a3e-49bc-96ab-c850e31c93e5@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733317425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzGxbsh3ht1j5T+QQ4jhYE7vhqzKdC0DW/EHT2rUL/U=;
	b=onLHgDiIZLieN43C9qT+uHk5x+3YJS/0FHrkJaeOHGzcSrcZ3a3FI8oPzCZ/8Tr38z1SS9
	aVHJo8TT6a7WbsLRXUVO7/NoTpLt7yYNyCwRYS+N6eosF3CsPkjIfPsZi/XW/Iv+0MjWAc
	BneDsY7aBkzcChG3h9lgRvRGqnaeQAUg+vE+P7HyzieGL7Pa8w4SK+Qe1f5s85H0TtF+y5
	YkpV5aVcJo80jcHwKGaRfFltCWLO74nDYWuZ9M5bgfV/YxzyqTpTCrJrEMpx4zdzs9ec+f
	NAC++8flje/PLkOPvO0+HKQhD8xlboUtuNUhbQnaBGk6eB1fG4jjzpZB9HRPAg==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [docs] [PATCH v2 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
 <20241204104432.2094236-4-michael.opdenacker@rootcommit.com>
 <D62WT5QAFUR4.22N91K2Y793BO@bootlin.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <D62WT5QAFUR4.22N91K2Y793BO@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 04 Dec 2024 13:03:45 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=eteNzZpX c=1 sm=1 tr=0 ts=67505331 a=We5kXu/wiLUOQYnlJMN+HA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=iGHA9ds3AAAA:8 a=tBrc6RcEi0VwbyDf6C4A:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-CM-Envelope: MS4xfMd6VvJ2BD9fWTgz6GP5k8csGsEAyQaNdMn/NU/mtOX6+SH2we1YvwcBYSnE5G+jEulNJn706JIXfdILrWsMaUbbV8wVE5b7MmPBWXzP98GwCSkk9VX2 kLQI1QGT8d0apz4FHO9hkg/GNEvyPDZrXjvwrvSsaPaDyz0KiFc8In6D3n0Y/Rz/R4Xo5xgI6vjhDMECS5RPpMG3igeyRNOtTxJvBePRBuMO1FvjVJeGg16t 9jcPv4HXW15/wwP3y7nnqufiwjpXpEvi0HYNg19RcK9KMHqrVjiw5mZAW7ORZbBDzuGhArTkeq+bY6iszkisCYe5SN2WKcgkC0wFR5mRcNYlwe0hAYMLtpoE i0MoYXC3dpwmTXEW5n4xHCFCgoTS1f0DK6YJ9poZr/eoisOgBawzpZU1EaH3O3nHl/Oz1trT
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 13:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5888

Hi Antonin

On 12/4/24 13:19, Antonin Godard wrote:
> On Wed Dec 4, 2024 at 11:44 AM CET, Michael Opdenacker via lists.yoctoproject.org wrote:
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
>> index 37083c9c64..93c8d3a45e 100644
>> --- a/documentation/dev-manual/bmaptool.rst
>> +++ b/documentation/dev-manual/bmaptool.rst
>> @@ -43,14 +43,16 @@ any type of image. Use these steps to flash an image using `bmaptool`:
>>      depending on your particular setup. The following commands assume the
>>      image resides in the :term:`Build Directory`'s ``deploy/images/`` area:
>>   
>> -   -  If you have write access to the media, use this command form::
>> +   -  If needed, set permissions to get write access to the media::
>>   
>> -         $ oe-run-native bmaptool-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
>> +         $ sudo chmod 666 /dev/sdX
> I think you forgot to change to "a+w"
> Also, it wasn't moved after the sudo command?
>
> Looks like the wrong patch may have slipped in? :)


Right, I messed things up by modifying the second commit.
A V3 is coming, thanks!
Michael.

-- 
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com/


