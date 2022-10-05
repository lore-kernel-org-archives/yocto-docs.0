Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62777C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 18:06:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.1255.1664993186625309365
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 11:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bC4qkc9s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C4C760002;
	Wed,  5 Oct 2022 18:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664993184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESGRTzrxhErXVhuyZFX8lTuJT91OWt785FOYIRf1wkw=;
	b=bC4qkc9sm9eGWn+6JEtN2Y/GpyegVTfvbekcQM3PKbcydIqDrDzow4bQ/+PG8KovEfLd9z
	4pnjOZUY4pTHfAeZ2f/qB/7WBlQJCeuY/Q2ZIqN8aqT/pdvpJnn6SYiqDZIQoQcNJTh5IJ
	s6CD6DCC4cHjli4KBCtAcT1a937SpiUAdufthp4G1ERrCVCROQ6SPuTX5Tf1BLl/ryYiyb
	qcm1hJTTSODuO1OKT6Yq9sYWO99Xew86Yhs6Y8+TC99DJP/Mu5jtO+vd7DskSPLa6UGpOD
	fDpgSyPpHyhvtmK0xPc4f0gAi7kARBRjKzbFQ0wbw9wtIgoWrDpheFgOArPXgA==
Message-ID: <f3c2e931-9d80-8518-a355-17ac776d39f1@bootlin.com>
Date: Wed, 5 Oct 2022 20:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 02/30] manuals: add reference to the "do_install"
 task
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <20220923175219.6652-3-michael.opdenacker@bootlin.com>
 <0b66819c-04d8-5a99-ff4b-f0576ae9cd71@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <0b66819c-04d8-5a99-ff4b-f0576ae9cd71@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Oct 2022 18:06:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3289


On 26.09.22 16:04, Quentin Schulz wrote:
> Hi Michael,
>
> On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> [YOCTO #14508]
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Reported-by: Quentin Schulz <foss@0leil.net>
>> ---
>
> Missing a few:
> https://git.yoctoproject.org/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n1916 
>
> https://git.yoctoproject.org/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n1926 
>
> https://git.yoctoproject.org/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n1983 
>


Oops, fixed, thanks.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


