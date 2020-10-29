Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.5921.1603961806104489034
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 01:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.109.234
Received: from [192.168.13.190] (80-110-109-234.cgn.dynamic.surfer.at [80.110.109.234])
	(Authenticated sender: foss@0leil.net)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A8E3040004;
	Thu, 29 Oct 2020 08:56:43 +0000 (UTC)
Date: Thu, 29 Oct 2020 09:56:40 +0100
In-Reply-To: <df8f2d4e-30c5-d267-dbae-a67aaf4bcc6@crashcourse.ca>
References: <df8f2d4e-30c5-d267-dbae-a67aaf4bcc6@crashcourse.ca>
MIME-Version: 1.0
Subject: Re: [docs] adding more glossary links in the glossary
To: docs@lists.yoctoproject.org,"Robert P. J. Day" <rpjday@crashcourse.ca>,YP docs mailing list <docs@lists.yoctoproject.org>
From: "Quentin Schulz" <foss@0leil.net>
Message-ID: <C5C2A97D-AC35-4DB6-B87B-BDD016352296@0leil.net>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Robert,

On October 29, 2020 9:13:31 AM GMT+01:00, "Robert P=2E J=2E Day" <rpjday@c=
rashcourse=2Eca> wrote:
>
>  finally have time to jump back into docs now that everyone else has
>done all the heavy lifting =2E=2E=2E currently perusing glossary and noti=
ced
>the following right near the top=2E in glossary entry for AUTOREV, there
>is the sentence:
>
>"If you use the previous statement to retrieve the latest version of
>software, you need to be sure PV contains ${SRCPV}=2E"
>
>  that last bit, the "${SRCPV}" part, is set up as a glossary link via
>the =2Erst content:
>
>  `${``\ :term:`SRCPV`\ ``}``
>
>to get both a glossary link and the appropriate rendering=2E if that's
>the way to do it, then it seems there's more in the glossary that
>should be so rendered, as in just above that in AUTO_LIBNAME_PKGS, one
>reads:
>
>  "The default value is =E2=80=9C${PACKAGES}=E2=80=9D, =2E=2E=2E"
>
>which has the underlying =2Erst content as, well, exactly that so there
>is no glossary link=2E
>
>  is it safe to assume that, over time, things like that should
>eventually be linkified, as in:
>
>  `${``\ :term:`PACKAGES`\ ``}``
>
>is there any reason you *wouldn't* want to use a glossary link if one
>exists?
>

I seem to recall that only the first occurrence of a "term" in a page shou=
ld be "linked" (with :term:``) as to not overload the page with links for e=
very occurrence of every variable in the glossary=2E That was discussed on =
IRC or on the ML, probably in the mails summing up what was to be done with=
 Sphinx migration=2E

In the end, while skimming through the docs for quick simple fixes, the ru=
le is not rigorously applied (sometimes more than one occurrence is "linked=
" in the same page)=2E

However, we at least want all variables to be highlighted with double tick=
 on both sides of it, to show it's a variable=2E

Quentin
