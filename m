Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCC9E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 09:33:42 +0000 (UTC)
Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
 by mx.groups.io with SMTP id smtpd.web11.10064.1733304820488200430
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 01:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=HAjUJ6oG;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.168, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id AAF984E4666
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 09:33:39 +0000 (UTC)
Received: from nl-srv-smtpout3.hostinger.io (trex-6.trex.outbound.svc.cluster.local [100.97.250.73])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0DEE24E4893
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 09:33:38 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733304819; a=rsa-sha256;
	cv=none;
	b=rVYQTgmcTSLSqU96c+4IzFFe4gq9D0Gr0c3Y/nmnPaRTMj8OI23pPI6G+RhHAow/xQZu4O
	u2zIsQP4pMQxQQI1pRE3CkyE2WxukRSY2aqYdv/ejZhbtxtX8PSULoNz0Na/dWASgoff2O
	219OIULmLDEVBhhdYRySlRzQuuR7mtJ3O5xaKgTOaMR1zi9SVfIJl/72oa0tn1h9Lg9B/i
	kCciGdCFlDjQc7qlv4IaW4o68k0MCkH8TUvfCIgko3d/QU1hT7L0CtCnMID1jGo7P85uBe
	mnPwn+/tIj1l90F/ouB5t0YlO6UFIMu7Yi+9rszXoBUGdo6oryPxRxhQqLkARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733304819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=wQgvSw1mbEAqDJFoeXGyOL3rQzsd7aBkzDDI60Ymung=;
	b=9motCneV+p3uIGIxYh3e6aGx5wzkWU9t2INi+Gt8jhjsgFulxbQEAVJr6jU/oWxRz9WAlE
	BNWPyTQKvbypmcX5SZ56nLeUcRZdJq8qr0jp8MYcSy6hRtptu/SI/EsdoezR9fi6PKWLPW
	pUHIP32saiJX9ZjG9kQeGpVES5IsnWXad8oDSrCw7zQA8lI2klHyp7nSM2rh/qbvvq7JZW
	OoBad9SI7lc1C0JHRFLX8rpcpSCDLmv5icM4BfeW9Yfx+BME6tc4lESxLFdvFKJPEwvr8N
	Ighig7Kfa4kL54wai+Qx8kiMdpHJ6/AIXl/GlC+TnTtulFV/SbBID1fg4WWOlA==
ARC-Authentication-Results: i=1;
	rspamd-5d9d86ff64-mkk4r;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Descriptive-Lyrical: 24a67c2e14a7318c_1733304819557_2884392475
X-MC-Loop-Signature: 1733304819557:670266396
X-MC-Ingress-Time: 1733304819557
Received: from nl-srv-smtpout3.hostinger.io (nl-srv-smtpout3.hostinger.io
 [145.14.159.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.97.250.73 (trex/7.0.2);
	Wed, 04 Dec 2024 09:33:39 +0000
Message-ID: <1bf657ac-1392-4ac0-b279-9689a8de8d09@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733304816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQgvSw1mbEAqDJFoeXGyOL3rQzsd7aBkzDDI60Ymung=;
	b=HAjUJ6oGxFvXCtTB5A/V8a1HMcCujiyS1eqaF51VeUngDkOdHcd6Q2hehZSP+qjThNitx7
	DVvRMPtEHEsNR2o+URU/0rSiSC1p18v15cpfsMoreNSZIQox1CXQ0yGXkibds1DnjfrjMT
	LiyVfsSa19sqHeV68+WayIXFfbqzFu9thei0jVg3N9jNDTw4WuZuXwcLbNS3u2g2hrMNDG
	UcQkzTiulgnoBjBS60RfbuvaQ0GfivmIV7ATcqYqV3Grp5dnVOKNpIX9lYwBO+0WoiSyBg
	wASoq+7tXV37QbLu60qKb42xWyoHe7GHxflppe7gWI08Dcxrn6ubWdgEDzc88w==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [docs] [PATCH 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
 <20241201173801.3290796-3-michael.opdenacker@rootcommit.com>
 <D613DE1UW3GV.OXCJKSG2VQH6@bootlin.com>
 <7fa75108-fb1b-4d62-babc-054888a076d3@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <7fa75108-fb1b-4d62-babc-054888a076d3@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 04 Dec 2024 09:33:36 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=bJlEI++Z c=1 sm=1 tr=0 ts=675021f0 a=3JjwsiTUxCxireyYQgRi/g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=oy8ptxWxMjTE8mMqnd4A:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfFqCUyvnB3E3CF7IPdnOB/OD8V5D09GkBPtPkhvUU0Ddm3QiapWe7Ygu3XcbORANuF2NGWdetxfQ941xhKQVRulcqOewjjJdjf+FQBbr1FFzogFP1f5y X7h2mWQVXywewS9hlI5vuN6jQ1Bv20Km/dycZYh6XxuXLYNL0UZiOAPhAjUiCK51gvBmBNhp4jt1BqoN+S2DReWkSP9iz/Ywi0nrmrQY5FXL9TaZ1A6iiAau Mo3GsovJvoX7n2Jc4zD6Qqmrwiv6jeLXisGd12HQaZ07uPm0ZQ6DK9U/lTaocwLreTpcDVXLoatGRXjZddn0P1XLeMaiyKLbLO1EV89bng6IUp7Ww+fE4hrq naee/OBHBdavksSGQpYMz4fgfBWIm6moaxMWeRTJCMd7LIwGcGMnxXCbvnNMPBJfm5ddi2ob
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 09:33:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5872


On 12/4/24 10:26, Michael Opdenacker wrote:
> Hi AntoninI know this was already instructed before, but maybe `chmod 
> o+w` is a better
>> practice and advice to give. What do you think?
>
>
> I wondered too. Let's do it, I agree.


Actually "chmod a+w". On my Ubuntu system, "o+w" would have worked, but 
there may be other systems on which the user either owns the device file 
or belongs to its group.
Michael.

-- 
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com/


