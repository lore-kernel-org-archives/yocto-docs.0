Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F88CD8CB9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 15:37:38 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82943.1781019449603239767
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 08:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hgTqYyCW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jEAXaj6+QLskRnS6F6TNVzIME6kAClROP1UY5rT33QI=; b=hgTqYyCWFU9I4Y1hoBa5pXhhqR
	qvZX11jbwZtOCLvzwguMSG2ssdpbSzVUehcCW4k5XFy4h4clCDqCtf04aCfy9bwWA2sy8VgNiBFLc
	tBd7b8VqrTO1mrLwnAfxoXFGr00ImDfrDAYZFqAzYb+mM+qr4JX64WqbZHPZc62juWwc+zvGEUl9S
	yQKFFNWvw1UUJpoOojnhMyJQQvlbIHr89GhXt9NSqesOw3oncK+FlPMD34CQU8P7R4aWteV+iI2d2
	dDbp/NyRPUgf+r2Tuu5gvQjsNTTWwDsSj3hZFpT40S0BI92oGqDpQrRuiogrJoQzHZpvqNdIWOh/j
	e5+XBEOQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:44818 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wWyW7-00000006TCZ-0p2y
	for docs@lists.yoctoproject.org;
	Tue, 09 Jun 2026 11:37:28 -0400
Date: Tue, 9 Jun 2026 11:37:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: some questions about "Post-Installation Scripts" section
Message-ID: <1a3cabf4-b125-abd1-ac52-a45007cc9103@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 15:37:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9664


i'm curious about the content of this section:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#post-installation-scripts

  let's start with the first sentence:

"Post-installation scripts run immediately after installing a package
on the target or during image creation when a package is included in
an image."

  my understanding until now is that scripts defined with
"pkg_postinst" can run at one of two times:

  1) on the build host when a package is installed in the image, or
  2) on the target *during first boot*

that first sentence suggests it can be run "after installing a package
on the target". that doesn't sound right, is that supposed to mean at
first boot? it seems confusing.

  next, that entire section makes no mention of the use of checking
the "$D" variable, which is still widely used to check the context of
the execution of that routine (on-host versus on-target).

  consider a fairly straightforward example from the alsa-state.bb
recipe:

  pkg_postinst:${PN}() {
    if test -z "$D"
    then
      if test -x ${sbindir}/alsactl
      then
        ${sbindir}/alsactl -g -f ${localstatedir}/lib/alsa/asound.state restore
      fi
    fi
  }

this is clearly(?) meant to run only at first boot as the entire body
of the function is surrounded by the test for empty $D, so this one's
easy.

  (side question: should that routine simply have used
pkg_postinst_ontarget? would that have been exactly equivalent?)

a somewhat stranger example is from keymaps_1.0.bb:

  PACKAGE_WRITE_DEPS:append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
  pkg_postinst:${PN} () {
    if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
      if [ -n "$D" ]; then
        OPTS="--root=$D"
      fi
      systemctl $OPTS mask keymap.service
    fi
  }

this one confuses me since the test for a non-zero $D surrounds only
*part* of the function, suggesting it's possible to run on the target
at first boot, but surely the bb library functions are not available
at that time, are they?  i'm not sure how to interpret that one.

  in any event, it seems that at the very least, that section needs to
explain the widespread use of the testing of $D to control execution.

rday

