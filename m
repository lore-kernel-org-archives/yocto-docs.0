Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E4DCD6E45
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:51:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.12292.1697014305491892538
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 01:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=a+/+FqUb;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RUAuUCswQy/HANuK4Eoj6NhLM/F1HBBS4cYsCL63pZU=; b=a+/+FqUbUk6PlLt6QLlWgehURi
	uNXaCndjKfhhAC9ICIyrj0l5ZXszgsOa88qwM3CsQXRxa/u9wzgT5yA2DAEQPV/x+VViWwSvUr+5o
	UBaiTFi6z7w/7GjF1afOtBX1XOK3//0eTWv0GRun5z6q8VMmtX3KaBO1EmxsleNnpHGvqK756a7VP
	o9kW3tMudkvorhp874+UhpxgLolDFMZC/FYrU1ed7suIT1Ino+9eF1Ef3t7AuMaTfadzZM/JV6HWk
	KeXk8GEn7BCcWZdBVUtPu/73lVEnNrpKUJ7cw6WXfVXzvkGh0b04mSXR0Iuhkn8PEHWfnG4RvTBJH
	PKe8Idlg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53416 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqUwN-006gw8-2f
	for docs@lists.yoctoproject.org;
	Wed, 11 Oct 2023 04:51:43 -0400
Date: Wed, 11 Oct 2023 04:51:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: does bbappend wildcarding cover when there is no version string?
Message-ID: <b69076ea-5ef4-6c5a-9aff-9a99ff19ce@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 08:51:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4338


  can't remember where this is properly covered, but we all know how
version wildcarding works with bbappend files, as discussed here:

https://docs.yoctoproject.org/ref-manual/terms.html#term-Append-Files

but do the docs explain what happens when there is no version number,
such as with the perf.bb file?

https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/perf

in cases like that, AIUI, the only bbappend format that will work will
be perf.bbappend.

  this might be worth clarifying in case readers get the impression
that the most general and all-encompassing wildcard pattern would be

  perf_%.bbappend

rday

