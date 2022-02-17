Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF36C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:16:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.1074.1645110993333051829
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 07:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jWotAQ/7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8AC9EE000D;
	Thu, 17 Feb 2022 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645110990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ivClHPcUWu4qnuQHvHtvVlYirLdOdIoFu9RKjweGiWY=;
	b=jWotAQ/7+ZkCzI6myB9Gdm858W/CsfWyhlRBwhsfTRw8LzEt/joFJ7X4lnZpzztAS8IEmq
	3mVP7cqaRi9t3VzhxRM+zSXL1ED+KbPKaPElDoKne2jhz5o4a4IPSWZokfmqkJHBFpOBUI
	1kZXU3YRm333PuWsZEgOOLopbuSacJezd18yo1kswiJp55ysMvecd4XYAWKLvRC3l4ZhAQ
	4PZpS8xX1i2eNdG8NR+O8JuD1CRQ6LevwBnse/s31eUQiSpHVrXe4K8d+EHwctvZtG1TcQ
	KYaOUCICVeEBcntrtqyUWp8vbB+ngQF6CKG5KYUDdK/xTufYl4mExR4DO51WuA==
Message-ID: <25a0b38c-cda8-de80-5872-76b28aa5ddbb@bootlin.com>
Date: Thu, 17 Feb 2022 16:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [yocto-docs][dunfell 1/1] documentation: update for 3.1.14
 release
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
References: <cover.1642715781.git.steve@sakoman.com>
 <e94c4c7d7103b8af5a332e53afb1e0c5d848695b.1642715781.git.steve@sakoman.com>
 <16CC412005E32B07.3379@lists.yoctoproject.org>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Bootlin
In-Reply-To: <16CC412005E32B07.3379@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Feb 2022 15:16:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2472


On 1/21/22 11:06, Michael Opdenacker wrote:
> On 1/20/22 10:57 PM, Steve Sakoman wrote:
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  documentation/conf.py                    | 2 +-
>>  documentation/poky.yaml                  | 8 ++++----
>>  documentation/releases.rst               | 1 +
>>  documentation/sphinx-static/switchers.js | 2 +-
>>  4 files changed, 7 insertions(+), 6 deletions(-)
> Thanks Steve.
> I'll apply the patch when the release is out.
> Cheers
> Michael.


Done. I merged your changes, thanks again!

Actually, when a release is made, Michael Halstead already modifies
releases.rst and switchers.js in "master" and in the corresponding
branch, so eventually I just applied the changes to conf.py and poky.yaml.

Hence, you get two commits here:
https://git.yoctoproject.org/yocto-docs/log/?h=dunfell

Not an issue for me anyway, that's easy to manage.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


