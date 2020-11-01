Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.17869.1604251700910814299
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Nov 2020 09:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:38746 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kZH9P-00FgmE-2n; Sun, 01 Nov 2020 12:28:19 -0500
Date: Sun, 1 Nov 2020 12:28:15 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] adding some semantic markup back into .rst files
In-Reply-To: <CAP71WjxF2ns_tL86yCB8pXyZS_YpxR7g5sPTDGK4Ai8RTf0dag@mail.gmail.com>
Message-ID: <be38c084-d99d-efe1-8cd4-6b9ed7387de8@crashcourse.ca>
References: <19b4d4c8-7bfe-4096-8ed-d82e61487bc2@crashcourse.ca> <CAP71WjxF2ns_tL86yCB8pXyZS_YpxR7g5sPTDGK4Ai8RTf0dag@mail.gmail.com>
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

On Sun, 1 Nov 2020, Nicolas Dechesne wrote:

> On Sun, Nov 1, 2020 at 12:05 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   one of the things that i liked about docbook was the semantic
> > markup that could be customized for individual tags, such that a
> > <filename> could be rendered differently from a <command> using
> > XSLT stylesheets and so on. at the moment, things like that are
> > all lumped together in the .rst files by marking them up with
> > ``blah`` double backquotes, losing all that distinction. it
> > wouldn't be hard to put back just a *little* of those semantics by
> > using the more obvious roles.
>
> I like the idea.. however there is one issue/limitation.. the roles
> cannot be used in the context of directives, so we wouldn't be able
> to use them in a 'literal block' for example, and I think that's an
> important limitation. Can you check that? Perhaps I missed
> something. I agree that removing the "replaceable" semantic was a
> bad thing.. but that's one 'role' which is used primarily in code
> blocks..

  i'd already thought of that, and am experimenting to see what can
and can't be done with those.

rday
