Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AFFC71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 13:08:55 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12762.1749733725286120501
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 06:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lGoM6KLS;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kStJSQdeU/mTss4PdUhxaKHZT4oi11i6pttkI4Nres0=; b=lGoM6KLSe1PVKB5NcFK5iHkDCF
	tTVE5v4S8hgA/rUsl3n9QJ2lkXAGVJUfUP8irFv2xg5bZG4haqgcirExXeXBjQmr0rnDp6wpob57c
	UmhoMF2AekwuwdlGIokLknB+NvrYQFp8KeUSZ7PiDM+11lQpGuMPTzZleL6EzKfKUVH5ezAN+iRb8
	5sI5HX83kystjnyjVDF7INtwSuTOsFs4vbB7wGW0ia1gx+XnOE9VZGAoTf+3CxQqdDyOWBpLWT1nS
	YmFzDWiQ+P+c+IAp/SY/gNphomqenpgM8a1hpwZSYFIOk+mBvep95yVkL5NBUdT2+dx47O7ZZWWi6
	dbKfm4UA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:60946 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uPhfe-00000000XoZ-34bb
	for docs@lists.yoctoproject.org;
	Thu, 12 Jun 2025 09:08:44 -0400
Date: Thu, 12 Jun 2025 09:08:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is there a relatively current "hands-on kernel lab"?
Message-ID: <1416a331-4355-0197-2b32-b165ffab41f0@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 12 Jun 2025 13:08:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7067


  if you search for YP kernel lab, you probably end up here:

https://wiki.yoctoproject.org/wiki/images/4/42/Kernel-lab-2.6.pdf

which is seriously old. is there any more up-to-date kernel lab that
should be linked to from the docs? or has all that been subsumed into
the kernel development manual?

rday

