Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9C6C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 09:06:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.23184.1750583194314610073
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 02:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=nUXuaSNM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+7ck/dhQEipbxtkJXE/nxv/L7EHDQymePT3cw4evgD0=; b=nUXuaSNMW/VlCtaHfPIt347nRL
	iYtfUc3f9gZW1j6WwSdJSuXzo0jTqfDSVMEAUeSZQ66SN+HIAFRGGmaTcA79ZyViG+pKe7QXRWo8a
	dXpsUl6t/4FPXRGGOCTuY85a9oRFEqhwQ0RE2xfuh+yapiuayXBID7Vl/z1mtx3PMi/a5cdG3UquT
	kDeE6aW0glW178wtNCYcmLXljamzeXAnt/SzCkEkkYvuxGb/6icP+iBMnNquSyo2jQpcxhihYpyaZ
	zRkCKScN2fhiFdmlfOS/ZuawPr5patuSER7DMFp1uZkRp0tIGKhsWNrExEFbuFPBvTLA3OyO5c56l
	dKzk3j0Q==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:46854 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTGek-00000006sfG-3XCE
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 05:06:32 -0400
Date: Sun, 22 Jun 2025 05:06:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should replicating offline build use "--runonly" or "--runall"?
Message-ID: <21a4cea0-be3b-9d89-9261-fd7466a4655b@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 09:06:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7134


  this section:

https://docs.yoctoproject.org/dev-manual/building.html#replicating-a-build-offline

advises to fetch the sources with:

  $ bitbake target --runonly=fetch

for the longest time now, i've used:

  $ bitbake target --runall=fetch

although i do recall that those behaviours changed once upon a time.
so is that still the appropriate command to use? is it worth adding an
explanation at that point as to the difference for people who might be
curious?

rday

