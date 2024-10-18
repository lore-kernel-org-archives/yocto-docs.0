Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46325D3000F
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 14:01:59 +0000 (UTC)
Received: from serval.cherry.relay.mailchannels.net (serval.cherry.relay.mailchannels.net [23.83.223.163])
 by mx.groups.io with SMTP id smtpd.web11.22903.1729260116292894609
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 07:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=PxUFQerR;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.163, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 74A669065A5
	for <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 14:01:55 +0000 (UTC)
Received: from nl-srv-smtpout8.hostinger.io (100-101-175-207.trex-nlb.outbound.svc.cluster.local [100.101.175.207])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id C9D4E906BF0
	for <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 14:01:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1729260115; a=rsa-sha256;
	cv=none;
	b=qiB2S1tNK9vhXjxLBoN1WqvZ5u1bHNpYDq8ZiUdImCWio1WezkFq+9LZhJbFt532ru3Y93
	n+Wkcw7R020i2TYsEWZ3OYsqPomT5o7r8Dljz/waDtWwzg1id6EWTPNIzrQNpU45/hW70+
	jGMyNZASe/FG1XZDaf7xFhQpljdI0MkGs/ccyIv7081QTAGu/0WU1YSw14oDFjOqS056Jo
	OvSUP4bN5mdE0FHYSnDgpzWdMH4oxbUABjZ6PfC/7efcHvpSTuF9jDL1zy3E6ECFdhJRL6
	AV97RltwhaGvTHN27uoZSumkEtUWwc1l1V9NNIA9DrHVwJM42lLJQwJvCtM+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1729260115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=0oD5hYpFC5xQEMee8/259uuTHshQ7JHlm/Vrvx6hM9Q=;
	b=orPKpCq0hdvURipmZ288M2gUALnR9XT7668biO+aKBf90/rB2NoHviWj1JBifDGibhYw73
	7r3/Qpz7BMs+5f5dNsmE0A+5Q+Rbb2v2Xj2EGRb053pECHkddVyXXdDO5B6nsit5L0F1Nm
	OE2wV+3VjoDbm4qhG+rvdfgBYgz5Af3AHpAFYeK2W0ibdfHPCX2jOlAdf/bsJKZN3s3F3E
	NzCS9h9muTpQWE3wNe6ZMIChrlJV6jCBeit3A5fmEEdsE9/2WQIjAvAoxD+d4bnVnHHgya
	yUhKn9rt42iIp7FmcMYWPCzgj4eE3JQaOzHhYmnqRQJ9m52zIg+pckfeuOTpaA==
ARC-Authentication-Results: i=1;
	rspamd-6bcbdd57f8-tntgg;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Tank-Society: 7454d6e1512ec750_1729260115296_2412736314
X-MC-Loop-Signature: 1729260115296:1884404183
X-MC-Ingress-Time: 1729260115296
Received: from nl-srv-smtpout8.hostinger.io (nl-srv-smtpout8.hostinger.io
 [45.87.82.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.175.207 (trex/7.0.2);
	Fri, 18 Oct 2024 14:01:55 +0000
Message-ID: <a6fd7c5d-661b-4558-b325-51dd19113cda@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1729260112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0oD5hYpFC5xQEMee8/259uuTHshQ7JHlm/Vrvx6hM9Q=;
	b=PxUFQerRSvjBrsiiL3HSz02MiAfhdJM3zXI5xQpFPHGQ89EUDNDkpImvtHi5+f5Of1fZ0k
	DvbHlr78GwSh8Yn23PojLDin4IjjNwlJRzxh7ufEtWcNfDfdOPCgcKFubTy55sbKduEozD
	tVvaebwJUpsEs9CSFxEKkVtodVRWpmwwUxT4K+wqZ9qqIZEqxKhmEy7mMaoDuWRuIMzTBJ
	k+Q7WbxcOiacq+01W8i7sPNVganQ065iutU0zZg0Tal/8gAOO3vSH5Uj/xJnHbn6q8dmaM
	80XyL6Ewc9VcR11uNkxQCFzInYgLD1PXDkp7rM61wEY1Voh2v33f/jYyX8u9PQ==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, quentin.schulz@cherry.de,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: update releases.svg
To: antonin.godard@bootlin.com
References: <20241018-update-releases-svg-v1-1-502899b5d780@bootlin.com>
 <82a4e314-cedc-4cb4-a8a9-bc3fd3e81c94@cherry.de>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <82a4e314-cedc-4cb4-a8a9-bc3fd3e81c94@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Fri, 18 Oct 2024 14:01:52 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=VemlP0p9 c=1 sm=1 tr=0 ts=67126a50 a=MyPBOTDVLb3fNp+q2YzvzQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=d70CFdQeAAAA:8 a=9i6tsIYAkzSSiruop6cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfELhed45BaQFftpxUmmBwxhd8b96Jh33RsmdN2I90D2OZ6fEtdaddn8VIIe4PtuxhuQHYd9IibD5yCVJNMKTHC3dbaA75Ahpslt0VNziqfyzdNKi7wqp 1lfPh9iSNOhyqkY75WGbazNuisC2TVfqdHOqPiUmI1VIUcNLdGLMGdBv/Ymh8s4F/PFmOwAR102sROz0aaCFFvYuG+9PzfALWwmk+ouaF2ibkGD9m1VR5L5D q5cICVPH4TjKk9IWyIoNjq60JA020Hu2g7ARh6M3Z/SQwYk1J7E5AZb8bxuBmu7slWKn9wzCqpoMdfWZqtx3JV3RPuj1gVUZS4Ma42WDx4rliYc9SwmReD+g vSEOIZ1Wap7uKepVXUoWwcpCMdy+dbG6H5Lo7z5dvZWePIQLJxVxglLsjw6ZmAT1iAkUV/elJz3pU0s0lEcZrxh7yBB69mKz96jQ636nC7/+oiAejHxamvlp 3qzdhdFg9+xGD90was2PRBY52kHSdYVNxmnDzg==
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 14:01:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5538

Hi Antonin

Thank you for the update! I was thinking about it too :)

On 10/18/24 13:53, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Antonin,
>
> On 10/18/24 1:38 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> * Add Walnascar release.
>> * Remove dunfell, gatesgarth, hardknott, honister: these release are n=
ot
>> =C2=A0=C2=A0 supported anymore. Start from kirkstone, which is still s=
upported.
>>
>
> I think we also need to update the paragraph where this appears.
>
> Indeed, we're missing the information that Scarthgap is the latest LTS=20
> and is supported until 2028 (it's in the SVG though, so maybe that's=20
> enough?).
>
> I would keep the releases that are unmaintained but newer than the=20
> last LTS. The issue is that Styhead (and Walnascar) is going to be EoL=20
> before Scarthgap, so are we going to update the SVG in Scarthgap when=20
> Styhead is EoL? If not, then we'd be inconsistent with what we've done=20
> for Kirkstone for example.
>
> Just trying to figure out what's the plan here so we can stick to it :)
>
> It'd be nice if you have the SVG published somewhere so we can see it=20
> without applying the patch locally, is this something you could do to=20
> make reviewing easier?

In addition to agreeing with Quentin, I also note that in the previous=20
versions of the diagram, the future releases were in lighter gray, as a=20
way to distinguish them from past ones. That's not strictly necessary as=20
we can see their dates too, though.

You could either change this or decide to color all EOL releases and=20
future ones in light gray, which could also make sense.
Thanks
Michael.

--=20
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com/


