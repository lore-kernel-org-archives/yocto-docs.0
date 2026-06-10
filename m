Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF18CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:49:42 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25450.1781110173824723197
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 09:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=SJP75JBB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MYJFU9m5Mnvn/xJwDF2MBXBAXFZQyGa6gafOQHZa+GM=; b=SJP75JBBw097lzX3lbSe29rYqh
	3s/alUeEkpzgtzwaIDSfNlDrPxc3EUJuHhtmNASmag6ho1jD1UwXDTwxTvjHVuSXquqBom7HhrflK
	cd2g/mQIwGHUP3S0BYfiNd5nn1pgc8fToaIjobRlt364o1e+Pz2vDwy8lQaAsuXT6dXO9mgRXABWG
	X7YRagpPbaLhruF7iq5u9IGtzZIes6TQ2s7GXe0Wc//aktlzdx1ulTFZpPliFblVEVSQhoKqFQjXA
	QQOFooFOgrupfdt/5qKY8HXTRfj3GJoWR/VGLhg/mNg3M9TcJ7tLy3+ISLeyv1dMOCl70egrCCBd7
	D4Z7ZE7A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53184 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXM7M-00000009LXh-1cJY;
	Wed, 10 Jun 2026 12:49:31 -0400
Date: Wed, 10 Jun 2026 12:49:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "FILES" glossary entry does not mention including
 "dirname/*"
In-Reply-To: <aa51821d-03fd-4e28-9c67-7d0cf0a2802c@cherry.de>
Message-ID: <6164cd2f-e495-7e7b-0dae-b64362f6bde1@crashcourse.ca>
References: <b3fa7dbe-ace4-86ea-b747-fce12c32125c@crashcourse.ca> <aa51821d-03fd-4e28-9c67-7d0cf0a2802c@cherry.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1276494466-1781110167=:1559767"
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
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 16:49:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9685

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1276494466-1781110167=:1559767
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 10 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 5/29/26 1:00 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    explaining to a colleague how to properly define a package's
> > "FILES:${PN}" value, and noticed that the explanation here:
> >
> >    https://docs.yoctoproject.org/ref-manual/variables.html#term-FILES
> >
> > has a subtle distinction from the default value in bitbake.conf. in
> > the glossary, the sample setting:
> >
> >    FILES:${PN} += "${bindir}/mydir1 ${bindir}/mydir2/myfile"
> >
> > shows how to include an entire directory -- just list the directory
> > name and the inclusion is recursive.
> >
> >    my colleague had initially used the notation "dirname/*", and i
> > pointed out that the "*" wildcard was superfluous since, you know,
> > recursive, but he showed me the sample he had used from bitbake.conf,
> > which *does* include that wildcard:
> >
> >    FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ...
> >
> > i couldn't immediately explain why bitbake.conf used the wildcard, as
> > the only difference i could imagine is that explicitly using the "*"
> > wildcard would ignore hidden paths, but that seemed like a weak
> > explanation.
> >
> >    is there some subtlety i'm missing?
> >
>
> Did you ever figure this one out?
>
> I started to look into it quickly because I vaguely remember some gotchas
> around including directories and symlinks we ran into at my previous company
> years ago.
>
> I'm assuming you want to have a look at populate_packages() in
> meta/lib/oe/package.py.
> It'll eventually call oe.package.files_from_filevars() which runs
> glob.glob(path, recursive=True) on each path. The issue is that:
>
> >>> import glob
> >>> glob.glob('./tools/', recursive=True)
> ['./tools/']
> >>> glob.glob('./tools', recursive=True)
> ['./tools']
> >>> glob.glob('./tools/*', recursive=True)
> ['./tools/accounting', './tools/arch', './tools/bootconfig', './tools/bpf',
> './tools/build', './tools/cgroup', './tools/counter', './tools/debugging',
> './tools/firewire', './tools/firmware', './tools/gpio', './tools/hv',
> './tools/iio', './tools/include', './tools/kvm', './tools/laptop',
> './tools/leds', './tools/lib', './tools/memory-model', './tools/objtool',
> './tools/pci', './tools/pcmcia', './tools/perf', './tools/power',
> './tools/rcu', './tools/scripts', './tools/spi', './tools/testing',
> './tools/thermal', './tools/time', './tools/tracing', './tools/usb',
> './tools/virtio', './tools/wmi', './tools/Makefile', './tools/certs',
> './tools/crypto', './tools/mm', './tools/net', './tools/sched_ext',
> './tools/sound', './tools/verification', './tools/workqueue',
> './tools/writeback']
>
> and I cannot make sense of the rest of the logic in populate_packages() which
> checks whether the path is a directory, and if so, seemingly only runs a
> homegrown version of mkdir -p. Something's not adding up here.
>
> Note that glob.glob() doesn't return hidden files by default, c.f.
> https://docs.python.org/3/library/glob.html#glob.glob (feature only added in
> Python 3.11 anyway, which we haven't set as our minimally supported version).

  I'd totally forgotten about this, so I just did a test and got the
same weirdness so I checked the docs:

https://docs.python.org/3/library/glob.html

"If recursive is true, the pattern “**” will match any files and zero
or more directories, subdirectories and symbolic links to
directories..."

  The way I read that, the recursive parameter has an effect only when
you're using the "**" pattern, and would appear to have no value here.
So it seems you definitely need the trailing "/*" to get directory
contents.

rday
--8323329-1276494466-1781110167=:1559767--

