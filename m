Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE20FC4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:00:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.878.1698764412419542938
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 08:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=WwGEZ8Oa;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8p+nvPVmHmFADpf318l2trMClnu47rogeHRx7GS7TjI=; b=WwGEZ8OaVY7E4C8m2GJKdwuObl
	xkMQeI5BzUtyDH0AlFSBDvN/IMYB0KXRc4IvGRvGWaDrQSeoTKQxwA6m8q8sVIoPwSF7IXw4h6vnB
	9RPNVfNNeoyRpnA3UgobWKar/CKBrmfjtyKWx0kt3WpugHt5UfO6QFzabclJoRtbvYZDiLfVlcw3S
	i4E4DOIORfxgb7vVwv9cjlpsPD67F+LXeQoDMRsIGufFKNQgTPT0Z/GR71saU8qgb76TM5cMgovuy
	FNCCzyciv1P3P6H6GX/rQg8ANz1WmmLgca+DYYwsH1t3hqeeM8SasA+JM3NbB6U49SG3zsKMf/Tcd
	ClF5V9Mw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:33240 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qxqDn-00CQqr-34;
	Tue, 31 Oct 2023 11:00:09 -0400
Date: Tue, 31 Oct 2023 10:59:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: michael.opdenacker@bootlin.com
cc: BELHADJ SALEM Talel <bhstalel@gmail.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] overview-manual: concepts: Add Bitbake Tasks
 Map
In-Reply-To: <da2e6ce3-4338-4273-816e-8fba92f6e0ca@bootlin.com>
Message-ID: <af4eec13-87d9-d4d1-6f38-2a224fb3dd6c@crashcourse.ca>
References: <20231027155312.577723-1-bhstalel@gmail.com> <da2e6ce3-4338-4273-816e-8fba92f6e0ca@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 15:00:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4542

On Tue, 31 Oct 2023, Michael Opdenacker via lists.yoctoproject.org wrote:

> Hi Talel,
>
> Many thanks for all this work! See my comments below... Sorry,
> mostly nitpicking and style improvements, but I do it before Quentin
> Schulz or Robert P. J. Day wake up ;-)

  too late.

> > +about where and what bitbake does as a job (tasks) in order to generate
> > +the final recipe's package file.
>
> "where" sounds weird for a computer task, and the wording sounds unnecessarily
> complicated anyway. What about instead?
>
> "to have the full picture about the tasks that BitBake runs to generate the
> final package file for the recipe."

  rule #1: eschew superfliage. that is, don't use unnecessary words.
why not just, "to understand the tasks that BitBake runs ..."? or, "to
understand how BitBake generates the final package file for the
recipe"?

> "``sayhello`` depends on ``libhello`` at compile time as it needs the shared
> library at compile time. It also depends on it at runtime as the shared

  you're saying "at compile time" twice in the same sentence.

> library loader needs to find the library in the root filesystem."

  where else would it find it other than the root filesystem?

> s/rootfs/root filesystem/
>
> > +
> > +#. Create a Git repository for each project with the corresponding files
> > +#. Create a recipe for each project
> > +#. Make sure that ``sayhello`` recipe :term:`DEPENDS` on ``libhello``
> > +#. Make sure that ``sayhello`` recipe :term:`RDEPENDS` on ``libhello``
> > +#. Add ``sayhello`` to :term:`IMAGE_INSTALL` to integrate it into
> > +   the final rootfs
>
> Same here

  is it necessary to qualify this as the "final" rootfs? as opposed to
what other rootfs?

rday

