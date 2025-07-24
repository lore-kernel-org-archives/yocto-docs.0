Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36701C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 15:20:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.33.1753370432748778671
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 08:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=c2Ns7ShX;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4NGoarWoZAPZOus3K1vgX77R1LkpNH8uDu9mq/vw0Uk=; b=c2Ns7ShXYvUqwfuVtxnw4/dtW9
	vtWZfbMkqEM/alhEH/o4K18dkP6L4gv7a1WK9g8Kf9ud0BZe+D0ezfMDRZETLZG0O5MzJNBXK/MGZ
	eZ0C0YL2/4x3XdLjQYfaZdEC5PbZudBwGoYSOZIdh0JmlmiEaSu+ocmdgMmpoCmNlPBOP//17P+DC
	PFs0N0b9DVOBOPcxHEijw81mMG+xyZkr8rYaOcPacF57L0h/xnY4ancZv2EM0hzggUUi2QTDcUeek
	BOTjO1E7S+E1jCOEOvb7bjpSczaxuS50q7Hy9mzxsj9TMIGMxQ9ed1GIHzEcbEd2muNTO8xpUf8EJ
	dTfmqR7A==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:50202 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uexk9-0000000EG3j-18AS
	for docs@lists.yoctoproject.org;
	Thu, 24 Jul 2025 11:20:29 -0400
Date: Thu, 24 Jul 2025 11:20:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: want to clarify a few things about OVERRIDES
Message-ID: <d6138660-ae8e-f8df-f8d0-994f1011564d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 24 Jul 2025 15:20:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7376


  i think the explanation of overrides in the docs could use some
tweaking so a few questions and nitpicks.

  using "qemuarm64" as my example, i can see the OVERRIDES that are
set via "bitbake -e perf" for the perf recipe (broken over two lines
for aesthetics):

OVERRIDES="linux:aarch64:pn-perf:layer-core:qemuall:aarch64:
  qemuarm64:poky:class-target:toolchain-gcc:libc-glibc:forcevariable"

so far, so good.

  my first observation is that, when an override is combined with
"append:", that "append" bit shouldn't be described as just another
"override". IMHO, it's an *operator*, as in, it's just a variation of
"+=", which one would never describe as an "override", so when you see
something like this:

  SRC_URI:append:qemuarm = ...

to me, that's SRC_URI, then the append operator, followed by an
override -- it's just the way i like to interpret it.

  next, when you have *multiple* overrides, like here:

  CFLAGS:append:powerpc:libc-musl = ...

i assume that *all* of the overrides must be satisfied (in this case,
powerpc and the MUSL C library have to be selected).  but when you
have multiple overrides, it only makes sense if those overrides are
orthogonal to each other, which makes this snippet from bitbake.conf
potentially confusing:

# Overrides are processed left to right, so the ones that are named later take precedence.
# You generally want them to go from least to most specific. This means that:
# A variable '<foo>:arm' overrides a variable '<foo>' when ${TARGET_ARCH} is arm.
# A variable '<foo>:qemuarm' overrides '<foo>' and overrides '<foo>:arm' when ${MACHINE} is 'qemuarm'.
# If you use combination ie '<foo>:qemuarm:arm', then '<foo>:qemuarm:arm' will override
# '<foo>:qemuarm' and then '<foo>' will be overriden with that value from '<foo>:qemuarm'.

  that expression "<foo>:qemuarm:arm" makes no sense to me since
qemuarm is clearly(?) a subset of arm, so why would you ever combine
those two overrides in the same expression? i think anyone trying to
understand overrides reading that comment is going to be confused.

  thoughts?

rday

