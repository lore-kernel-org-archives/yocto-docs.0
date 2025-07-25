Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1996AC87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 12:05:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.17891.1753445139970143849
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 05:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=FNej54kG;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0BUcx9Nyc7tNyzuZeDaWoiE2DiMNCvTBlffai6d6Rf8=; b=FNej54kGl1IjpklTQRdlWKWkQI
	i0QYZtrg5gEvkp3TOaeFh0utcNYtgu3Ckn2kiCTB3RDuOtF85TTTDQjCOjeMSG0RCegAAdzvtdygM
	HUrP/HH0XLvMnS5zu6evxcHLQF0L7EBO1ym/VQR9O8P2EjEzFiJlbf2Kz2m1043o57DjQAZLJvzHz
	y4CU1iWzUXEjlX2kWhLbxx8A5NHHpbV6XdEQnkg9N+NFoeusP/UmCt77kPBmgy/a8dX2gis/4zJih
	in49aMcL23UVR9rs48IZridRUktWhPwU+kcMZBcc2iPEWja14S7VfH6OuNzntVRpHA2Ok0gOW1orO
	gdkw8vkQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:48086 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ufHB9-000000014SK-0xJO
	for docs@lists.yoctoproject.org;
	Fri, 25 Jul 2025 08:05:38 -0400
Date: Fri, 25 Jul 2025 08:05:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should docs explain "sstate-fixmedir" flag?
Message-ID: <b6f80b31-dcad-9f28-ae73-65260deb94b6@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 25 Jul 2025 12:05:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7385


  just noticed that in addition to task flags
sstate-{inputdirs,outputdirs}, some OE tasks take advantage of the
task flag "sstate-fixmedir". should this be documented? i'd never
noticed this flag before.

rday

p.s. i see some other sstate-related flags now, like
sstate-lockfile[-shared]. are these meant to be user-modifiable?

