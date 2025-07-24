Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6928C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 20:31:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.3832.1753389062644509135
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 13:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=X2/q6Ene;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=71f85j33uGrctH1DX2suDd6kwY5aTfmQK8EAfSPApsE=; b=X2/q6EneUTfkXVPf7fC/tH8VsG
	dhoF1/h+E1ICDrCcF4qr2/2nNh1zee9Z02rxXAT6x9OsKiUx1yxePCohTzjaFHqpxRUsHAN8YBexN
	Og6tRYfum7yimXuiTMrwYl3epqtedDzwia8B27ruIFlhoZ8KtgGbJ6xtpBrDtl/9rc1/9+BC9SmRM
	N6Ry1geoYc+RzdqN/4C1HrR0OHN2YS27BkZcnpW1YdXsbWBA/P5yk03poOV0brMkUG4bDzj/e4pDn
	BDqKIVYfe8vHxIElsbhxE7522dWrb/ZriZz2nT451jSt6CPOCxuxj+WgBiNPxSmPlgo9mx2rMKfmP
	aP9WLHNA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47338 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uf2af-0000000F8aV-38Wk
	for docs@lists.yoctoproject.org;
	Thu, 24 Jul 2025 16:31:00 -0400
Date: Thu, 24 Jul 2025 16:30:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is IMAGE_PKGTYPE of 'tar' even supported anymore?
Message-ID: <96c02217-f9fc-488f-d3ee-074fddd87642@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 24 Jul 2025 20:31:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7379


  docs sort of suggest it, but code sure doesn't seem to support it.

rday

