Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A649BCD6E4A
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 11:00:25 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7765.1780052418860226488
 for <docs@lists.yoctoproject.org>;
 Fri, 29 May 2026 04:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=sZoziRrT;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S6tcjIk7HOwgepMBGm+I6FVZl2yNSdpjRJJD0KlmrlA=; b=sZoziRrTwW647HEoMioNYxTj0P
	T8h12XiZ2bLOYvb6cGlXO+77KRp0lAlhhg7PA1dskC06ZEUyuMH+w57bdXh/amp/u+qZWpP1sxov3
	rZ0fmI6edzIFFDW/zuoIha5ib5e6zOMP32wjXum0Gynob9cgIXwax+xMNn10d4XTJomHMlil+Teqj
	0rOtuM8FLYn9w4Nj3dkzRyPxc7c7IBuVgwEBaoIkyAWUE/gmaqdyChLSSP6wRTywn6HhffhLHnUYP
	Eaixnl9uJwvd9eLT6Qx6yntdmwsgeVJSjwOJmqxyHaYewBG/Kvl46R/Oyd7Z8b5WbbJhXvBAt74LD
	PRL71mdQ==;
Received: from [147.129.179.166] (port=58184 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wSuwp-0000000DIQo-0jES
	for docs@lists.yoctoproject.org;
	Fri, 29 May 2026 07:00:16 -0400
Date: Fri, 29 May 2026 07:04:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "FILES" glossary entry does not mention including "dirname/*"
Message-ID: <b3fa7dbe-ace4-86ea-b747-fce12c32125c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 29 May 2026 11:00:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9540


  explaining to a colleague how to properly define a package's
"FILES:${PN}" value, and noticed that the explanation here:

  https://docs.yoctoproject.org/ref-manual/variables.html#term-FILES

has a subtle distinction from the default value in bitbake.conf. in
the glossary, the sample setting:

  FILES:${PN} += "${bindir}/mydir1 ${bindir}/mydir2/myfile"

shows how to include an entire directory -- just list the directory
name and the inclusion is recursive.

  my colleague had initially used the notation "dirname/*", and i
pointed out that the "*" wildcard was superfluous since, you know,
recursive, but he showed me the sample he had used from bitbake.conf,
which *does* include that wildcard:

  FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ...

i couldn't immediately explain why bitbake.conf used the wildcard, as
the only difference i could imagine is that explicitly using the "*"
wildcard would ignore hidden paths, but that seemed like a weak
explanation.

  is there some subtlety i'm missing?

rday


