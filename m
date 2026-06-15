Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79D4CD98CE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 20:21:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.138770.1781554873824909986
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 13:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=sJgFcSSz;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ffihto1rZb9scjXcUXP+OyHozBiwVReUzWd2mHi0ifg=; b=sJgFcSSzO9RSsUcbcdcdQhHjir
	1XRZfU9tFtw3r/k6s/+YHkNBW9kCHfHa0de/QgA6PgUTUQAOvF40oRcYa0DYJIwclbPLyx76vSBqJ
	6o7lSeAS/UbbQ1svBHX/F/EeR4cNeXbIVm33fXrCJ3417n+cs/UoY0y9/K7RcoVwEAHbhlxY7Gv30
	UBl7IA4kKfWGQmqv5pJ5z0QbhNSOgejp+T/ZWwhDBAEOq7VOunDeuDhDxnsV/Yrr5hjJPZJPdlntz
	7bHv6CASdIdZ882Z7Kcdw77OKQgmL97OxVbcwA/uaV7oPZML0UvrNU1QL8x+0sCslosluEYbwXwgx
	D7mmdVUQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:45234 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZDny-00000005Dj6-45YI
	for docs@lists.yoctoproject.org;
	Mon, 15 Jun 2026 16:21:12 -0400
Date: Mon, 15 Jun 2026 16:21:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: where to add a couple things related to kernel metadata?
Message-ID: <69c67426-c2c4-0d46-7605-5d1473db6d16@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 20:21:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9726


  still poring over the docs and a couple questions about whether to
add some content, and where.

  first, in the entire kernel metadata syntax section:

https://docs.yoctoproject.org/kernel-dev/advanced.html#kernel-metadata-syntax

i don't see anything that explains that in a .scc file, the "include"
directive can take a directory as an argument (which would recursively
consume all .scc files within). a few examples from kernel-meta:

bsp/intel-x86/intel-x86-32-standard.scc:include ktypes/standard
bsp/intel-x86/intel-x86-32-preempt-rt.scc:include ktypes/preempt-rt
bsp/intel-x86/intel-x86-64-preempt-rt.scc:include ktypes/preempt-rt
bsp/intel-x86/intel-x86-64-standard.scc:include ktypes/standard
bsp/minnow/minnow-preempt-rt.scc:include ktypes/preempt-rt
bsp/minnow/minnow-tiny.scc:include ktypes/tiny
bsp/minnow/minnow-standard.scc:include ktypes/standard
... etc etc ...

i guess one could just add that to the final reference section there:

https://docs.yoctoproject.org/kernel-dev/advanced.html#scc-description-file-reference

but that seems like devaluing it as a cheap afterthought, and it seems
like it merits more than that.

  and second, there is no real explanation that the "include"
directive can also take arguments of "nocfg" and/or "inherit"
(examples under "kernel-meta/ktypes"):

preempt-rt/preempt-rt.scc:include ktypes/developer/developer.scc nocfg
tiny/tiny.scc:include ktypes/standard/standard.scc nocfg inherit

the only mention of those attributes is as part of a code snippet
here:

https://docs.yoctoproject.org/kernel-dev/advanced.html#kernel-types

but it seems like that also needs more explanation than just showing
up as a comment in a code snippet.

  thoughts?

rday

