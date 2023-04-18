Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40711C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 12:24:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.7081.1681820641067301249
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 05:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AQSiGCNK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D51042000B;
	Tue, 18 Apr 2023 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681820639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ft7ZUWmK5wpSBsuW3ZIP2sX28kPc18ZU78/REJphoBw=;
	b=AQSiGCNKh/yZpOjrT0uH8Y8h5H4TAGhD+laN5Dycm92FMQCmVTb/wZPpuBrwZn1dPVypKA
	wQCbCouoPIkVIwDA/gN/HeUtr69s92uhAAQAvmxYuo02LZrBqr5jEapZLFHBkuv0CBY6A0
	pRdiZgjbTLALAVTUCBnOO7MStdyAzMzzdWKgYGYP5o/7QirYBz2dmzv1IK4I7IjCB31xid
	/0o1zUA3NGknlJcpCBg3VcoUoqIwdbmUJzJvB2LKHimdjNsyoQe0oeT/3dJzCl0cYCF72Z
	vBfA4jW0wz9/b5LmGWzTctRIVBQtqbQh67LSn/10dDuJsN7k/GfdEmI8Ta2SZw==
Message-ID: <6417e4df-d44e-b2cf-cf3b-482f753653e9@bootlin.com>
Date: Tue, 18 Apr 2023 14:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: Saul Wold <Saul.Wold@windriver.com>, Joshua Watt <JPEWhacker@gmail.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: document SPDX_CUSTOM_ANNOTATION_VARS
Content-Language: en-US
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
References: <20230418090909.1282106-1-michael.opdenacker@bootlin.com>
 <1a0a5493-8234-c12c-000d-39827867b948@bytesatwork.ch>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1a0a5493-8234-c12c-000d-39827867b948@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Apr 2023 12:24:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3844

Hi Daniel,

Thanks for the review!

On 18.04.23 at 14:12, Daniel Ammann wrote:
>
>> +
>> +         ANNOTATION1 = "First annotation for recipe"
>> +         ANNOTATION1 = "Second annotation for recipe"


Oops, yes, good catch!
Fixed.
Many thanks.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


