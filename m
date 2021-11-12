Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C721C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 18:09:39 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.924.1636740577801844863
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 10:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id C97EF100004;
	Fri, 12 Nov 2021 18:09:35 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Why "git send-email -M -1" in our contributing
 instructions?
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
 <CANNYZj9EJ7UsrkCY0zOjYMc0DPYsqq5Z9ogOy68vU_x3GmRxtA@mail.gmail.com>
 <1d0977eb-4377-a3a7-e194-c0c257d3785e@bootlin.com>
 <CANNYZj_zHb2NHPWq+486PvZGATu5ektoWGF-+HBVtEu-r8wNig@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <236a47c5-c121-fe2b-ce51-5f3ad8df4759@bootlin.com>
Date: Fri, 12 Nov 2021 19:09:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj_zHb2NHPWq+486PvZGATu5ektoWGF-+HBVtEu-r8wNig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 18:09:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2149


On 11/12/21 6:28 PM, Alexander Kanavin wrote:
> No. You need to specify what commit(s) you want to sent, '-1' means
> 'one latest commit'. And that in itself won't send things twice,
> there's something else in your local setup.


It makes sense. Thanks for your help.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


