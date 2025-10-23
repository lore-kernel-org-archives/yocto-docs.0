Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB86CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:44:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.17912.1761219837543132379
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 04:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HOMe5Dak;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jju1294OOoVj/4VY2tSXbSu6mKxldZHGhYMlEeKTB4U=; b=HOMe5Dakpi3wHQYnAXTF4nrEh0
	LgYnmxlHgcyqOOtkUUaXL/JOdHthjJpV40InvEOP2pzSNB3RPEJoIwfsR68qbr3wVizuDJnf5fI5E
	3Yzookh+6Bd55SHw09sHD0jMuNoxQuvGNUvgyRXCUrYuy4PVX51qhd2zUsw4MVoa61tc51mBXwkU/
	/hNPWGGe7Ff4gLjA75XLRZfv3zeRlI71NtuYaWFuhFlfLqqoeRiQy/QLMi18jEjmYhz6EgqCp+eYw
	knZP5f9cRq/1McDpQApysJxf9zdfh8uZZgw7OHGwLB3zKUU88fFKTQxnA47ir6kPUt2iaZwwTHo3F
	VoPyDu6w==;
Received: from [147.129.179.166] (port=44224 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBtjR-0000000CAJz-2SJp
	for docs@lists.yoctoproject.org;
	Thu, 23 Oct 2025 07:43:55 -0400
Date: Thu, 23 Oct 2025 07:46:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: summary of observations for overview manual, chapter 2
Message-ID: <1994ea5f-2ea1-094c-66ee-faf26f0d5791@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 23 Oct 2025 11:44:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7783


  full list of observations for:

https://docs.yoctoproject.org/overview-manual/yp-intro.html#

(including ones i posted yesterday, just so it's all in one place).

* typo in first graphic, "YP-Comptible"

* reference to "ECOSYSTEM" tab on YP home page, but i don't see such a
tab at that page

* "commercial Linux vendors such as Wind River, Mentor Graphics,
Timesys, and ENEA could take it and provide ongoing support." That
list of vendors certainly looks like it could use updating, perhaps
with a link to a more current page.

* i believe "ENEA" is properly rendered as "Enea".

* there is a reference to Clutter, but Clutter's own web site suggests
it's being retired: https://blogs.gnome.org/clutter/. should that list
of available system components, "X11, Wayland, GTK+, Qt, Clutter, and
SDL" include XWayland as well? or be updated in any other way?

* "produces packages in standard formats (i.e. RPM, DEB, IPK, and
TAR)" ... i through tar format was obsoleted a while back. also, right
after that, "by using utilities on the target such as rpm or ipk" ...
i thought the ipk-related utility was opkg. is that not what that
should say? and add "apt".

* "Hob, which is now deprecated ..."  is it merely deprecated, or
should it be described more forcefully as unsupported and obsolete?


  that should do it for that section.

rday

