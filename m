Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE11C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 10:52:46 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.21764.1641984765261541736
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 02:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id EA1ED24000D;
	Wed, 12 Jan 2022 10:52:42 +0000 (UTC)
Subject: Re: [docs] was there any discussion about supporting comments on
 online doc pages?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <e6aa3a37-78a-2a2e-b0e4-d7eddab21524@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <bbdb160b-a74f-8399-42c1-a31c09492fa3@bootlin.com>
Date: Wed, 12 Jan 2022 11:52:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e6aa3a37-78a-2a2e-b0e4-d7eddab21524@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 10:52:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2388

Hi Robert,

On 1/12/22 10:42 AM, Robert P. J. Day wrote:
>   my apologies if this topic came up and i missed it ... a colleague
> is pondering what to migrate to WRT existing documentation, and i
> suggested taking a look at how brilliantly YP is doing it with sphinx;
> in particular, she was enthused about the expandable/collapsible ToC
> down the left side. the only thing she brought up was the need for
> user-suppliable comments on online pages so readers could ask
> questions or leave suggestions.
>
>   i know sphinx supports online comments as mentioned here:
>
> https://sphinx-comments.readthedocs.io/en/latest/


Very interesting. I tried to activate this on a local branch, and
enabled the Hypothesis engine. After registering an account at
hypothes.is, I could see that you can add shared notes or private ones.
However, there's something I don't fully get... What's the real value of
adding an annotation system to our Sphinx generated docs?

Maybe because you don't need any browser extension to see that you can
annotate text. Anyway, a solution such as Hypothesis seems to work with
any website. After installing their browser extension and logging in, I
was given the possibility to add annotations to any website, including
https://docs.yoctoproject.org/.

So, do we want our readers and users to share their annotations and
comments directly in the HTML manual? We could get more engagement and
feedback this way, but this should be extra work to manage...

>
> was there any discussion as to whether this was worth doing?


Not as far as I know, but maybe before I joined.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


