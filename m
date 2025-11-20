Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FF9CF885C
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 13:48:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34527.1763646509077806306
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 05:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=cQYsyVAx;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X3ccJlKDX1H3/VJFrMLRGoLGD10R0ErrlIS+Ghr9A7g=; b=cQYsyVAx7YtkOKRpCIVzL01GlS
	5dhpGAZ9qtNDnJUfzaSSAVlD6ADgerioyGq0+JX1oqKV41/fzAParCvq1A1DjXbueCMvHfSfrsqrg
	NsBWlUb87lCCLFrGLIeS5TNp+iJjSQMAj5JA3VPec5dCH2rSEUR7MNUIayjkjQ/serd+u/55U0JB1
	0GpvSaXDFhaxQwSST2VEVUhB6HYcwnbHj6dhafoQ/bZ/XvQZt4qCPddlJfBC6js8qbdewfVK3JU4k
	vpMfVEjt60BBW4eDOqOPpKd5eaKmZXhdNBLrZm+JI01/YptLSIvQ1V6EA9YGp3KmSYpk1ywFp7XAj
	H+BTzqrQ==;
Received: from [147.129.179.166] (port=53342 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vM51L-00000006kit-3O9Y
	for docs@lists.yoctoproject.org;
	Thu, 20 Nov 2025 08:48:27 -0500
Date: Thu, 20 Nov 2025 08:49:06 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "bitbake-setup" suddenly works differently from QS guide
Message-ID: <00a37b3f-b40f-f58c-3af0-3512f1f40c2a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 20 Nov 2025 13:48:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8099


  something seems to have changed dramatically since yesterday ... i
was following along here:

https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/#use-git-to-clone-bitbake-setup

and i'm sure yesterday, the build directory that was created was the
verbose one as described on that page; something like:

Enter setup directory name: [poky-master-poky-distro_poky-machine_qemux86-64]

  suddenly, it's only "distro-poky-master". i'm confused.

rday

