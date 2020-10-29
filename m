Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.6616.1603966966987881823
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 03:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.109.234
Received: from [192.168.13.190] (80-110-109-234.cgn.dynamic.surfer.at [80.110.109.234])
	(Authenticated sender: foss@0leil.net)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F27401C0004;
	Thu, 29 Oct 2020 10:22:41 +0000 (UTC)
Date: Thu, 29 Oct 2020 11:22:39 +0100
In-Reply-To: <CAP71WjxjpKNusUURNydfrTg4G0G0BQUaEq9J4vTmDE2c4xA1bA@mail.gmail.com>
References: <df8f2d4e-30c5-d267-dbae-a67aaf4bcc6@crashcourse.ca> <C5C2A97D-AC35-4DB6-B87B-BDD016352296@0leil.net> <8f84fc1d-714e-aea1-5afd-7e667c1979b@crashcourse.ca> <CAP71WjxjpKNusUURNydfrTg4G0G0BQUaEq9J4vTmDE2c4xA1bA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [docs] adding more glossary links in the glossary
To: docs@lists.yoctoproject.org,Nicolas Dechesne <nicolas.dechesne@linaro.org>,"Robert P. J. Day" <rpjday@crashcourse.ca>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
From: "Quentin Schulz" <foss@0leil.net>
Message-ID: <571F73BC-E49B-4AEC-9A56-8F9F2F927B89@0leil.net>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On October 29, 2020 10:18:58 AM GMT+01:00, Nicolas Dechesne <nicolas=2Edec=
hesne@linaro=2Eorg> wrote:
>On Thu, Oct 29, 2020 at 10:12 AM Robert P=2E J=2E Day
><rpjday@crashcourse=2Eca> wrote:
>>
>> On Thu, 29 Oct 2020, Quentin Schulz wrote:
>>
>> > Hi Robert,
>> >
>> > On October 29, 2020 9:13:31 AM GMT+01:00, "Robert P=2E J=2E Day"
><rpjday@crashcourse=2Eca> wrote:
>> > >
>> > >  finally have time to jump back into docs now that everyone else
>> > >has done all the heavy lifting =2E=2E=2E currently perusing glossary=
 and
>> > >noticed the following right near the top=2E in glossary entry for
>> > >AUTOREV, there is the sentence:
>> > >
>> > >"If you use the previous statement to retrieve the latest version
>of
>> > >software, you need to be sure PV contains ${SRCPV}=2E"
>> > >
>> > >  that last bit, the "${SRCPV}" part, is set up as a glossary link
>via
>> > >the =2Erst content:
>> > >
>> > >  `${``\ :term:`SRCPV`\ ``}``
>> > >
>> > >to get both a glossary link and the appropriate rendering=2E if
>that's
>> > >the way to do it, then it seems there's more in the glossary that
>> > >should be so rendered, as in just above that in AUTO_LIBNAME_PKGS,
>one
>> > >reads:
>> > >
>> > >  "The default value is =E2=80=9C${PACKAGES}=E2=80=9D, =2E=2E=2E"
>> > >
>> > >which has the underlying =2Erst content as, well, exactly that so
>there
>> > >is no glossary link=2E
>> > >
>> > >  is it safe to assume that, over time, things like that should
>> > >eventually be linkified, as in:
>> > >
>> > >  `${``\ :term:`PACKAGES`\ ``}``
>
>This specific syntax bothers me a lot=2E=2E one reason we moved to Sphinx
>was to have 'simple' documentation source and this specific syntax is
>horrifying=2E=2E if it's a pattern we use a lot, perhaps we should create

I've seen it enough times to say it's not uncommon=2E The good news is tha=
t it's probably rather easy to grep the pattern=2E

>a custom role for that, like :term2: for example, so that
>:term2:`PACKAGES` would add the ${} and the fixed-font rendering=2E
>

Makes sense to me, :term_curly: maybe? Just something more explicit than "=
terms" :)

>> > >
>> > >is there any reason you *wouldn't* want to use a glossary link if
>one
>> > >exists?
>> > >
>> >
>> > I seem to recall that only the first occurrence of a "term" in a
>> > page should be "linked" (with :term:``) as to not overload the page
>> > with links for every occurrence of every variable in the glossary=2E
>> > That was discussed on IRC or on the ML, probably in the mails
>> > summing up what was to be done with Sphinx migration=2E
>
>I don't remember discussing that specific thing=2E

Looked for it in the mail archive, couldn't find any and I can't be bother=
ed to look into months of IRC archives, so I probably "dreamed" it=2E

> What would be the
>rationale for limiting the glossary link to 1 per page? performance? I

It can be rather hard to read if all variables in a paragraph are underlin=
ed=2E That's personal taste though=2E

>think the link to glossary terms are useful, and would be more
>inclined to have as many as possible=2E
>

Works for me, what would be a case in which you wouldn't want links to be =
used?

>I even thought about an extension to add links everywhere it's
>possible=2E=2E
>

I could see a plug-in looking for all glossary terms not linked in documen=
ts and display a warning for each of them=2E Inline substitution is too ris=
ky IMHO=2E

Quentin
