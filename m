Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5F8C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 11:12:07 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.22047.1641985926048508488
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 03:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0FDE9240004;
	Wed, 12 Jan 2022 11:12:03 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] was there any discussion about supporting comments on
 online doc pages?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <e6aa3a37-78a-2a2e-b0e4-d7eddab21524@crashcourse.ca>
 <bbdb160b-a74f-8399-42c1-a31c09492fa3@bootlin.com>
 <39a3630-ec14-ef57-1375-11a598d181@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <88ac71ee-08ce-9b25-9893-15e456d1918f@bootlin.com>
Date: Wed, 12 Jan 2022 12:12:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <39a3630-ec14-ef57-1375-11a598d181@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 11:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2390


On 1/12/22 12:03 PM, Robert P. J. Day wrote:
>
>   i haven't yet tested this myself; the idea was to support online
> feedback strictly as off-the-cuff suggestions about a page, or asking
> questions about something on that page, etc -- there was no suggestion
> as to adding any of that feedback back into to the official docs,
> other than manually and explicitly.


Of course.

>
>   in effect, this online feedback mechanism would be totally divorced
> from the current docs preparation. is that the question you were
> asking?


Right, but it could be a valuable source of feedback. However, we would
have to keep track of such comments, take the relevant ones into
account, answer questions and if possible discard the irrelevant ones.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


