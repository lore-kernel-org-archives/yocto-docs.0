Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78774CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 21:20:59 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61242.1778534455404982848
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 14:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 64BLKsbx1395168
	for <docs@lists.yoctoproject.org>; Mon, 11 May 2026 16:20:54 -0500
Received: from [192.168.2.90] ([192.168.2.90])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 64BLKrrP017750
	for <docs@lists.yoctoproject.org>; Mon, 11 May 2026 16:20:54 -0500
Message-ID: <75217d92-e0ba-44da-8447-b51c0edf0064@kernel.crashing.org>
Date: Mon, 11 May 2026 16:20:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Should explanation of "github-releases" class cover
 private assets?
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <f3b7de9b-a40c-5638-7d5b-d7004f987b02@crashcourse.ca>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <f3b7de9b-a40c-5638-7d5b-d7004f987b02@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 21:20:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9454



On 5/11/26 12:04 PM, Robert P. J. Day wrote:
> 
> Here:
> 
>    https://docs.yoctoproject.org/ref-manual/classes.html#github-releases
> 
> there's a short, sweet explanation of "github-releases." This morning,
> for the first time, I created a recipe that tried to fetch assets from
> a *private* GitHub repository, which failed in just the way you would
> expect -- "Failed to fetch URL ...". (I had not been warned it was
> private.)
> 
>    So I went looking for the proper(?) way to define credentials or
> authentication for that, and I ran across all sorts of suggestions. I
> eventually ended up here:
> 
> https://lists.yoctoproject.org/g/yocto/topic/bitbake_fetch_private_github/115408881
> 
> so I thought I would just ask -- is there a YP-approved way to do
> this, and should it be covered in the docs? Because as it stands, the
> current explanation does not warn the reader of the extra complexity
> when private repos are involved.

I use private repositories on github for a bunch of things.  Using a PAT, you 
can simply tell the credentials for git.

Specifically something like:

.gitconfig:

...

[credential]
    helper = store

[credential "https://github.com"]
    username = <user>
    helper = "!f() { echo \"username=$(git config user.name)\" ; echo 
\"password=<pat>\"; }; f"



The above of course sets _ALL_ github.com connects to the same PAT, and also 
stores the PAT in plain text.  So be sure to set it user read-only.

(There are additional settings you can make so this configuration only applies 
to a specific director.  See includeIf and gitdir.

Doing it this way avoid ANY changes to bitbake/openembedded and/or layers.  Git 
itself handles all of the credential issues.  (There are ways to use a more 
secret credential handler as well, but the above is what I do.)

So IMHO, our recommended best practice is do not hardcode ANY credentials into 
URLs or bitbake, recipes, etc.  Instead (for git at least) use the credential 
system it already has to do the work behind bitbake/OE's back.

--Mark

> rday
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9453): https://lists.yoctoproject.org/g/docs/message/9453
> Mute This Topic: https://lists.yoctoproject.org/mt/119260423/3616948
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

