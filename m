Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.6053.1603962749558011503
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 02:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:60304 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kY3yt-00H0bo-SJ; Thu, 29 Oct 2020 05:12:28 -0400
Date: Thu, 29 Oct 2020 05:12:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <foss@0leil.net>
cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] adding more glossary links in the glossary
In-Reply-To: <C5C2A97D-AC35-4DB6-B87B-BDD016352296@0leil.net>
Message-ID: <8f84fc1d-714e-aea1-5afd-7e667c1979b@crashcourse.ca>
References: <df8f2d4e-30c5-d267-dbae-a67aaf4bcc6@crashcourse.ca> <C5C2A97D-AC35-4DB6-B87B-BDD016352296@0leil.net>
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
Content-Type: multipart/mixed; boundary="8323328-605735893-1603962747=:11715"

--8323328-605735893-1603962747=:11715
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Oct 2020, Quentin Schulz wrote:

> Hi Robert,
>
> On October 29, 2020 9:13:31 AM GMT+01:00, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
> >
> >  finally have time to jump back into docs now that everyone else
> >has done all the heavy lifting ... currently perusing glossary and
> >noticed the following right near the top. in glossary entry for
> >AUTOREV, there is the sentence:
> >
> >"If you use the previous statement to retrieve the latest version of
> >software, you need to be sure PV contains ${SRCPV}."
> >
> >  that last bit, the "${SRCPV}" part, is set up as a glossary link via
> >the .rst content:
> >
> >  `${``\ :term:`SRCPV`\ ``}``
> >
> >to get both a glossary link and the appropriate rendering. if that's
> >the way to do it, then it seems there's more in the glossary that
> >should be so rendered, as in just above that in AUTO_LIBNAME_PKGS, one
> >reads:
> >
> >  "The default value is “${PACKAGES}”, ..."
> >
> >which has the underlying .rst content as, well, exactly that so there
> >is no glossary link.
> >
> >  is it safe to assume that, over time, things like that should
> >eventually be linkified, as in:
> >
> >  `${``\ :term:`PACKAGES`\ ``}``
> >
> >is there any reason you *wouldn't* want to use a glossary link if one
> >exists?
> >
>
> I seem to recall that only the first occurrence of a "term" in a
> page should be "linked" (with :term:``) as to not overload the page
> with links for every occurrence of every variable in the glossary.
> That was discussed on IRC or on the ML, probably in the mails
> summing up what was to be done with Sphinx migration.

  i can understand that in the sense of having a single link as a
"first term", but i can also see how that doesn't properly apply to a
glossary, as one normally does not read a glossary top down -- in
fact, it's far more likely that one showed up there following a link
to the specific term they were interested in. in that sense, a "page"
would be more aptly represented by a single glossary entry. if you
look at it that way, then the middle ground would be that the first
term in any single glossary entry would be a link, and not the rest of
them in that glossary entry.

  sorry if this was already hashed out before, just an observation.

rday

--8323328-605735893-1603962747=:11715--
