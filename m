Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C203C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 14:45:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.27330.1750603548335580191
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 07:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Ydc8u0ak;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=59sVulDCMOqWjrDAOlTnep+VOkr6KUXqUk/4mf+Tnlo=; b=Ydc8u0ak4SH9mNus2OuK74kwyW
	t2snmasHA4E559qkRYlm6+NKY6P3spG/sBaINT+WIbjbhQoG9Wxr65YO4VBKuIRQ3F6gbuqw8vo1v
	vxGGp8Er4A/W7sjT9MPkAuECTWlPGlmkwzNuxGlZCoRP6PclE8oGg8oOqjhIhI6VvfXQoWMqpxRHb
	K2YoMXgRNxRn60XCFj60yVxheJXxqOab8px48zJZEuxVR1x7nXk8OqO1MCmWqSwIQg1YdZEy4kybX
	lLCdSrQni0xWPxMeCOYNTyeSXCQlcjDwFVIzyOUpBE1wqbQLH1YLUts/7AC2V3PkrE9qvRkUWbZPH
	TgzIj80Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:48898 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTLx3-00000007rKj-3DWb
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 10:45:46 -0400
Date: Sun, 22 Jun 2025 10:45:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] should replicating offline build use "--runonly" or
 "--runall"?
In-Reply-To: <184B5224024A6359.12316@lists.yoctoproject.org>
Message-ID: <92dee52f-385b-9134-1364-c1f6e673b37a@crashcourse.ca>
References: <184B5224024A6359.12316@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 14:45:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7140

On Sun, 22 Jun 2025, Robert P. J. Day wrote:

>
>   this section:
>
> https://docs.yoctoproject.org/dev-manual/building.html#replicating-a-build-offline
>
> advises to fetch the sources with:
>
>   $ bitbake target --runonly=fetch
>
> for the longest time now, i've used:
>
>   $ bitbake target --runall=fetch
>
> although i do recall that those behaviours changed once upon a time.
> so is that still the appropriate command to use? is it worth adding an
> explanation at that point as to the difference for people who might be
> curious?

  as a followup, this section:

https://docs.yoctoproject.org/dev-manual/efficiently-fetching-sources.html

refers only to "--runall=fetch". so it seems inconsistent with the
earlier section. or, at the very least, it has the potential for
confusion.

rday

