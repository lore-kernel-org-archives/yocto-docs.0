Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0514DCCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 13:28:38 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web01.6140.1761744512113670226
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 06:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=fm9npMt6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xwotTfzwAR41nqEXmqD0GzVIENtZcwzbQkC0BgGgW0Q=; b=fm9npMt6iGnZ4jyLUbc/Xg9uB1
	HhVEthkuO+3MvKLoltnohsjPnYRJv0tv9VTSiUMeZ7XEKyBht+WqAunNuK0ouljvPTCGF00JOECWU
	aeg02ixMcp+GsrpSyWONGbgjNZMCn1n0bXkPZ9t+p2t/ASt4UPQfrhWdRIcDJSJMTAY4wYROIR8Qo
	bwTaQSZHD1gbd8XFL96yRwnPKgF+mYRXn0+wwFlfqMGdtfcHWlR4oQD6e+G8OUoVssLyYyOP0uIVD
	DE9oa7DHpg+Smw9qS0eCNCgomO/5fw+3GmP2HYBnbKmyFnkMoC10pMC4pXRWamqHnVzXSFn776otK
	QJdKgamw==;
Received: from [147.129.179.166] (port=55200 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vE6Dz-0000000GK58-2v4g
	for docs@lists.yoctoproject.org;
	Wed, 29 Oct 2025 09:28:30 -0400
Date: Wed, 29 Oct 2025 09:31:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: why the structure of the YP docs seems awkward to me
Message-ID: <9a3b6d71-3cea-1c78-9d7d-d65103b5bc20@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 13:28:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7901


  (sort of a general rant about what seems like a lack of a coherent
theme in the YP docs -- i mentioned this briefly before.)

  i'll explain what i mean with an actual example, and that is in this
section:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#fetching-code

there is a single sentence which discusses the FILESOVERRIDES
variable:

  "The OpenEmbedded build system uses FILESOVERRIDES for scanning
  directory locations for local files in SRC_URI."

and that's it -- the entire explanation of that variable. except that,
yes, it does link to the reference manual here:

https://docs.yoctoproject.org/ref-manual/variables.html#term-FILESEXTRAPATHS

well, actually, that's the ref manual entry for FILESEXTRAPATHS; i did
that because all three of those consecutive variables appear to me to
have the same flaw as many others.

  the problem i see is that, in the docs proper, in many cases, there
is a lack of proper explanation of important features, and the
explanation is simply dumped into the reference manual. to me, this is
backwards.

  IMHO, everything that needs explaining should exist somewhere in the
main guides and manuals. anything in the "reference manual" should be
little more than a paragraph or two that summarizes something, then
redirects the reader to the more complete explanation in the
appropriate manual. in short, the reference manual should *not* be the
definitive explanation of anything; rather, it should briefly describe
some topic, then "refer" the reader to the proper location for the
more comprehensive coverage of that topic.

  in many cases, as i said, it seems this is being done in the
opposite order -- for example, the dev manual makes a brief reference
to FILESOVERRIDES, then leaves it to the reference manual to do all
the heavy lifting, which seems backwards to me.

  thoughts?

rday

