Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6869ACEE328
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:57:02 +0000 (UTC)
Received: from cockroach.ash.relay.mailchannels.net (cockroach.ash.relay.mailchannels.net [23.83.222.37])
 by mx.groups.io with SMTP id smtpd.web10.20584.1728489419639236181
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=AmeH6HS3;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.37, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B2D268C16DB
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 15:56:58 +0000 (UTC)
Received: from fr-int-smtpout3.hostinger.io (100-96-86-114.trex-nlb.outbound.svc.cluster.local [100.96.86.114])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 16C3D8C26B7
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 15:56:57 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1728489418; a=rsa-sha256;
	cv=none;
	b=Y5ludScvz5Ch+O4X86XtLp05UOQ/EWOSkeZXV9pwFuuJqwFYhXoTVREfPEkw9o057/9z8J
	MRDl11LkU4ojdHM/FXaSCAaYEnXdyexgy5sUXW9FQvb/wpiUnax2ULu4CtNtmOXT+UOin9
	QiCaY/f7jdavGDyFqolfoDi9hQybxrYoSguBHrWVTpnxm+Fy42i/LNPMKgBosfGNHDGKyT
	UW4zHTn4GeVrh7uv3slpSDMWFAtW27CK8cX0ngdjBpuZ6gmb7WKzI/AW9VylNoB65jNXB1
	r/Zt+OucrbmDRH9WN3ZIeb9UsbPL4mXC6Y2IPhobiX1Y32yCCFO763pxVSuctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1728489418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=JW1nUBHDxHfYRnekx79Js1X5JqK4vQMXibwOi/f4wi0=;
	b=6hgNMtiOGDTKYeP15sjGmu6+yMyVV1UeMl9X+NbKFs/w65q0wQMv0F6TKic5s1kd0PvyUo
	yEMS86/nbZOEyvJbQ4sUyw0ymYw1sQ2xhOW0sPPWnVDFNI+0lgwnxLLaFgqJv3B/T7+Ae2
	54X43alYe3pTcBDplU6f5ontIJe/pIDUETII8jBRJhhEE73av7Vd/VouCbniqiV0YyR0jr
	tmXAwnMEP08UrxVWxmOVku/EYJxQNJXbEHxwFjs8/hjX73mevWg9qQVXdwl1kPLMI6VvNz
	kw2G1VUjBbxNkWuLi4ZP9GAe7PyuTCBzpfETjqIar5dG/jIaboOcQpBWCtF8Yg==
ARC-Authentication-Results: i=1;
	rspamd-b4cd7f459-z6xvn;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Belong-White: 52d4d47758fc609b_1728489418585_1198841867
X-MC-Loop-Signature: 1728489418585:1810830944
X-MC-Ingress-Time: 1728489418584
Received: from fr-int-smtpout3.hostinger.io (fr-int-smtpout3.hostinger.io
 [89.116.146.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.86.114 (trex/7.0.2);
	Wed, 09 Oct 2024 15:56:58 +0000
Message-ID: <80980048-ae8a-4cb8-a85f-9dc79caaae71@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1728489416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JW1nUBHDxHfYRnekx79Js1X5JqK4vQMXibwOi/f4wi0=;
	b=AmeH6HS3NYsZleJeQ5uZVbqxDErC45Ja400N6JCihG4r/caJystPmLJhuwpe/19g1G/FoI
	XdcmIwNS5BluUgAp7BdXU+BI5XcoHdTTQJBJeXdX+ewgPi2cfVoZbw3+9vJL9lLBycaP+9
	vMQ1vxD7AQSGfKlU07RHL2YR6ZjKp1I5SkiWmz3ornPaL7oPTRnbZ8xabQwI/OZA4ayvKu
	1gjNQ1Qz9RnCtU3JRVWYG2SevielTl0ih93grwHSP2BNzN/n8yfIYb+DYohfXc7SU1XM11
	drD4j2RnI1InsVJ9LHj7XtHdfnkxnWigaQUfqcaonE2GeZa9/m1wdX/nxidStw==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, ross.burton@arm.com,
 paul.eggleton@microsoft.com
Subject: Re: [docs] [PATCH 08/16] ref-manual: add missing image manifest
 variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-9-antonin.godard@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20241009074120.866786-9-antonin.godard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Oct 2024 15:56:55 +0000 (UTC)
X-CM-Envelope: MS4xfBO2DyfTiXKM4YmORXS7d//i0CynJIKzsBnl4PcOf61WZ6fAkm9ZqgvSPyed+/BqvSPXUc3gMBeSQme/wP+tM2WsVATeCByIyWYTxjRVgX38eU+XntxX /Skg3kZrOsHuh29NzgWn/n2WtML4EJkgvvpQpeXXoLfvMelcT/yQ6islUqoSv1DgRqySyiQnCYgik3eZQBRV5nMzAlHVI9OfGvnzfJe7Rl+itThz6vdetHOo xBrjAQ3HYwqT9VaAJqWZAzTTCBgDuoj/YsvISvmZbCkL6/tNrfsSwLHYcYkLubyp2e+ZTNjo55I7ugiL0TdM8gk1R+HF28Ba3Qtf1idNqQBMQ8X+YPcP1YnV ayBfhRHTGYphREysPulQUEWUZ7LLby0K0cf1X1uoIm4DwJAX/yY3DszEUJOL4mOpyLCpejLOp7MqJdN1rv3u/zFZjM5wnI9hqo+a4THzpG3zJPLOqc274ALf B0hR8qiLu0oJ5WIw
X-CM-Analysis: v=2.4 cv=Z6G+H2RA c=1 sm=1 tr=0 ts=6706a7c8 a=FxzzrTkVuG1G0rBnFVKeJA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=d70CFdQeAAAA:8 a=9OMKq3KnZKUdWL6W6nYA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:57:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5447

Hi Antonin

Just a quick nitpick!

On 10/9/24 09:41, Antonin Godard via lists.yoctoproject.org wrote:
> From: Antonin Godard <antonin.godard@bootlin.com>
>
> New variables that control the output of the image task manifests.=
>   
> +   :term:`IMGMANIFESTDIR`
> +      When inheriting the :ref:`ref-classes-image` class directly or through the
> +      :ref:`ref-classes-core-image` class, the :term:`IMGMANIFESTDIR` points to
s/points/setting points/
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
https://rootcommit.com


