Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C24CCFA00
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 13:47:34 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5697.1762004844263539939
 for <docs@lists.yoctoproject.org>;
 Sat, 01 Nov 2025 06:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=FeOOGGcq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v/Sm7mxpOSt/fak+oFxfHuA2nsg3d6wk9jrjjPFU8Ok=; b=FeOOGGcqaBo3i9d9/av/bbZN+f
	Jk1dxyFEOFMQRu8yORT31cHFBbFtTcBIpq/LfXv7JXvgCzYsgHtWgunUDxfomzC0jd4AQkFw3a9J5
	AQGJYYTMSiLa/ItX26xX3W6FyqR7dJtJ1rcV0QqPozBYk0axWowKYK35IS/j/MJE6vFOICCm/LiMZ
	xHvxsw+6QgODcz/V7E3O1SMFgd7jzYNHA1juM5dEXzqenJ+bzvtOBKZv8pkmnR7zyAPM4rphFUkJs
	CL0M/Cbtr4HJtnIJ4qIENrzOHMBlWoWDK9J1sJkATtIYoOeklBGx9JDmLHXq+NqXjDI+NxTAxohFV
	7Z1Ac7mw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:52204 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vFBwr-00000009T6N-2IIe
	for docs@lists.yoctoproject.org;
	Sat, 01 Nov 2025 09:47:21 -0400
Date: Sat, 1 Nov 2025 09:46:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: examples and docs for COMPATIBLE_MACHINE are inconsistent and
 incomplete
Message-ID: <67c6ae2d-687d-6679-c5a8-c2492a807ad2@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 01 Nov 2025 13:47:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7961


  i know i've whinged on about this before, but the docs discussing
COMPATIBLE_MACHINE:

https://docs.yoctoproject.org/dev-manual/new-machine.html#adding-a-kernel-for-the-machine
https://docs.yoctoproject.org/ref-manual/variables.html#term-COMPATIBLE_MACHINE

don't match up, and also aren't consistent with some of its usage, and
also doesn't cover the variations in the meta-yocto-bsp layer.

  first, are the strings provided to that variable normal REs, such
that they will match longer strings in which they are a substring?
that seems to be the rationale for the anchors ^ and $, correct? so
this example in the dev manual does not do what the typical reader
would expect (at least it's not explained if it would match longer
strings if that's what the example is supposed to show):

  COMPATIBLE_MACHINE = '(qemux86|qemumips)'

or am i misunderstanding? given this other example in the variable
glossary:

  COMPATIBLE_MACHINE = "^(aarch64|mips64)$"

the average reader would be entirely entitled to be confused.

  next, parentheses would seem to be superfluous, as in these examples
ripped from the code base:

meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb:COMPATIBLE_MACHINE =
"qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemuriscv32|qemux86|qemux86-64"

(again, without the ^ and $ anchors, it would be possible to match
longer strings, yes?)

  i don't see in the docs any mention that you can use wildcard
patterns, such as:

meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb:COMPATIBLE_MACHINE = "^qemu.*$"

  finally, there are these override usages from meta-yocto-bsp:

linux-yocto-dev.bbappend:COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
linux-yocto-dev.bbappend:COMPATIBLE_MACHINE:genericx86 = "genericx86"
linux-yocto-dev.bbappend:COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
linux-yocto-dev.bbappend:COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
linux-yocto_6.12.bbappend:COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
linux-yocto_6.12.bbappend:COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
linux-yocto_6.12.bbappend:COMPATIBLE_MACHINE:genericx86 = "genericx86"
linux-yocto_6.12.bbappend:COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
linux-yocto_6.16.bbappend:COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
linux-yocto_6.16.bbappend:COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
linux-yocto_6.16.bbappend:COMPATIBLE_MACHINE:genericx86 = "genericx86"
linux-yocto_6.16.bbappend:COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"

whose usage is not explained in the docs.


rday

