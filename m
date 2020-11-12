Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.2140.1605174905110026838
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 01:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4CWxm64gFgz5tl9;
	Thu, 12 Nov 2020 10:55:02 +0100 (CET)
Date: Thu, 12 Nov 2020 10:55:01 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: shantanoo.desai@gmail.com,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] First Contact + Dedicated Tasks for Documentation
Message-ID: <20201112095501.sujj5ixfqc42okaa@qschulz>
References: <6MSa.1605119899931248809.4eHV@lists.yoctoproject.org>
 <CAP71WjzH03194HxtTwPEe+ThxAQXCnZ=pwn_KF8meJ=r_gbF9Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjzH03194HxtTwPEe+ThxAQXCnZ=pwn_KF8meJ=r_gbF9Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shan,

On Wed, Nov 11, 2020 at 07:51:37PM +0100, Nicolas Dechesne wrote:
> hi Shan!
>=20
> On Wed, Nov 11, 2020 at 7:38 PM <shantanoo.desai@gmail.com> wrote:
> >
> > Hi everybody,
> >
> > I am making an Initial Contact with the docs community after the YP S=
ummit Europe 2020.

Welcome to the Yocto Project documentation community o/

> >
> > I have started to look into the docs code base and was wondering if t=
here are any dedicated tasks/bugs that are open. I looked into the Bugzil=
la List for General Docs and will try to help out if there is something I=
 can contribute to, but apart from that is there some other list I should=
 be looking into for Docs?
>=20
> I gave a few hints in my talk at the Summit:
>=20
> *Automatic conversion was imperfect, many typos or glitches left over:
> here i think there is a lot to do here. Basically, it's taking manuals
> one by one, and finding visual glitches (and fixing them) or finding
> issues in the .rst files.

FWIW, I've done such a thing for all documents you can find on the left
navigation panel up to Profile and Tracing manual (excluded). Obviously
I might have missed a few things but right now I'd say the biggest need
is for reviewing the others at least once properly and thoroughly.

What I usually was looking for:
 - Broken indentation (broken litteral code blocks or missing new lines
 in litteral code blocks),
 - Broken links (click on all of them and see if it does something :),
 some are obviously broken even in the HTML rendering so they are easy
 to catch,
 - Missing "highlights" (double ticks), often in litteral code blocks,
 you can usually see those in the code source because you have one word
 on one line only. To know if it's supposed to be a double tick ("simple
 highlight") or a reference link (:ref:``), compare with 3.1.3
 documentation page,
 - Changes from http to https links (and check they are still working),
 - Always compile with -W SPHINXOPTS to not send patches which are
 "regressions",
 - If you have experience with Yocto, try also to identify outdated
 (or incorrect) documentation and fix them (separate patch though),
 - Look for typos or grammatical errors (:set spell in vim was helpful),

Then the same needs to be done for the bitbake documentation I guess.

It's very time consuming, so be kind with yourself if it takes an
abnormal amount of time to your taste.

Have fun and happy contributing!
Quentin

> * Offline documentation (PDF-like). sphinx can generate pdf, but we
> haven't looked into that yet.
> * Improve main page, nice looking front page example
> (https://projectacrn.github.io/latest/index.html)
> * Improve =E2=80=98search box=E2=80=99, perhaps with DocSearch (see
> https://docsearch.algolia.com/ and http://docs.coala.io/en/latest/)
> * Backport Sphinx docs for YP 3.1 LTS (dunfell): This task was
> discussed on the list a couple of weeks ago. I think we have a plan
> for it. we just need to do it, so perhaps not much to do here for you,
> i suppose it's something Steve and I should look at.
> * Better integration with Yocto Project website, now that
> http://yoctoproject.org/docs redirects to docs.yp.org, the user
> experience is not 'great', since we effectively leave the website. I
> am not sure how to fix that, and I am not sure I will ever know.. so
> if you have any skills in this area that might be useful (our website
> is based on wordpress).
