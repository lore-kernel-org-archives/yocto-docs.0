Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6076C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 08:47:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.5327.1685436427311832028
 for <docs@lists.yoctoproject.org>;
 Tue, 30 May 2023 01:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lWMwKn5y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685436425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaETuQsCAv9HBh/Rn0RPL0pNf1taVHNedDBjYrc9f0o=;
	b=lWMwKn5y3I7iKxAprasK1bBHdMtpJvaWoxchZqIDk2tYBI/H6kARkUyZEx6D7lgAwHup8V
	FbaypvhfUAZNDGtaEeWkVPK7EuIvo7tLwPmqJ3RnxU9IJ+pyBtBDaLkhjOSLJFyynnaWsa
	N3wovxis7liImaF0tVOwig0zBvw8F4NIu2i6tPGdXcCkHWR0J/5CXVablXeSlPo4kX2n9P
	Vsdb+GvAFDFYt5rgelhcDr+Sf8TRa5Y36IF1sFzkPzR67z3Mf0fkwaPMlvtqsuKbn5bFuV
	p3/kDTsmIDg3gf0e0iyj5xBut1XMIcZzuyJVcTmkPiyf7vnwRvXeIeHQrIwZZA==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D0551C0009;
	Tue, 30 May 2023 08:47:05 +0000 (UTC)
Message-ID: <1d562974-52ac-ac2b-ead7-c884a0c407e8@bootlin.com>
Date: Tue, 30 May 2023 10:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] Fix makefile.
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Tom Isaacson <tom.isaacson@teknique.com>
References: <20230529030612.663-1-tom.isaacson@teknique.com>
 <CANNYZj8nnq8Kw0A8WvQyqfTQy_eyPTyzGdU5m7-J6v+0qHWCMw@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj8nnq8Kw0A8WvQyqfTQy_eyPTyzGdU5m7-J6v+0qHWCMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 May 2023 08:47:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3979


On 29.05.23 at 06:46, Alexander Kanavin wrote:
> What is bring fixed and why? The commit message needs to include this 
> information.


Happy to help with that. Thanks Isaac for the patch and Alex for the review!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


