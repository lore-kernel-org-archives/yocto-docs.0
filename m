Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBF3CFD65B
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 16:04:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9521.1767801848427792951
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 08:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=JA2XxqM/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=plz1kCQOGm9HkfatHfz7cepUm5IYiTWjbU01RpdCNic=; b=JA2XxqM/8t0Vw4miOo9AeDYc2g
	SZQChtzzbosp9/Xd/apATt76fbYJMZNQQq2uGJkmahlw0SOhpsCRxKiMV5xq+AH4B4zZY2+5kCqYE
	9M8uygayTBShdRL5hUgGsvPlZw6xzfcj1lJbQmNOuxyJtF7w7/7EkZ4aUOLqP0DoaV6Te8M3Sqp1y
	Sl6MAG0Dr3W2wBZ4EC6Drlyga3nQWTwW3nn2iWn8DVsggvSCVb2b99+iZpN7LLw/SoxCpG8L5Yxfm
	oATvozCs8JXTjmcmFXjGBHffEYlNg3oNyIzKUixktKzOaJ7E1YKWoT0S1e/5sR/td0Rdq792yl4vC
	wZDIVQtw==;
Received: from [147.129.179.166] (port=54082 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdW10-0000000FnP2-0FwL
	for docs@lists.yoctoproject.org;
	Wed, 07 Jan 2026 11:04:06 -0500
Date: Wed, 7 Jan 2026 11:07:09 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: my opinion on why i think the docs need refactoring, with an
 example
Message-ID: <a7e2a0dc-1509-aeb7-cab6-ee9f3f1f0a22@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 16:04:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8411


  One of the things that has bothered me about the general OE/YP docs
for a while is that, in things like glossaries and reference manuals,
there's too much explanatory content being stuffed into those
sections, rather than being fully explained in a single place in a
single manual somewhere.

  IMHO, any topic or feature should have an adequately complete
explanation in one manual somewhere, and references or glossaries
should have little more than a one- or two-sentence summary of any
concept, then should redirect the reader to the full explanation.

  Here's an example related to PROVIDES, where much of the same
content is duplicated in both the body of the BB manual, and in the BB
variables glossary:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#providers
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-PROVIDES

  This seems inefficient and somewhat disorganized, since the poor
reader becomes unsure where to find the definitive explanation. There
should be a single location that fully and completely explains any
concept, and all else should do little more than link to that
explanation.

  This would make it easier for volunteers to offer to write
documentation, since the rule would be that they're expected to
explain some concept in sufficient detail, that would be added to the
appropriate manual or user guide, and everyone else would simply point
at it. As it is, I think far too much explanatory content is being
placed in reference sections or glossaries.

  Thoughts?

rday

