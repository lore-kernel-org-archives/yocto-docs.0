Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185CFC44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:18:03 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1512.1783700277129285748
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 09:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=K3nWMMku;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j3oYGffWD6QqFgtEvUAzimr3Enkm0ORF0KNBGOei+M8=; b=K3nWMMkuPwve0ZJsx3XrMn290w
	pIUKQNCERjZIJXQF3de0vK/FTaTk+kfkqUkf9GgXNsPYLW3nXUE5IJQ1EV7p8uONwUJ08D8NYUF+f
	v6HnES5OWEdqV1qem2txpqyq2iUPxuJsPCZPPeWNWYz2Me2ytugEZVYxPDue5ZIe/tyxfE1qXhy7k
	nSKYTZU4jmpUQ/6uv8345phXSLy3xk7ZKKdCK31F2DLjqzKN4jPOLgbw15ynL5J0QVMbr9ZJJxxmD
	t0neKzibeTAvyYfmEy/Z84xmugzEEWXgeaG8KmNGRBDanxNaKlBdfqfZgOWESYYT+1/84cVb358E1
	R38meUrw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54736 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wiDvF-00000009GiN-1Y2K
	for docs@lists.yoctoproject.org;
	Fri, 10 Jul 2026 12:17:55 -0400
Date: Fri, 10 Jul 2026 12:17:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should task entries (particularly kernel tasks) mention file/directory
 names?
Message-ID: <43202f4d-3e43-1f3e-9cd0-10580a4d70ab@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 16:18:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10067


  as i follow the logic of all the kernel-related tasks and make some
notes, it seems that their explanations could benefit from the
inclusion of which files and directories they're working with.

  example: do_shared_workdir():

https://docs.yoctoproject.org/ref-manual/tasks.html#do-shared-workdir

which opens with:

"After the kernel has been compiled but before the kernel modules have
been compiled, this task copies files required for module builds and
which are generated from the kernel build into the shared work
directory."

  ok, but there is no hint as to where the kernel compilation was
done, and where the files are copied *from*, and "into the shared work
directory". sure, but where is the "shared work directory?"

  is there any value in enhancing these task explanations with actual
file or directory name variables so readers could understand where all
this activity is taking place? or is that going a bit too far?

rday

