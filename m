Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.9955.1604039882960541247
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 23:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:56322 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYO2z-003jZn-8q; Fri, 30 Oct 2020 02:38:01 -0400
Date: Fri, 30 Oct 2020 02:37:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <foss@0leil.net>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] normalize use of trailing "::" across docs
In-Reply-To: <c550db4b55fbc2b77d0a96d87ab5edf1@0leil.net>
Message-ID: <9c9a716-3c2a-a663-8fb2-3b9d274cab@crashcourse.ca>
References: <afdb4476-bdb4-3df0-be7-457ebd473db0@crashcourse.ca> <c550db4b55fbc2b77d0a96d87ab5edf1@0leil.net>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Oct 2020, Quentin Schulz wrote:

> Hi Robert,
>
> On 2020-10-29 23:00, Robert P. J. Day wrote:
> > Rather than terminate a line with a single ":" and follow that up with
> > a line of simply "::" to start a code block, we can simply terminate
>
> I think it's actually called a literal block? (was looking for documentation
> on this :) ).
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks

  before i repair the patch i sent out, it's clearly worth asking if
this normalization is worth it, or would it just be unnecesasry churn
for no significant benefit? i'm fine either way.

rday
