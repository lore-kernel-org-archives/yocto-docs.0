Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6550AE67808
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 19:47:51 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.23669.1730576867460631264
 for <docs@lists.yoctoproject.org>;
 Sat, 02 Nov 2024 12:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4A2JljUP015158
	for <docs@lists.yoctoproject.org>; Sat, 2 Nov 2024 14:47:46 -0500
Received: from [192.168.2.253] ([192.168.2.253])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 4A2JljLs017168
	for <docs@lists.yoctoproject.org>; Sat, 2 Nov 2024 14:47:45 -0500
Message-ID: <daa37959-b3cd-4cd5-a6a6-e7c3814ec5ae@kernel.crashing.org>
Date: Sat, 2 Nov 2024 14:47:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: docs@lists.yoctoproject.org
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: docs.yoctoproject.org appears to be broken
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 02 Nov 2024 19:47:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5642

I was searching for the documentation for the NVD API KEY when I noticed that I 
wasn't able to switch to different versions of the document.

https://docs.yoctoproject.org

Then try to switch to 'Unable (dev)' nothing happens.

Going to https://docs.yoctoproject.org/dev/ lets me review the 'dev' docs, so 
the docs themselves are there, it's only the selection that appears to be broken.

--Mark

