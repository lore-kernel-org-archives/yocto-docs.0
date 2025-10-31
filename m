Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54698CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 14:02:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.16137.1761919369443313768
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 07:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=WwrQRxdb;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nUtMNjpwE1jD+4+hD8kkqg0IVdqKo+Qp3wDtlVJtNCQ=; b=WwrQRxdbGQSHoJ/ZJ6nMlazWe5
	YpXmu0p+jc/Qktgt78zkRlWRAyXMGVOvBNoMtgZa/2TEHfmIP2ajI6sJWu0AHTcMatD3piCFbT7fU
	Y3JZ/756fGopNPDxrpE0kpUN+mh/C5jIefBQZxGIb8cfPWxCKpwK6IEgh5GIOSlJjGNXlf4ISQgxJ
	VWyJLJY8yYX/E/bvU8KCWTax+9yuLsdFNstEFW2E8qcCar8jCOnven2k/uyVTo7jj0XKbgy/rXUsB
	wtVA+WNzm7/h8cO2JwZI4wRW2W26Bqf7CTd7rwSbdw8K5OzJQF6QScxQxp+yd5Wm7KCRIrFkvCAWo
	LIazD7Ug==;
Received: from [147.129.179.166] (port=34762 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEpiG-00000005xVL-0uuJ
	for docs@lists.yoctoproject.org;
	Fri, 31 Oct 2025 10:02:47 -0400
Date: Fri, 31 Oct 2025 10:05:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: dev manual, "5.23 Recipe SYntax" ... talking about functions or
 tasks?
Message-ID: <f9c5f224-1015-bb70-f28b-0eccf4c29486@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 14:02:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7951


  i find this section confusing and possibly incomplete:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#recipe-syntax

  The bullet point is labelled "Functions", but almost immediately
switches into referring to a "task function". so is it a function or a
task? what is this meant to refer to? it gets more confusing by
referring to the "function" from sed which is actually the task
do_install(), then goes on to talk about adding new functions between
tasks.

  if this section is meant to explain tasks and not just functions, it
should also mention "addtask". but i'm not sure what point is trying
to be made here.

rday

