Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B0FD2CDFA
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 16:14:16 +0000 (UTC)
Received: from antelope.elm.relay.mailchannels.net (antelope.elm.relay.mailchannels.net [23.83.212.4])
 by mx.groups.io with SMTP id smtpd.web10.22643.1729613647379982870
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 09:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=UQJjIWKY;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.4, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D4C462C5467
	for <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 16:14:04 +0000 (UTC)
Received: from fr-int-smtpout6.hostinger.io (trex-12.trex.outbound.svc.cluster.local [100.103.42.138])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4547E2C648B
	for <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 16:14:04 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1729613644; a=rsa-sha256;
	cv=none;
	b=B8qq4fGJUo8gm3RcxwsuBdVuCRzvtd5zUEAGr7em+ZRTwh5C3+F1F2l/C6nSw4LHuuJhpQ
	DDPguQiaizGeiqTg7ltGZrHoCSf//75NGu9J6XX/RQ+7iO0Wxt855hCV2Geyn3mdENvgI1
	MrBO8Ql4863Yere+oWy4NHqePKFeKgmSMwI15wKbxAM0G2eyWKWsGRmemFIXdgsHxv6bf9
	tSp+6BL8p+LGlNmNPz0S1XWICiwFtALwoE1IKEvCEAeujsrddK76g8dE54Bz79LETDjJ5R
	s5NFBy4Mpbcp1G9k14X61Cp4Z0tEkwna+p19EKGVdvYpEDj7gM+lemt5DMQ0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1729613644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=nPJp+lzxybs38BLPV1felXcoIFFl2yneT3kM1g7/IGc=;
	b=IeYgY1t5bIvgbJzOvZJHPuFATyxK6YJup/tF5CB86EHCijill96snbWQnGON2hCKJfRh9a
	7jq7g1orsifmGtklplQE5zzRM12B8azr90vnsT8X5KWU89Tn7gNXZeDB+BZOK87lLdPxML
	vW6F+3mg0DcgmA/H45u0o40eJ18mJjPiurnYhqXWoAfMpiJyhepYGbQaF0WwDz0lb8VHL0
	E7ZZ6bfGhFZuPVrP1oXSDmqQ87SApA0JeqzQIUJPZHu7yO4eZUxUU/g7se7c8rTyaOCV5a
	NwpaD7bsZADHi6qRSNySjUh+LL3dNQ8wTA16aJ6Z0CVP51/0E60zDGhFUoITFg==
ARC-Authentication-Results: i=1;
	rspamd-8d5b95c98-x2fdm;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Oafish-Oafish: 6a1c7e7a62b5d365_1729613644779_591396893
X-MC-Loop-Signature: 1729613644779:1374412883
X-MC-Ingress-Time: 1729613644779
Received: from fr-int-smtpout6.hostinger.io (fr-int-smtpout6.hostinger.io
 [89.116.146.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.42.138 (trex/7.0.2);
	Tue, 22 Oct 2024 16:14:04 +0000
Message-ID: <7e5d389b-cee8-4e90-9133-0d4ff50ca5d4@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1729613630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPJp+lzxybs38BLPV1felXcoIFFl2yneT3kM1g7/IGc=;
	b=UQJjIWKYkbuxfnKXxIaT0HUir+b1gv2Tb5Jrnl3j8mG+T5EFpUT2YiEbl+XwpM3WNallTE
	Sq+NemhBK3tVm0clezU91ELd/KlXiM1wNVHCKNzUiDMb16Roq+IE/qc/5JUbuAoaaXAPt8
	SmLjtJnUU4Sfk3tqOOJbRmhNfHrTMZ1QY08MahRGgmq9tOk5tY7HvLmWEdb0tqfp+3uq48
	0aS45lHkjzu50y6BHgFDa/SYeb2hEunZkxWh8HHjiJwVKhz+4RlfRMHDkODZiZZBfcyqBC
	6f8J4izWOkGR7Gv7h0jLqbzUH69TKkUblKo3fXrWVcHtss1qdS4PUlYuX0MRIw==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/2] ref-manual: release process: update LTS section
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20241022-update-releases-svg-v2-0-6e7740f9a41c@bootlin.com>
 <D52B130IVLTK.28FJTB79L17DQ@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <D52B130IVLTK.28FJTB79L17DQ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 22 Oct 2024 16:13:49 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Z6G+H2RA c=1 sm=1 tr=0 ts=6717cf3e a=izfhc+EirUGy/1yDy2FURw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=P-IC7800AAAA:8 a=d70CFdQeAAAA:8 a=0Do1yo1OC2sGFPRqdmoA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfEgLps7aUs/h7UubKdTY2DJS3u0Fur83qEHUpyMSFWRC6EiQzkmysgz21dSrlcXmJPv/IW3D0QP+Xhn7ZxVTUs8/l3T9jdqUWmCJ2+a+lVwCB6x3CC0p 4Wd4thO8MF+Zd3+CaU4EPJ8DZc9RnYEsPF37hvGWvGacO0xgGtAMBp8w/Al+qCO3p3I/cU1HhNaVtBJtxYdkooQ/uxoYcpZcUL8h9M6VPXSqhDuhsAmxD1sn hScRnRm11YMCw9WDGqcZGUqcx59W2hUnnKZmWONI7icYnTp4CXZjHv+eiT94mI1HwLQJyOmx0uEPB761I+SwTQJPxan0xnZkPuRzKMOnOFsQ3Ij+2Rv1O5vC RleMcMTVvGDuQek12YnUcGdBpEOEQVecMrqoEUzBJeMbJAOT1dBCLWRhJ0i2osr+4Iy0dVUzYQkPAe9jMMhssJZLKQAirocG4psZbMaCp/5Ep9odShZ9IYLU 1DuyEcxENOliDvmbyJkMb7ex0UduPsMruv5aHQ==
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 16:14:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5568


On 10/22/24 13:39, Antonin Godard wrote:
> On Tue Oct 22, 2024 at 1:03 PM CEST, Antonin Godard wrote:
>> Update the releases.svg file. Link to preview:
>> https://lufi.bootlin.com/r/VXPQ7d5NDt#kPjQDABd0EORG6GJCMG2U0IdU1+tGuUMHvWk8GofBsM=
> Realizing I wrote "Current" instead of "Long Term Support" in the diagram. I will
> fix that.

Actually, "Current" looks good to me as "LTS" already appears next to 
the release name.

Now that Styhead has been released, you should also change its color to 
"Current", the same color as for Scarthgap.

Thanks
Michael.

-- 
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com/


