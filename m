Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B99AD5B86E
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 21:00:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5283.1765832430438632913
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 13:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=K7Kn+i8T;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DGjBPAPjQFsHG4AewpVn94UKW0RWh0z4NW5uVtQVcLc=; b=K7Kn+i8T36kbnXZH8tNps3PrES
	TXCeTHyB16/fhB02MIUSL70kbUOrZvGyJgQPcdkDAe94J4IFO0oOMjvdIo7xbXZuC/Y/oQd/KUnm9
	T4OG5HdmrLjJMdP0RtMWnocEiQebYrhxiZv2F+g5u2bWUAuuYb+MnNqvnUPt1m4ivtqwYJ9gbDkl9
	O1hST5MuoGuY2QMo0oxtsfwXhkIy88kmJPGH935IbIJMeK/iT9d5DXRKk9pPyFaLxjTYJoWhbgB9T
	F3AgZ0xs63Wr1A4J9r8MlllwsrVnZqG52N4WQWFFqDjljwG0LbPHbr915bs6hjgnmmcanQ7JxUST5
	la8CoazA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34778 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vVFgC-00000004frl-3bPr
	for docs@lists.yoctoproject.org;
	Mon, 15 Dec 2025 16:00:29 -0500
Date: Mon, 15 Dec 2025 16:02:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is it time for a separate YP doc focusing on security/vulnerabilities/CVEs,
 etc?
Message-ID: <2d09b577-b67c-74cf-658e-8b82f29ad17d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 15 Dec 2025 21:00:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8276


  i know i've mentioned this before but, to start with, the dev manual
section "Making Images More Secure":

  https://docs.yoctoproject.org/dev-manual/securing-images.html

opens with three links all of which are more than a decade old. and
further down in that same manual, there are two sections related to
vulnerabilities. given the importance of security in the embedded
space, might it be time for a whole document devoted to the subject?

  there were a number of talks related to this in the recent YP
virtual summit, that seems like a decent place to start. surely there
is easily enough content to justify a separate manual for this, no?

rday

