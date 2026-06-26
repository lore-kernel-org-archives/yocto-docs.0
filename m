Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA53CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 12:07:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33571.1782475648241187512
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 05:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vT5Pd6fM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fGCpOyFYQfFDJaiZoWQYU+QDMQfs2tIbabBwJ11/WVU=; b=vT5Pd6fMeYnfPEQZBzMJN6WQzw
	yyvgiukU+OTCgSzUOQ5Hmy3eyfgvTJk+WjczIpiWYEf90wYkla9bd4wykYdfhc7oiKGg51PTlYRkd
	NROSCd4kGRHDvAG6+mIEFE+vRXp8PEKyNGFTXE98l04zpNnwSL+wWr+IqWy0IeD9ml6zQHn4Um1z6
	iqq/IKBd3ninnj83S16g6wEhA2GE9RWh2NJ4NA6sLdROVUap+gAZ/sQcZ0ZBShnqAk4CD+D1SEHz+
	tDhls61qHZn/bwt5Pr0P8leb6pUph2HUQdEZloK/UHHcWaU0/pepW/FY+ZskwH/ClTrFnwLeDlxR+
	s3yvUanw==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:59574 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wd5LA-00000002xBb-2bkg
	for docs@lists.yoctoproject.org;
	Fri, 26 Jun 2026 08:07:26 -0400
Date: Fri, 26 Jun 2026 08:07:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: can you EXPORT_FUNCTIONS a function which is not a task?
Message-ID: <59def713-f3d7-8125-0370-69a20624c106@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 12:07:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9908


  digging into that whole class function inheritance thing as
explained in the bitbake manual:

https://docs.yoctoproject.org/bitbake/2.18/bitbake-user-manual/bitbake-user-manual-metadata.html#flexible-inheritance-for-class-functions

and the first couple paragraphs:

"Through coding techniques and the use of EXPORT_FUNCTIONS, BitBake
supports exporting a function from a class such that the class
function appears as the default implementation of the function, but
can still be called if a recipe inheriting the class needs to define
its own version of the function.

"To understand the benefits of this feature, consider the basic
scenario where a class defines a task function and your recipe
inherits the class. In this basic scenario, your recipe inherits the
task function as defined in the class..."

  bounce back and forth between talking about inheritance, first,
simply of "functions", then switch to referring to "task functions."
so which is it? can you export non-task functions? does that even make
any sense?

  i tested by adding a non-task function (base_do_rday) to
base.bbclass, did not "addtask" it, and parsing did not complain when
i added it to the EXPORT_FUNCTIONS line. should that have worked?

rday

