Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA55C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 17:50:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.20985.1679421004485454588
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 10:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CIo7zlzA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9E9011C0007;
	Tue, 21 Mar 2023 17:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679421002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=suE/3gU5qP6bKOrTqTNoKLUeqPQ/74A9TSSHJcC4caE=;
	b=CIo7zlzABCwMXFDrq7R/o28g3GrTyOoRfaJmeT9xhmwfsWGchpbgIBKMmanm1ZsKP4IyGO
	1X5GG+lbNqD3/lcqyv7iHqbcU2QVVoztUUbQpqUYqEfBgqgunG8gu+OGk4mI/xB+hScKz9
	CUY2jMdbMUNxNKxhsboGm4M6FNh8fQgYJnWjrbmrdrDcdYU95snsYxp83CYhw6JwuWCneL
	yRNr/FCLHO+wc2DYuiwwn4r0UyiiXzoaVKudcCMexntOL6H/YLl7INaWvaN5EFZjBvCCG8
	7bIladCrtzotDe9CgiTNd8viETyGwr8Av4HKBw/0A4GgFx6h8rtVLouxgtywlQ==
Message-ID: <3fc33c4e-b166-96f8-78ee-e840a4657f61@bootlin.com>
Date: Tue, 21 Mar 2023 18:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Content-Language: en-US
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Need content for 4.2 release and migration notes
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Mar 2023 17:50:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3810

Greetings,

As discussed in the weekly engineering meeting, we need to have release 
and migration notes ready for the 4.2 release, hopefully happening in 
about 10 days.

Here's what we have so far:
https://docs.yoctoproject.org/dev/migration-guides/release-4.2.html

I can try to find some noteworthy details by myself by looking at the 
commits in the master branch, but I'm sure some of you will see the big 
picture better.

So, please drop here quick descriptions of the changes you are thinking 
about. I'll take care of polishing them and adding them to the manuals. 
Submitting patches directly is also possible, of course.

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


