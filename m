Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4CDCD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 15:38:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11063.1780673895192024786
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 08:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=VBVT1eZV;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v8ufbQ17uegFco67jnLHtW9hPdN4uTVSFduhcgze0hc=; b=VBVT1eZVlFdmptvvKeAwU0LYL9
	N9Dw4SkQ1jTHq9Pem4GadT7P3TtXEqz4m4ohefq0/RjYz4c28JHjwqNK1Su4iP0RmcGavSYFKSFGz
	FEpR+1eVD3LdOHGIqdoRHwfUKNkBM90+5XxGICC06Il5UzfMZ+FsX9/8cq6YROjcFhmpP2XO57Y7M
	2d/L6hdm/ggyaYJh2/kU3XwhWjNQQBeYlTrF7O7DdWZMCCcxUh2t8dZA4PBjLL/nAdM4itlQ+G/Hm
	EgZXQoUG5SqlHr07NItd91p9R5jA6T2b0j3ohvJQ9WfDRy5pWwH7OBTHgAAbPQjxrSAx70jb/2RKw
	qphM9JaA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:51874 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVWcd-0000000DzWh-3p8u;
	Fri, 05 Jun 2026 11:38:14 -0400
Date: Fri, 5 Jun 2026 11:38:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: antonin.godard@bootlin.com, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
In-Reply-To: <b5010b6b2373955c252760ef900d860b3480d85d.camel@linuxfoundation.org>
Message-ID: <e8e3de5e-8cd0-3a86-92a5-11bc0e943ecd@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>   <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>   <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca>  <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org> 
 <3bc0de42-2b65-212b-c8ac-39898b4fc0e4@crashcourse.ca> <b5010b6b2373955c252760ef900d860b3480d85d.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1519076644-1780673903=:2541506"
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 15:38:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9614

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1519076644-1780673903=:2541506
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 5 Jun 2026, Richard Purdie wrote:

> On Fri, 2026-06-05 at 11:12 -0400, Robert P. J. Day wrote:
> >   i should point out that the same inconsistency about required versus
> > suggested occurs here:
> >
> > https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status
> >
> > where it claims that the OE system "requires" patch upstream status,
> > but follows that up with that each patch "should" provide detailed
> > information. i deleted a few patch "Upstream-Status" lines and parsing
> > worked just fine.
>
> I hinted at this but let me be more specific. Try a build ;-)
>
> OE-Core definitely requires Upstream-Status.

  i did ... so non-OE-Core patches apparently have no such
requirement.

rday
--8323329-1519076644-1780673903=:2541506--

