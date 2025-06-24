Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6A2C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:00:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.2612.1750748416518286751
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=jsd+NLdu;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z+TK9IlL3ZLq8aYlp5Pluxb5ScjRvUpGoEVpliH9sk4=; b=jsd+NLduZX9ukbbJQi2h8cDIT0
	GOHDdSIWCzOIh/CkaDX8ZQwtYYTHB5Q3a2WkDAAzU6geCIW7QUnSUBsruvm0VWYiBikWorFO2hv4U
	BKyOUOBuUGkQLCgEJR8B+UiPocKAeDU8a6kVibrR22evqQGJPFQQFMBtUQ6+Xx4t+Nn3kjJCOSmVu
	A2fgECOQiJzDoSdOgxw9HzMzgywRHEzZssUOPYNYKPOkoB9aQvLbIC7zPpcgRbJSUxc7dimD8i3QK
	I23cOgDcOzLTY9Mwrk5/jRLism/HRd39fGsvbhnooodQp6LwO8bdRQIDp5GrbrzW7XIy8OcSUudCd
	yo+mEY6A==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:38750 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTxdY-0000000Dgk8-2AMS
	for docs@lists.yoctoproject.org;
	Tue, 24 Jun 2025 03:00:14 -0400
Date: Tue, 24 Jun 2025 03:00:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: i think "Fetching Code" should have a separate section for
 checksums
Message-ID: <99b9b9ac-9700-9f4a-1167-7a8fa2dcfb42@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7173


  recently, i submitted a short patch for this section:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#fetching-code

that replaced the reference to the git example as the current git
recipe didn't match what was there, and i replaced it with a pointer
to gnuplot, but quentin rightly pointed that that lives in meta-oe and
it would be better to find something in oe-core.

  after further pondering, it seems that checksums really deserve
their own subsection as there is enough to warrant that. i would do
the following.

  i would start with strace:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/strace/strace_6.15.bb

as a basic example that needs only one checksum, allowing the
simplified form that does not require a "name=" assignment.

SRC_URI[sha256sum] =
"8552dfab08abc22a0f2048c98fd9541fd4d71b6882507952780dab7c7c512f51"

  immediately after that, i would jump to jquery:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/jquery/jquery_3.7.1.bb

where naming is clearly required for the three fetched objects, unless
someone thinks docbook-xml would be a better example:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb

  finally, i would definitely add a note that there is a single
bbclass file:

https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/gnomebase.bbclass

that adds a named SRC_URI which would explain the number of recipes
that have a line related to that which seems to come out of nowhere.

  the above seems like it's enough to justify a separate section on
checksums.

  thoughts?

rday

