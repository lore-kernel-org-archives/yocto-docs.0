Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20310CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:43:51 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.11293.1761313429542236696
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 06:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QJ8COisZ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pHzWPp7pVMPbMVXK0HE/TDzYNKGEkeSO5BzuoKEidl0=; b=QJ8COisZeHyMoJ45/zqLVf/4Jo
	KKkhlZcE7AzWMWDhOp+pENDJ8XgaG2YJovI3WE+V+sZc4j7haRuy/fNA3H8PBNT69CqxYKzwQvGVp
	Hitp4nkoV1bXi+vC9HdTwoOBFZVm2PkxJn7CYNiBgQYw/UlQmVmT4vZE9qXMkMmxoFomD+WVmDP3T
	8S+ggH/LkP0P9k++b2LZGK8KhVDOqtUMTEow1tVF77LnyoQSZUcXiUtMPg2BLcWp3AGbsywcYOpWP
	LdYUIT7di0ytQowBqfoAqqXTe8zGcRpYbYfnYktz2BP9Ll/Sv7mWjEwy63H7s6JobC/sTpoUgrcdz
	hNZmHKoA==;
Received: from [147.129.179.166] (port=49912 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCI52-0000000GSpd-0Wm3
	for docs@lists.yoctoproject.org;
	Fri, 24 Oct 2025 09:43:48 -0400
Date: Fri, 24 Oct 2025 09:46:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: we *need* an earlier and better explanation for "container layers"
Message-ID: <fd973751-adb0-636f-a9f1-b22f63573e60@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1861212478-1761313588=:3956356"
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
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:43:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7818

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1861212478-1761313588=:3956356
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  i recall quite some time back i asked for clarification as to how to
describe git checkouts that fetched not just a YP layer, but also one
or more sub-layers in that same checkout, and how that should be
described, and the consensus was that these would be described as
"container layers," but it seems that the docs are doing a poor and
misleading job of properly explaining this.

  first, this section from the BSP guide (from near the bottom of this
section):

https://docs.yoctoproject.org/bsp-guide/bsp.html#bsp-layers

  Some layers function as a layer to hold other BSP layers. These
  layers are known as “container layers”. An example of this type of
  layer is OpenEmbedded’s meta-openembedded layer.

yowch, that's misleading as it suggests that container layers are a
feature exclusively related to BSP layers. and then it goes on to use,
as an example, meta-openembedded which isn't even a BSP layer. so
here's my thinking.

  *very* early (in whatever manual this makes sense for), explain the
structure of a "layer", and clarify that, in *many* cases, a layer is
equivalent to a single Git checkout. example:

  https://git.yoctoproject.org/meta-virtualization/tree/

that would be the first part of the explanation, as it's a layer that
is fetched with a single git checkout, and you would add that to your
bblayers.conf file by that name. simple enough.

  next, single git checkouts that fetch multiple layers, the perfect
example of course being meta-openembedded, wherein while this is
fetched with a single git command, meta-openembedded is not in itself
a layer, so your bblayers.conf file would need to refer to whatever
sub-layer you were interested in, but never to meta-openembedded
itself.

  finally, there is the most complicated example, where a single git
checkout fetches both a top-level layer, *and* some sub-layers:

  https://git.yoctoproject.org/meta-security/tree/

i realize all of this sounds trivially simple to denizens of this
list, but i recall those many years ago how i was confused as to how
these "layers" worked when there were these different combinations not
clearly explained.

  thoughts?

rday


--8323329-1861212478-1761313588=:3956356--

