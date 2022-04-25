Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94408C63703
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.30778.1650899340275111133
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 08:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LsC/xa/K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 21508FF803;
	Mon, 25 Apr 2022 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650899338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxB3ti5n48AYuO6Zso2XDLXNU6giO5uD+j46w5FPgZg=;
	b=LsC/xa/KRuR8tOWlSPU3fFqDXNxzW5qdA8myW2XDkNAkqunMeM8sL8UDc+yOEYrXgp/nzZ
	qMP8fM4Z8a4o66MSfeSn7Uycc+I67Ez0HZ8REbjYsc6dif77q5eMfkNqJw6CGIu6I75JL4
	l5qPcSI80zDREfsfQAp9oDrNrRA+lLwxW5SRsVgSttEIA+37cC+dbVaduGwzQn3Chb5xCA
	yYSjGYoKTfHYA/JtFANRDNBJk9fiFwQOg/fWO2xL31VY9mqWYuvvCpXeojGDPPhJvA7PT+
	03xb/FuJNgeN+FqGEWpkxgud3l5JKagnmgsCjgpos8V0VXunGmoDPb1nzKDXxA==
Message-ID: <62709bc9-4a77-5dc4-27f6-19565404ebf8@bootlin.com>
Date: Mon, 25 Apr 2022 17:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] Alphabetize the Required Packages for Build Host?
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tim Orling <ticotimo@gmail.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: 
 <CANx9H-Ai+s8euDAX4nf1kt16DC5Jya6a0ygQO=6Ryv48Z1de3Q@mail.gmail.com>
 <f379c869-bf36-b895-0b80-67da70311fc8@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <f379c869-bf36-b895-0b80-67da70311fc8@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2859

Tim, Quentin,

On 4/25/22 10:20, Quentin Schulz wrote:
> Hi Tim,
>
> On 4/24/22 03:38, Tim Orling wrote:
>> Historically, new requirements have just been added to the end of the
>> lists
>> in:
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__docs.yoctoproject.org_ref-2Dmanual_system-2Drequirements.html-23required-2Dpackages-2Dfor-2Dthe-2Dbuild-2Dhost&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=9mRC9z3X7F25ILlbLtjn7otitLoUMh_E1qNPdTXU1TQPlq56xwELjybPnCgrwfWN&s=dCV-_Bxq3xyGMWvW3XVbn6NGrNZDEkLdIjP83KMHyuE&e=
>>
>>
>> This makes it tricky to see if you have the correct packages installed,
>> e.g. in a Docker container.
>>
>> Thoughts?
>>
>
> Nothing against it.
>
> I'd personally list one package per line in the poky.yaml.in file and
> add a comment that it needs to be alphabetically sorted otherwise
> we'll forget and it won't stay maintained/sorted for long.

Very good idea. This would be very helpful.

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


