Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.11122.1604049444622829429
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 02:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:57658 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYQXC-004GLy-Hg; Fri, 30 Oct 2020 05:17:23 -0400
Date: Fri, 30 Oct 2020 05:17:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: Quentin Schulz <foss@0leil.net>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] normalize use of trailing "::" across docs
In-Reply-To: <CAP71Wjz4hOBfQj-9xvoO6V9TFX911_9aJ-rSdawK8WYLGb3p3A@mail.gmail.com>
Message-ID: <b9bb1df6-c11f-db3b-314e-49f92adfb5d8@crashcourse.ca>
References: <afdb4476-bdb4-3df0-be7-457ebd473db0@crashcourse.ca> <c550db4b55fbc2b77d0a96d87ab5edf1@0leil.net> <9c9a716-3c2a-a663-8fb2-3b9d274cab@crashcourse.ca> <CAP71Wjz4hOBfQj-9xvoO6V9TFX911_9aJ-rSdawK8WYLGb3p3A@mail.gmail.com>
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

On Fri, 30 Oct 2020, Nicolas Dechesne wrote:

> On Fri, Oct 30, 2020 at 7:38 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > On Thu, 29 Oct 2020, Quentin Schulz wrote:
> >
> > > Hi Robert,
> > >
> > > On 2020-10-29 23:00, Robert P. J. Day wrote:
> > > > Rather than terminate a line with a single ":" and follow that up with
> > > > a line of simply "::" to start a code block, we can simply terminate
> > >
> > > I think it's actually called a literal block? (was looking for documentation
> > > on this :) ).
> > > https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks
> >
> >   before i repair the patch i sent out, it's clearly worth asking if
> > this normalization is worth it, or would it just be unnecesasry churn
> > for no significant benefit? i'm fine either way.
>
> I think it is good to add consistency, so yes. It might indeed be a
> little tricky to find the right regexp (or set of). perhaps you can
> include the snippet you used for the transformation in the commit
> message, so that we can review that as well.

  as an admittedly brute force command that catches all the really
obvious stuff, there's this:

  $ perl -0777 -pi -e 's/:\n::\n/::\n/g' <file>.rst

that would probably make a good first pass and would catch quite a
lot.

rday
