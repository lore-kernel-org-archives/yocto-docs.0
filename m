Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F439C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 09:18:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35509.1789118321055709002
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 02:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=XHSMbMJK;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=PifP3Dm4ekapHLVJqKNVm6NfvpK+UbFaBM22YCMtKdM=; b=X
	HSMbMJKNGllKpYAd5zh/UANWnUsncSeHCLqLoA2kRIafKn9skIxnbT5me3hEOdjBo3/BMa4k90XJd
	K6qI6dVKIdf/REBKvy3ibLKroWY1AimG2+v4HzZt8hQUAjUV3UzPkkE9zhN/OkZuVPpeXt4JTlTNv
	nrmqisXW+YDmHHrLKH+6zHxYTgOb3fLTwjzgf17mfkVcZV7qCTedcDt3EWvZtwhSizLV2XaHz7g/Y
	5ZlzK6xzWM917oFCblb5p0dyil1a0z9diZQSfQ1QFs6qKf21ASA41ibWUnwqxw0oFfuAcBualP/I9
	8cuLVSz8D1rybfpK+KJYcv8JXBEyqArPw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:48326 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x4xOz-00000002roi-2BgR;
	Fri, 11 Sep 2026 05:18:39 -0400
Date: Fri, 11 Sep 2026 05:16:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Does Ubuntu 24.04 and newer still require AppArmor tweaking
 to run bitbake?
In-Reply-To: <DLCBCIBSXUHT.2SR3V23FN8VPD@bootlin.com>
Message-ID: <f983a674-d30d-7659-45f8-ac32a1187c41@crashcourse.ca>
References: <ec2658dc-005e-f6cc-d64e-0a1c15e992a7@crashcourse.ca> <DLCBCIBSXUHT.2SR3V23FN8VPD@bootlin.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 09:18:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10452

On Fri, 11 Sep 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Thu Sep 10, 2026 at 2:57 PM CEST, Robert P. J. Day wrote:
> >
> >   I use stock Debian so I haven't needed to mess with this, but Ubuntu
> > once had this issue with AppArmor:
> >
> > https://developerwiki.proventusnova.com/Error:_BitBake_+_AppArmor_User_Namespace_Restriction_Fix
> >
> > If that's still a problem, it doesn't seem to be mentioned in the
> > docs.
>
> I don't have a running Ubuntu 26.04 distribution but I would say it is still the
> case if 26.04 is still running AppArmor.
>
> Users will face the same error as before which is:
>
>   bb.fatal("User namespaces are not usable by BitBake, possibly due to AppArmor.\n"
>            "See https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-notes/39890#unprivileged-user-namespace-restrictions for more information.")
>
> In OE-Core's meta/lib/oe/sanity.py.
>
> This sounds like something we could say in the docs. Would you mind sending a
> patch for that?

  seems to me that the proper place for this would be a "warning"
admonition at the tail end of this section:

https://docs.yoctoproject.org/ref-manual/system-requirements.html#supported-linux-distributions

i wouldn't want to get into incredible detail there, just point out
that starting with ubuntu 24.04, you would get that namespaces error,
then refer the reader to that discourse link for the solution. does
that sound adequate? i don't think the YP docs need to reproduce the
solution in its entirety.

rday

