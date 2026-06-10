Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8E4CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 18:09:23 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27426.1781114958955484254
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 11:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GhtciKUh;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7RrG/RbPMSa+8lDaHyjo/Qhocp6gLgWoZX0JTth7NzE=; b=GhtciKUheHXtWkrI8fQNVHbGp2
	R4YlNGWi5x1DF4JYWQne+Vu9g2BKIfbacn14twDTUQbE/t+le/hieDZh9sqio66cQUSXNVDWviYxr
	TTtCxNz3PZxdP7lQcvwhk7KKBBl8J014LEH0PbMLAFKY+qVpaVT7fqFPLOJiGtVZZdYaS5hyI1G/R
	Peo+z9m0z1dirJqKWDzz9APCcqGCi290c7uJyRqN3IHt6/GEfmIg/gYdUyGYjrL9Jp8V2rkuqyO7j
	8k0o/yDh+fPZsi5S7FcSbQdbPAUWD7aR1DCKDS4A03JaKaXtFnmlLmxplF057XT9UL4WtPVfNmvfZ
	0nF/DAQA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53634 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXNMW-00000009VJk-3yQM;
	Wed, 10 Jun 2026 14:09:17 -0400
Date: Wed, 10 Jun 2026 14:09:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "FILES" glossary entry does not mention including
 "dirname/*"
In-Reply-To: <18B7C644517F9389.267903@lists.yoctoproject.org>
Message-ID: <be6f394a-c742-6159-012e-31b499cad2d3@crashcourse.ca>
References: <b3fa7dbe-ace4-86ea-b747-fce12c32125c@crashcourse.ca> <aa51821d-03fd-4e28-9c67-7d0cf0a2802c@cherry.de> <18B7C644517F9389.267903@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1160962067-1781114952=:1572288"
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
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 18:09:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9686

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1160962067-1781114952=:1572288
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 10 Jun 2026, Robert P. J. Day wrote:

> On Wed, 10 Jun 2026, Quentin Schulz wrote:
>
> > Hi Robert,
> >
> > On 5/29/26 1:00 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > >
> > >    explaining to a colleague how to properly define a package's
> > > "FILES:${PN}" value, and noticed that the explanation here:
> > >
> > >    https://docs.yoctoproject.org/ref-manual/variables.html#term-FILES
> > >
> > > has a subtle distinction from the default value in bitbake.conf. in
> > > the glossary, the sample setting:
> > >
> > >    FILES:${PN} += "${bindir}/mydir1 ${bindir}/mydir2/myfile"
> > >
> > > shows how to include an entire directory -- just list the directory
> > > name and the inclusion is recursive.
> > >
> > >    my colleague had initially used the notation "dirname/*", and i
> > > pointed out that the "*" wildcard was superfluous since, you know,
> > > recursive, but he showed me the sample he had used from bitbake.conf,
> > > which *does* include that wildcard:
> > >
> > >    FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ...
> > >
> > > i couldn't immediately explain why bitbake.conf used the wildcard, as
> > > the only difference i could imagine is that explicitly using the "*"
> > > wildcard would ignore hidden paths, but that seemed like a weak
> > > explanation.
> > >
> > >    is there some subtlety i'm missing?
> > >
> >
> > Did you ever figure this one out?
> >
> > I started to look into it quickly because I vaguely remember some gotchas
> > around including directories and symlinks we ran into at my previous company
> > years ago.
> >
> > I'm assuming you want to have a look at populate_packages() in
> > meta/lib/oe/package.py.
> > It'll eventually call oe.package.files_from_filevars() which runs
> > glob.glob(path, recursive=True) on each path. The issue is that:
> >
> > >>> import glob
> > >>> glob.glob('./tools/', recursive=True)
> > ['./tools/']
> > >>> glob.glob('./tools', recursive=True)
> > ['./tools']
> > >>> glob.glob('./tools/*', recursive=True)
> > ['./tools/accounting', './tools/arch', './tools/bootconfig', './tools/bpf',
> > './tools/build', './tools/cgroup', './tools/counter', './tools/debugging',
> > './tools/firewire', './tools/firmware', './tools/gpio', './tools/hv',
> > './tools/iio', './tools/include', './tools/kvm', './tools/laptop',
> > './tools/leds', './tools/lib', './tools/memory-model', './tools/objtool',
> > './tools/pci', './tools/pcmcia', './tools/perf', './tools/power',
> > './tools/rcu', './tools/scripts', './tools/spi', './tools/testing',
> > './tools/thermal', './tools/time', './tools/tracing', './tools/usb',
> > './tools/virtio', './tools/wmi', './tools/Makefile', './tools/certs',
> > './tools/crypto', './tools/mm', './tools/net', './tools/sched_ext',
> > './tools/sound', './tools/verification', './tools/workqueue',
> > './tools/writeback']
> >
> > and I cannot make sense of the rest of the logic in populate_packages() which
> > checks whether the path is a directory, and if so, seemingly only runs a
> > homegrown version of mkdir -p. Something's not adding up here.
> >
> > Note that glob.glob() doesn't return hidden files by default, c.f.
> > https://docs.python.org/3/library/glob.html#glob.glob (feature only added in
> > Python 3.11 anyway, which we haven't set as our minimally supported version).
>
>   I'd totally forgotten about this, so I just did a test and got the
> same weirdness so I checked the docs:
>
> https://docs.python.org/3/library/glob.html
>
> "If recursive is true, the pattern “**” will match any files and zero
> or more directories, subdirectories and symbolic links to
> directories..."
>
>   The way I read that, the recursive parameter has an effect only when
> you're using the "**" pattern, and would appear to have no value here.
> So it seems you definitely need the trailing "/*" to get directory
> contents.

  Let me correct what I wrote using an example from bitbake.conf:

    FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
            ${base_bindir}/* ${base_sbindir}/* \
            ${base_libdir}/*${SOLIBS} \
            ${base_prefix}/lib/udev ${prefix}/lib/udev \
            ${base_libdir}/udev ${libdir}/udev \
            ${datadir}/${BPN} ${libdir}/${BPN}/* \
            ${datadir}/pixmaps ${datadir}/applications \
            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
            ${libdir}/bonobo/servers"

the above assignment bounces around between using "/*" (like in the
first line), then not using it (like in the second line), then jumps
back and forth from then on, so obviously you don't *need* that "/*"
so, as you suggest, there must be more processing going in under the
hood.

rday
--8323329-1160962067-1781114952=:1572288--

