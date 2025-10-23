Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3E0CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:49:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.18125.1761220185345503560
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 04:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Xn1mtRb8;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EhJ5fcrvKs/hyBaCA6gAHMIjQYgxGp2bOWq3ui1DAmQ=; b=Xn1mtRb83jRxLXzKbSnnrAHPMO
	r1vT8faCpm8pn90paqTsBAxHRKuEDYHvp+bY9G5X+gQp09An3E95kM3kIa9iExym7AYbQwQs0ZklZ
	yEQrIW+4cWg/2WRpCJ5wPlfYP6R8hn7Utt+28v/89g0yxOUqBj3UZOfK+T9OVxKMzSpdxAU4u+T+o
	5R8eXv42uPlehd/kffQ+d+fdashp1aHVFg9fZ4alrUCejT6kR1p3AWkgYogpjSkIfdS+7a1+KNW1i
	5JQqoHSypnfckQj/aU84REYC5zr4b7KpSy0WqWgller+Teu+K4YtHYHbChrY1CWBsrWIw/U12UGNR
	SSmYbpmA==;
Received: from [147.129.179.166] (port=42332 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBtp6-0000000CBG6-330A
	for docs@lists.yoctoproject.org;
	Thu, 23 Oct 2025 07:49:43 -0400
Date: Thu, 23 Oct 2025 07:52:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: *very* pedantic observation about how sphinx spaces bullet lists
Message-ID: <bba108a7-aba1-f4d7-776e-6ebb1431f84a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 23 Oct 2025 11:49:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7784


  something i noticed a while back so i figured i'll just whine about
it now -- sphinx has a curious inconsistency about how it spaces
bullet lists, and you can see an example here:

  https://docs.yoctoproject.org/overview-manual/yp-intro.html#features

the pattern seems to be that if a bullet point consists of a single
paragraph, then the next bullet point follows immediately after with
no apparent spacing (as in the first two points in that list).

  but the instant a bullet point consists of two or more paragraphs,
then sphinx adds a bit of space before the next point -- see the extra
space between points two and three in that same list. then it goes
back to no spacing for the rest of the list.

  that appears to be consistently inconsistent throughout (see the
other lists on that page to confirm). not fatal, of course, just
visually weird.

rday

