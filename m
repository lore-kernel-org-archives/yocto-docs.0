Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7D2E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 09:19:52 +0000 (UTC)
Received: from dormouse.elm.relay.mailchannels.net (dormouse.elm.relay.mailchannels.net [23.83.212.50])
 by mx.groups.io with SMTP id smtpd.web10.9929.1733303987799361976
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 01:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=El3upQKp;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.50, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 20DDE183394
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 09:19:47 +0000 (UTC)
Received: from uk-fast-smtpout4.hostinger.io (trex-4.trex.outbound.svc.cluster.local [100.121.84.212])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 79A07183376
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 09:19:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733303986; a=rsa-sha256;
	cv=none;
	b=KPR1NgFzw4romg0kKsSOmoNJANs0v+prSggP9MIBqGAPLUKzHPC6LQIcaa/2Z5A8NXp7UV
	991fLCEE3yv8CB58niM9eCXUI2elobqEclcmgthPS7lVv0a2cmgjq/Ut07v/WV5wWTHT6i
	VZc1dorypmvxRFuJHm2tNP0GkNBYvVOAoj6j62XHxzn7IoTmSIITjWya3t2fw94N1epy/M
	LTUXf1uFe9Kn5AxG89TbRQSpuj1XxcZTp/ZtCew5DUWJBKumzLHRwTdrA/63Mkda2l/ioj
	9SVAilKbNyy6Ssmiav1F27yNPyS17iGDv6lC5eDJHxS7vla8HpV0SUxagxBRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733303986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=fdKrPY++6M7My6BPdwITFFKocebM1VVdIVhfczjzuA8=;
	b=w9piMMbm6L1yqJou1wHKMu/ooISJ1y1Vsttoj6HEHcBhGZGkhZnZdGq3RlBuKiI++4G4eU
	/+NMhQx9Hc0BgSYm7oJFQQOnf9brVRp/ZnsjGDh3ir4eQPsdw/nP3nVcWZNqVD+LWBWs6G
	QTCPRMKe/iT9Yok457nxE6Gg99ekdIhx443eWBw8nQSW7SPtVY1mDddO0lM+VtvEe3DvEB
	XsBsTl7ZMzHGZNkoJuQH5JDjWCCyn3TYVAHm5dQhS0M9PE0iQyqg7dBWxDuI6nDGOSCU2E
	6Y5dVdoK1l7aOxzOwHJysulxzpb9wgKcp7iLEnSWmMbu/W0ZYLHJMAyu+EaqxA==
ARC-Authentication-Results: i=1;
	rspamd-fc7fd4597-nz5rb;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Descriptive-White: 235d280154f463ac_1733303986993_3330226717
X-MC-Loop-Signature: 1733303986993:2835661145
X-MC-Ingress-Time: 1733303986993
Received: from uk-fast-smtpout4.hostinger.io (uk-fast-smtpout4.hostinger.io
 [31.220.23.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.84.212 (trex/7.0.2);
	Wed, 04 Dec 2024 09:19:46 +0000
Message-ID: <de40bb9b-92e8-4f2b-90ed-b58962034adc@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733303984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdKrPY++6M7My6BPdwITFFKocebM1VVdIVhfczjzuA8=;
	b=El3upQKpf38ulc6QNLb//BWKJL5NK9Ib3f5Usjc8WzgAzVsW4OstatQsXWecsWDlIZaTUw
	E+mVBnzCZbAqEj98mjXHzJ/scsS32QXF2dIalVGDS5JeUVnDSNwKxUR0CqcVco0cmVzC/S
	3XIFYAmvK+kh5SN6LE27LEbK5zpqKlNk3YGS9kM7EmNutQVMNN3pRRfjSDxM/3XHUlAhul
	Q7cb910wVJdwBLW6s3o7DFRYfr638rDgeGdXEX2nXMFuGTkW0MnZ+qdbGklQraVXzvt4tV
	c2cEJE9Ol2t0GaaGoHIwTiD7I/+uLGQ6MzQe7yoSnwD2mHWMvtYzjLruk1tIAg==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
 <20241201173801.3290796-3-michael.opdenacker@rootcommit.com>
 <6rwmgj6w71.fsf@pengutronix.de>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <6rwmgj6w71.fsf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Wed, 04 Dec 2024 09:19:43 +0000 (UTC)
X-CM-Envelope: MS4xfBEyfYVQTtzKqmdvF4J5UKIKK1jsG9lAilLHjN6PH0TiRYy+hmzmUu8R8sQjCOf75KAjZSB5s5qa7/10lyWmqRTB4AkDICFM8IPkaXaDITpnYD6qxgF+ FwtjMXEelDGU/2KXfS4YGIw0TJw9sJfVl2zM0QCGOVRpiXVJrUy7e/JrKOPLhc1ZAW0SV9JHzEkwb3Yi4G3pp6ckqNnwm/AshlD5Sk8AoCx+d+LlU/vZq+np eQ1xaUGMPeYoJvpbo6G2nsQaPHxlXWk8to+0GQND1yHTyKAZRS2FSvNFthCq+FdhV8jTLRMUH6Zl1i4+iupNgfikwgqsulYMx4lITO61AjRjOcJL1IhWuUPl ib0w6XF1IJDyn9q6OWgum8LQfCrtjsxl6lvXNzzZpYh5OLiSa3jcIXMaG5fvwc6ty2CsudGq
X-CM-Analysis: v=2.4 cv=eteNzZpX c=1 sm=1 tr=0 ts=67501eb0 a=3JjwsiTUxCxireyYQgRi/g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=iGHA9ds3AAAA:8 a=3KJx7nVBq1Igc3YPZzsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 09:19:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5870

Hey Ulrich

On 12/1/24 20:26, Ulrich =C3=96lmann wrote:
> Hey Michael,
>
> On Sun, Dec 01 2024 at 17:38 +0000, "Michael Opdenacker via lists.yocto=
project.org" <michael.opdenacker=3Drootcommit.com@lists.yoctoproject.org>=
 wrote:
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
>> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev=
-manual/bmaptool.rst
>> index 5fc46c7792..e17074b65b 100644
>> --- a/documentation/dev-manual/bmaptool.rst
>> +++ b/documentation/dev-manual/bmaptool.rst
>> @@ -44,14 +44,16 @@ any type of image. Use these steps to flash an ima=
ge using `bmaptool`:
>>      depending on your particular setup. The following commands assume=
 the
>>      image resides in the :term:`Build Directory`'s ``deploy/images/``=
 area:
>>
>> -   -  If you have write access to the media, use this command form::
>> +   -  If needed, set permissions to get write access to the media::
>>
>> -         $ oe-run-native bmaptool-native bmaptool copy build-director=
y/tmp/deploy/images/machine/image.wic /dev/sdX
>> +         $ such chmod 666 /dev/sdX
> a small typo slipped in here: s/such/sudo/


Oops, fixed!
Thanks for the review.
Cheers
Michael.

--=20
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com/


