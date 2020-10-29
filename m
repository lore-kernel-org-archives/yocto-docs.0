Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.3694.1604004824394144586
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 13:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:40324 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYEvW-001qdi-M3; Thu, 29 Oct 2020 16:53:43 -0400
Date: Thu, 29 Oct 2020 16:53:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is there a rationale for the numerous "^::$" lines:
In-Reply-To: <CAP71Wjxe2w+=vh4L3E5MV03DyLPzt9C+9y17T4U+1ezKY8YL0A@mail.gmail.com>
Message-ID: <f8af4db-88ce-a093-595-2bb821c1a9cc@crashcourse.ca>
References: <415b35f9-a6-b311-3522-20e76cf6593c@crashcourse.ca> <CAP71Wjxe2w+=vh4L3E5MV03DyLPzt9C+9y17T4U+1ezKY8YL0A@mail.gmail.com>
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

On Thu, 29 Oct 2020, Nicolas Dechesne wrote:

> On Thu, Oct 29, 2020 at 8:58 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
>
> you are correct, they are equivalent. we've been rushing with these
> changes, and it's lack of consistency
>
> >   just noticed the myriad of .rst content of the form:
> >
> >   ... blah blah woof woof:
> >   ::
> >
> >      code snippet
> >
> > if memory serves, that would be equivalent to the simpler:
> >
> >   ... blah blah woof woof::
>
> I tend to prefer this form, and I tried to use this one for the files
> I edited.. We should agree on which one to use, and fix
> inconsistencies.

  if no one objects, i can probably whip up a perl script this weekend
and transmogrify all of this to the shorter form for consistency.

rday
