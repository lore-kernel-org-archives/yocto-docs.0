Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5A0CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 10:50:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web01.20022.1761821445923865812
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 03:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GgWBsJP8;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5i4ZdxPx8iFEjWrABu98D1nRBl0DfK8Qc3cJTL/dlPE=; b=GgWBsJP872/1giLR2qo3Fh7hb1
	/TJgIeoBJ+lbMC0gCdwFGloN2XTcSyCyFQyyDDNw7oZLM9I0hKgLxmDH5ZjLm5iSx+z6Yj5O0ao8t
	54s09+AjxdzZhwcgNY+4cUYVp0z/oH/Rdc+D+PpRkaVO4gg7oxdyiUZbfRjCLyYHA2Srjh14/QX87
	iAvH4J9LnJSlk+bPfAkYAnLc1tJvquIWs1g66MV1uELKb9W5U9cFtjl17MMxogdUZuCTIX5aYKeTV
	EilrMm8XIhg2gAPAmbbFCqzmJtPJvwB4SAfp6vtCG+BAYuZUCYoxCoPXenA2OhPXbX2Ctk1lga4/+
	sFVjr97Q==;
Received: from [147.129.179.166] (port=38228 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEQEo-00000001p3v-1p6J
	for docs@lists.yoctoproject.org;
	Thu, 30 Oct 2025 06:50:43 -0400
Date: Thu, 30 Oct 2025 06:53:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: i may take a crack at writing a section on FILESOVERRIDES
Message-ID: <e91d023a-dc34-656c-cbf6-05bc0fd15a71@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 10:50:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7913


  related to my earlier whining about how much documentation was being
(IMHO, inappropriately) dumped into the reference manual, i'm looking
at the section on fetching:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#fetching-code

and how there is that lonely sentence referencing FILESOVERRIDES:

"The OpenEmbedded build system uses FILESOVERRIDES for scanning
directory locations for local files in SRC_URI."

  i think that feature merits a comprehensive sub-section under
fetching (pulling out most of what is in the reference manual).

  also, as much as possible, i think the docs should refer to actual
examples ripped from oe-core -- for this feature, i would bolster the
explanation with the perfect example of using FILESOVERRIDES:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-bsp/formfactor

  not going to do all that right this instant, but i'm convinced it's
worth doing.

rday

