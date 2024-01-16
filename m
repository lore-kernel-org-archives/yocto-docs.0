Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8851AC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 12:11:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.11983.1705407106268342676
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jan 2024 04:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=B6BP4bmD;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wKbaXpkstEMyWmLCE4Q0Uwa8c+j2ihPRIf8GGv878bs=; b=B6BP4bmDg1Jb2XqYBHcM4YahHF
	KqATvxw9jeZUTYNQpo15i+mP9ne/azTWrROJFF/o0+Y1tMws1PzXimC40qJ5m/0nxLdBvi8DFITRR
	jzubx8k1vOuxrn3K2e2aSFVG9Org4KdxiX9eoFyky0htYVfGuiodCCHbgAho0Pvn+1yxIB+1ru+nJ
	3lq8ka0obA1vNEhPVLVq2WbQpamGEQKzgQR7QhgeO1m0vz37pli47sBipKocoUUJzTmE4L4hghIs9
	1s+rFJA+N2CIHmz+JLWYlRfm+QMet/vMeq7czMUjc0ZMYZjTBR59Hq0rmLuo/pCsdGbalL7K/u6Zz
	/NVJrCJQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49764 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rPiIB-00CAo0-1G
	for docs@lists.yoctoproject.org;
	Tue, 16 Jan 2024 07:11:44 -0500
Date: Tue, 16 Jan 2024 07:11:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: question about EXPORT_FUNCTIONS from bitbake user manual
Message-ID: <c2e177fb-6447-98f-fd51-8017ea87294a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jan 2024 12:11:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4783


  hoping that bitbake doc questions have been subsumed under the YP
docs mailing list ...

i'm reading the section, "Flexible Inheritance for Class Functions",
here:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html?highlight=inheritance#flexible-inheritance-for-class-functions

and i understand the point of examples like autotools.bbclass defining
task functions like "autotools_do_install" so recipes that "inherit
autotools" can define their own "do_install" function that, somewhere
internally, calls "autotools_do_install".

  but what if the recipe that inherits autotools does *not* define its
own do_install() function? would it still pick up the
autotools_do_install? what if that recipe tried to:

  do_install:append = ...

would that even make sense? which install function would it be
appending to?

  in short, while that section explains how to invoke the "base" task
function, it is not clear what happens if you don't invoke it that
way, and just try to take advantage of the "default" do_install.

rday

