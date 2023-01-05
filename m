Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282C5C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:25:02 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.15495.1672932293012291069
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 07:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NyhPFayd;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1DE4924000A;
	Thu,  5 Jan 2023 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672932291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOIBsXlg7AHYqNG3bdxrea6J5x2BuOo0HNzZRMLpgj8=;
	b=NyhPFaydCFdvVt1niL3O3Re8wBm2KdlUAxQFMJgzsbF4mVy6O5w7kyZWoG94EtPMv+fWw5
	UJICAOzjtctQU8RQkLVE54InweuyS81SnW0ywQT+GY/fJYmZtnsCV3CBe6eyOnDe5qj95h
	dasDyxcEiRgV2rfzUiCraNa8GTQXNY93X6vp+w4EC/PpWw86MBjGLxMIoCnQcf4VIU6/jA
	5EsifJNxMbGZR6cDtcXSQYzaieELdkcxsYZyGVLYyf13YbuYZpla5vTIxZ7sj6Lvova7yj
	GsWUuT9g3FPJja+WHtLs4d/eVb0EU828ECxkgAjwwvEHfNg3WpmJu0W7n3ZZPQ==
Message-ID: <c4d42d66-47ff-f9b6-bd6c-6e1845c94ad3@bootlin.com>
Date: Thu, 5 Jan 2023 16:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: Vincent Davis Jr <vince@underview.tech>, docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 quentin.schulz@theobroma-systems.com
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: support Arch
 Linux
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20221227194932.3783-1-vince@underview.tech>
 <456184cf-b08c-9eeb-c261-840552bcb5dc@theobroma-systems.com>
 <d3110d81-b0fa-de4a-965a-0c775485e7dd@bootlin.com>
 <17367770FC1C1495.4716@lists.yoctoproject.org>
 <CANNYZj_ghrVOm0froyS8Bh=MFf49ocEJ9uFYJnV338SdpCSL-g@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj_ghrVOm0froyS8Bh=MFf49ocEJ9uFYJnV338SdpCSL-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 15:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3594


Am 02.01.23 um 13:58 schrieb Alexander Kanavin:
> On Mon, 2 Jan 2023 at 11:33, Alexander Kanavin via
> lists.yoctoproject.org <alex.kanavin=gmail.com@lists.yoctoproject.org>
> wrote:
>> Please no. Wikis are a dumpster of outdated information, and this in
>> particular will quickly become a source of confusion, which is worse
>> than simply trying to build and dealing with issues as they happen.
> On second thought, people on distributions not supported directly
> should be pointed to buildtools-tarballs of both kinds. But this
> should be in the proper documentation.


Good idea.
Submitted as https://lists.yoctoproject.org/g/docs/message/3593
Thanks Alex!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


