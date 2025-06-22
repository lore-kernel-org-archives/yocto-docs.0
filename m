Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E408C7115C
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 10:04:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.23650.1750586688284054612
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 03:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=iszhLfoL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bmQUuTRnateAgoooAZGbgtb+ymxqtTS1BSbcJ9t4h6o=; b=iszhLfoLiGO6zVbauf4XpyavHb
	LqDW+F6Yw91VHl/m0o+xQX9hZ0h8raD6wrqVOMIBb9rLNJI4aeSaoTnjRHnJEqKKINuLiZHJ4GJiV
	iAyHs41gcmaB4WQBHIes0hg396y1KGPWfcH7ykxIUHPt35WuwW26O48CTOUT85d6XEbVoK6B+Hb2e
	Hh+ARql7UOauqw1mVuUKUsPVg/Y+nyaSF/2zttCE1aUT6LYIpjLYFCcBNKXF4WGLWEPqRlHIaDjuT
	KzAqKJd+2RFPfFdHowN6qDSEvOoSnn7HM+jMJOCpadiwueXt1ShSOUFhNEJKJtig0FIw7QFJTXl9/
	vSJIWwVQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:45356 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTHZ7-000000071u7-3Q7d
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 06:04:46 -0400
Date: Sun, 22 Jun 2025 06:04:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: dev-manual: example for installing multiple versions of same lib
 out of date
Message-ID: <a4daa432-080c-6b34-c610-bc60344b2de6@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 10:04:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7137


here:

https://docs.yoctoproject.org/dev-manual/libraries.html#installing-multiple-versions-of-the-same-library

the example of "clutter" is out of date, but there is a current
real-life example with the "libpeas" recipe here:

https://git.openembedded.org/meta-openembedded/tree/meta-gnome/recipes-gnome/libpeas

and the "eog" recipe file even explicitly depends on libpeas-1, if
anyone thinks that section is worth updating to match an actual
recipe:

https://git.openembedded.org/meta-openembedded/tree/meta-gnome/recipes-gnome/eog/eog_47.0.bb


rday

